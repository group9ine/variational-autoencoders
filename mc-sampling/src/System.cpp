#include "System.h"
#include <cmath>
#include <iomanip>
#include <iostream>

#define CHUNK_SIZE 4096

System::System(int npart, double side, double g)
    : N(npart), L(side), gamma(g) {
    x = new double*[N];
    for (int i = 0; i < N; ++i) {
        x[i] = new double[DIM];
    }
}

System::~System() {
    for (int i = 0; i < N; ++i) {
        delete[] x[i];
    }
    delete[] x;
}

void System::init_config() {
    nrej = 0; // reset rejection counter

    // set up random number generator
    std::random_device rd;
    gen = std::mt19937(rd());
    runif = std::uniform_real_distribution<double>(0, 1);

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < DIM; ++j) {
            x[i][j] = L * runif(gen); // generate btw 0 and L
        }
    }
}

void System::evolve(int nsteps, int nsample, double temp, double max_disp,
                    std::FILE* pos_file, std::FILE* ene_file,
                    bool print_energy, bool show_z) {
    T = temp;
    dr = max_disp;

    for (int t = 1; t <= nsteps; ++t) {
        step();
        if (print_energy && t % nsample == 0) {
            U = potential_full();
            print_ene(ene_file);
        }
    }

    // print average final z if requested
    if (show_z) {
        double avg_z = 0.0;
        for (int i = 0; i < N; ++i) {
            avg_z += x[i][DIM - 1];
        }
        avg_z /= (N * L);
        std::cout << "Average z / L: " << avg_z << "\t\t";
    }

    // print final position
    print_pos(pos_file);

    // add newline to energy file
    if (print_energy) {
        char nl[] = {'\n'};
        std::fwrite(nl, 1, 1, ene_file);
    }

    double arate = 1 - double(nrej) / (N * nsteps);
    std::cout << "Acceptance rate: " << arate << "\r" << std::flush;
}

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
            for (int j = 0; j < DIM; ++j) {
                x[i][j] = x_old[j];
            }
        }
    }
}

void System::kick(int k) {
    double x_new;
    for (int j = 0; j < DIM; ++j) {
        x_old[j] = x[k][j];
        x_new = x_old[j] + dr * (2 * runif(gen) - 1); // btw -dr and +dr
        if (0 < x_new && x_new < L) {
            x[k][j] = x_new;
        } // else keep the old position (~ bounce back)
    }
}

double System::potential_one(int k) const {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    // start with gravitational potential
    double pot = gamma * x[k][DIM - 1];
    // loop over all other particles
    for (int i = 0; i < N; ++i) {
        if (i != k) {
            r2 = 0.0;
            for (int j = 0; j < DIM; ++j) {
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

double System::potential_full() const {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < (N - 1); ++i) {
        // add gravitational part
        pot += gamma * x[i][DIM - 1];
        for (int j = i + 1; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < DIM; ++k) {
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
    pot += gamma * x[N - 1][DIM - 1];

    return pot;
}

void System::print_pos(std::FILE* file) const {
    char buf[CHUNK_SIZE + 64]; // 4kb + ~ one line

    int buf_cnt = 0;
    for (int i = 0; i < N; ++i) {
        if (DIM == 2) {
            buf_cnt
                += std::sprintf(&buf[buf_cnt], "%f %f ", x[i][0], x[i][1]);
        } else if (DIM == 3) {
            buf_cnt += std::sprintf(&buf[buf_cnt], "%f %f %f ", x[i][0],
                                    x[i][1], x[i][2]);
        }

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
    int size = std::sprintf(&buf[0], "%f ", U);
    std::fwrite(buf, size, 1, file);
}
