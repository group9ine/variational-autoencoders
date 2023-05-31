#include "metropolis.hpp"
#include <cmath>
#include <iomanip>
#include <iostream>

#define CHUNK_SIZE 4096

mc::metropolis::metropolis(int npart, double side) : N(npart), L(side) {
    x = new double*[N];
    for (int i = 0; i < N; ++i) {
        x[i] = new double[DIM];
    }
}

mc::metropolis::~metropolis() {
    for (int i = 0; i < N; ++i) {
        delete[] x[i];
    }
    delete[] x;
}

void mc::metropolis::evolve(int nsysts, int nsteps, int nsample,
                            double temp, double max_disp,
                            std::FILE* pos_file, std::FILE* ene_file,
                            bool print_energy, bool show_z) {
    T = temp;
    dr = max_disp;

    nrej = 0; // reset rejection counter
    for (int t = 1; t <= nsteps; ++t) {
        step();
        if (print_energy && t % nsample == 0) {
            U = potential_full();
            print_ene(ene_file);

            if (nsysts == 1) {       // print position every nsample
                print_pos(pos_file); // only if there is only one system
            }
        }
    }

    // print average final z if requested
    if (show_z) {
        double avg_z = 0.0;
        for (int i = 0; i < N; ++i) {
            avg_z += x[i][DIM - 1];
        }
        avg_z /= (N * L);
        std::cout << "Avg. z / L: " << std::fixed << avg_z << "\t";
    }

    if (nsysts > 1) {
        // print final position
        print_pos(pos_file);
    }

    // add newline to energy file
    if (print_energy) {
        char nl[] = {'\n'};
        std::fwrite(nl, 1, 1, ene_file);
    }

    double arate = 1 - double(nrej) / (N * nsteps);
    std::cout << "Acc. rate: " << std::fixed << arate;
}

void mc::metropolis::step() {
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
        if (dU > 0 && runif(gen) > exp(-dU / T)) {
            nrej += 1;
            for (int j = 0; j < DIM; ++j) {
                x[i][j] = x_old[j];
            }
        }
    }
}

void mc::metropolis::kick(int k) {
    double x_new;
    for (int j = 0; j < DIM; ++j) {
        x_old[j] = x[k][j];
        x_new = x_old[j] + dr * (2 * runif(gen) - 1); // btw -dr and +dr
        if (0 < x_new && x_new < L) {
            x[k][j] = x_new;
        } // else keep the old position (~ bounce back)
    }
}

void mc::metropolis::print_pos(std::FILE* file) const {
    char buf[CHUNK_SIZE + 64]; // 4kb + ~ one line

    int buf_cnt = 0;
    for (int i = 0; i < N; ++i) {
#if DIM == 2
        buf_cnt += std::sprintf(&buf[buf_cnt], "%f %f ", x[i][0], x[i][1]);
#elif DIM == 3
        buf_cnt += std::sprintf(&buf[buf_cnt], "%f %f %f ", x[i][0],
                                x[i][1], x[i][2]);
#endif
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

void mc::metropolis::print_ene(std::FILE* file) const {
    char buf[64];
    int size = std::sprintf(&buf[0], "%f ", U);
    std::fwrite(buf, size, 1, file);
}
