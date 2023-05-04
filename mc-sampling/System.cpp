#include "System.h"
#include <chrono>
#include <cmath>

#define CHUNK_SIZE 4096

/*
 * PUBLIC
 */

System::System(int num_part)
    : N(num_part), gen(rd()), runif(std::uniform_real_distribution<double>(0, 1)) {
    for (int i = 0; i < 3; ++i) {
        x[i] = new double[N];
    }
}

System::~System() {
    for (int i = 0; i < 3; ++i) {
        delete[] x[i];
    }
}

void System::init_config(double side, double temp) {
    // set private variables
    L = side;
    T = temp;

    // set random initial positions
    for (int i = 0; i < 3; ++i) {
        for (int j = 0; j < N; ++j) {
            x[i][j] = L * runif(gen); // initialize in (0, L)
        }
    }
}

void System::evolve(int num_steps, double max_disp, std::FILE* pos_file,
                    std::FILE* ene_file, bool print_energy) {
    dr = max_disp;

    for (int t = 0; t < num_steps; ++t) {
        step();
        if (print_energy)
            print_ene(ene_file);
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
        // store current position
        for (int j = 0; j < 3; ++j) {
            x_old[j] = x[j][i];
        }
        // kick the current particle
        // if kick fails, restore the position and continue
        if (!kick(i)) {
            for (int j = 0; j < 3; ++j) {
                x[j][i] = x_old[j];
            }
            continue;
        }
        // potential difference
        dU = potential() - U;

        // if dU is <= 0, accept the move (i.e. do nothing)
        // otherwise, restore previous position with
        // prob = boltzmann factor
        if (dU > 0 && runif(gen) > exp(-dU / T)) {
            for (int j = 0; j < 3; ++j) {
                x[j][i] = x_old[j];
            }
        }
    }
}

bool System::kick(int i_k) {
    for (int i = 0; i < 3; ++i) {
        x[i][i_k] += dr * (2 * runif(gen) - 1); // btw -dr and +dr
        if (x[i][i_k] < 0) {
            return false;
        } else if (i < 2 && x[i][i_k] > L) {
            return false;
        }
    }

    return true;
}

double System::potential() {
    // distance between two atoms
    double r[3];
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < (N - 1); ++i) {
        // add gravitational part
        pot += gamma * x[2][i];
        for (int j = i + 1; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < 3; ++k) {
                r[k] = x[k][i] - x[k][j];
                r2 += r[k] * r[k];
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
