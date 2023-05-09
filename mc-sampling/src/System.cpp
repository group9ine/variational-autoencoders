#include "System.h"
#include <cmath>
#include <iostream>

#define CHUNK_SIZE 4096

/*
 * PUBLIC
 */

System::System(int npart, double side, double g)
    : N(npart), L(side), gamma(g) {
    x = new double*[N];
    for (int i = 0; i < N; ++i) {
        x[i] = new double[3];
    }

    // set up random number generator
    std::random_device rd;
    gen = std::mt19937(rd());
    runif = std::uniform_real_distribution<double>(0, 1);

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < 3; ++j) {
            x[i][j] = L * runif(gen); // generate btw 0 and L
        }
    }
}

System::~System() {
    for (int i = 0; i < N; ++i) {
        delete[] x[i];
    }
    delete[] x;
}

void System::evolve(int nsteps, double temp, double max_disp,
                    std::FILE* pos_file, std::FILE* ene_file,
                    bool print_energy, bool print_mid_pos) {
    T = temp;
    dr = max_disp;

    for (int t = 0; t < nsteps; ++t) {
        step();
        // print positions inside the loop if wanted
        if (print_mid_pos) {
            print_pos(pos_file);
        }
        // print energy every 50 timesteps
        if (print_energy && t % 50 == 0) {
            U = potential_full();
            print_ene(ene_file);
        }
    }

    // if we don't middle positions, print at least the final one
    if (!print_mid_pos) {
        print_pos(pos_file);
    }

    std::cout << "Acceptance rate: " << 1 - double(nrej) / (N * nsteps)
              << std::endl;
}

/*
 * PRIVATE
 */

void System::step() {
    for (int i = 0; i < N; ++i) {
        // calculate potential before flip
        U = potential_one(i);
        // kick the current particle
        kick(i);
        // potential difference
        dU = potential_one(i) - U;
        // if dU is <= 0, accept the move (i.e. do nothing)
        // otherwise, restore previous position with
        // prob = boltzmann factor
        if (dU > 0 && runif(gen) > std::exp(-dU / T)) {
            nrej += 1;
            for (int j = 0; j < 3; ++j) {
                x[i][j] = x_old[j];
            }
        }
    }
}

void System::kick(int k) {
    double kick;
    for (int j = 0; j < 2; ++j) {
        x_old[j] = x[k][j];
        kick = x_old[j] + dr * (2 * runif(gen) - 1); // btw -dr and +dr
        // periodic boundary conditions
        x[k][j] = kick > 0 ? kick - L : kick + L;
    }

    // in z we want to bounce on the floor
    x_old[2] = x[k][2];
    kick = x_old[2] + dr * (2 * runif(gen) - 1);
    if (kick < 0) {
        x[k][2] = -kick;
    } else if (kick > L) {
        x[k][2] = 2 * L - kick;
    } else {
        x[k][2] = kick;
    }
}

double System::potential_one(int k) {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    // start with gravitational potential
    double pot = gamma * x[2][k];
    // loop over all other particles
    for (int i = 0; i < N; ++i) {
        if (i != k) {
            r2 = 0.0;
            for (int j = 0; j < 3; ++j) {
                r = x[i][j] - x[k][j];
                r2 += r * r;
            }

            // if radius less than cut, add to U
            if (r2 < r_cut2) {
                sr6 = 1.0 / (r2 * r2 * r2);
                pot += 4 * (sr6 * sr6 - sr6);
            }
        }
    }

    return pot;
}

double System::potential_full() {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < (N - 1); ++i) {
        // add gravitational part
        pot += gamma * x[i][2];
        for (int j = i + 1; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < 3; ++k) {
                r = x[i][k] - x[j][k];
                r2 += r * r;
            }

            // if radius less than cut, add to U
            if (r2 < r_cut2) {
                sr6 = 1.0 / (r2 * r2 * r2);
                pot += 4 * (sr6 * sr6 - sr6);
            }
        }
    }

    // add last particle's gravitational pot
    pot += gamma * x[N - 1][2];

    return pot;
}

void System::print_pos(std::FILE* file) const {
    char buf[CHUNK_SIZE + 64]; // 4kb + ~ one line

    int buf_cnt = 0;
    for (int i = 0; i < N; ++i) {
        buf_cnt += std::sprintf(&buf[buf_cnt], "%f %f %f ", x[i][0],
                                x[i][1], x[i][2]);

        // if chunk is big enough, write it
        if (buf_cnt >= CHUNK_SIZE) {
            // buf = array to write
            // buf_cnt = size of array
            // 1 = number of objects to be written
            std::fwrite(buf, buf_cnt, 1, file);
            buf_cnt = 0;
        }
    }

    // write final newline
    buf_cnt += std::sprintf(&buf[buf_cnt], "\n");
    std::fwrite(buf, buf_cnt, 1, file);
}

void System::print_ene(std::FILE* file) const {
    char buf[64];
    int size = std::sprintf(&buf[0], "%f\n", U);
    std::fwrite(buf, size, 1, file);
}
