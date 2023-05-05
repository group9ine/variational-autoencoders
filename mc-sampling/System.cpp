#include "System.h"
#include <cmath>
#include <iostream>

#define CHUNK_SIZE 4096

/*
 * PUBLIC
 */

System::System(int num_part, double side) : N(num_part), L(side) {
    for (int i = 0; i < 3; ++i) {
        x[i] = new double[N];
    }

    // set up random number generator
    std::random_device rd;
    gen = std::mt19937(rd());
    runif = std::uniform_real_distribution<double>(0, 1);

    // sigma = minimum distance threshold
    double threshold = 1;

    // set random initial positions
    bool too_close;
    double r, r2;
    for (int i = 0; i < N; ++i) {
        do {
            for (int j = 0; j < 3; ++j) {
                x[j][i] = L * runif(gen);
            }

            // check distance to all previously generated particles
            too_close = false;
            for (int j = 0; j < i; ++j) {
                r2 = 0.0;
                for (int k = 0; k < 3; ++k) {
                    r = x[k][i] - x[k][j];
                    r2 += r * r;
                }
                if (r2 < threshold) {
                    too_close = true;
                    break;
                }
            }
        } while (too_close);
    }
}

System::~System() {
    for (int i = 0; i < 3; ++i) {
        delete[] x[i];
    }
}

void System::evolve(int num_steps, double temp, double max_disp,
                    std::FILE* pos_file, std::FILE* ene_file,
                    bool print_energy) {
    T = temp;
    dr = max_disp;

    int avg_window = int(num_steps / 10);
    for (int t = 0; t < num_steps; ++t) {
        step();
        if (print_energy) {
            print_ene(ene_file);
        }

        if (t % avg_window == 0) {
            double z_mean = 0.0;
            for (int i = 0; i < N; ++i) {
                z_mean += x[2][i];
            }
            z_mean /= N;
            std::cout << z_mean << '\n';
        }
    }

    print_pos(pos_file);
}

/*
 * PRIVATE
 */

void System::step() {
    for (int i = 0; i < N; ++i) {
        // calculate potential before flip
        U = potential();
        // kick the current particle
        kick(i);
        // potential difference
        dU = potential() - U;
        // if dU is <= 0, accept the move (i.e. do nothing)
        // otherwise, restore previous position with
        // prob = boltzmann factor
        if (dU > 0 && runif(gen) < std::exp(-dU / T)) {
            for (int j = 0; j < 3; ++j) {
                x[j][i] = x_old[j];
            }
        }
    }
}

void System::kick(int i_k) {
    double kick;
    for (int i = 0; i < 3; ++i) {
        x_old[i] = x[i][i_k];
        kick = dr * (2 * runif(gen) - 1); // btw -dr and +dr
        if (x_old[i] + kick < 0 || x_old[i] + kick > L) {
            x[i][i_k] -= kick;
        } else {
            x[i][i_k] += kick;
        }
    }
}

double System::potential() {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < (N - 1); ++i) {
        // add gravitational part
        pot += gamma * x[2][i];
        for (int j = i + 1; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < 3; ++k) {
                r = x[k][i] - x[k][j];
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
    pot += gamma * x[2][N - 1];

    return pot;
}

void System::print_pos(std::FILE* file) const {
    char buf[CHUNK_SIZE + 64]; // 4kb + ~ one line

    int buf_cnt = 0;
    for (int i = 0; i < N; ++i) {
        buf_cnt += std::sprintf(&buf[buf_cnt], "%f %f %f ", x[0][i],
                                x[1][i], x[2][i]);

        // if chunk is big enough, write it
        if (buf_cnt >= CHUNK_SIZE) {
            // buf = array to write
            // buf_cnt = size of array
            // 1 = number of objects to be written
            std::fwrite(buf, buf_cnt, 1, file);
            buf_cnt = 0;
        }
    }

    // write remainder
    if (buf_cnt > 0)
        std::fwrite(buf, buf_cnt, 1, file);
}

void System::print_ene(std::FILE* file) const {
    char buf[64];
    int size = std::sprintf(&buf[0], "%f ", U);
    std::fwrite(buf, size, 1, file);
}
