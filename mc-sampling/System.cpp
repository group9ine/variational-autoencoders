#include "System.h"
#include <chrono>
#include <cmath>

#define CHUNK_SIZE 4096

/*
 * PUBLIC
 */

System::System(int _N, double _gamma, double _dr)
    : N(_N), gamma(_gamma), dr(_dr),
      // set a seed using clock
      gen{static_cast<std::uint32_t>(
          std::high_resolution_clock::now().time_since_epoch().count())} {
    for (int i = 0; i < 3; ++i)
        x[i] = new double[N];
}

System::~System() {
    for (int i = 0; i < 3; ++i)
        delete[] x[i];
}

void System::init_config(double radius, double height, double temp) {
    // set private variables
    R = radius;
    T = temp;

    // random coordinate generators r = radius, t = angle, z = height
    std::uniform_real_distribution<double> r(0, R);
    std::uniform_real_distribution<double> t(0, 2 * M_PI);
    std::uniform_real_distribution<double> z(0, 2 * height);

    double rho, theta;
    for (int i = 0; i < N; ++i) {
        // x = r * cos(t), y = r * sin(t), z = z
        rho = r(gen);
        theta = t(gen);
        x[0][i] = rho * cos(theta);
        x[1][i] = rho * sin(theta);
        x[2][i] = z(gen);
    }
}

void System::evolve(int num_steps, std::FILE* out_file) {
    for (int t = 1; t <= num_steps; ++t)
        step();

    print_pos(out_file);
}

/*
 * PRIVATE
 */

void System::step() {
    double U, dU;
    std::uniform_real_distribution<double> runif(0, 1);
    for (int j = 0; j < 3; ++j) {
        for (int i = 0; i < N; ++i) {
            // calculate potential before flip
            U = potential();
            // store current position
            for (int k = 0; k < 3; ++k)
                x_old[k] = x[k][i];
            // kick the current particle
            // if kick fails, restore the position and continue
            if (!kick(i)) {
                for (int k = 0; k < 3; ++k)
                    x[k][i] = x_old[k];
                continue;
            }
            // potential difference
            dU = potential() - U;

            // if dU is <= 0, accept the move (i.e. do nothing)
            // otherwise, restore previous position with
            // prob = boltzmann factor
            if (dU > 0 && runif(gen) > exp(-dU / T)) {
                for (int k = 0; k < 3; ++k)
                    x[k][i] = x_old[k];
            }
        }
    }
}

bool System::kick(int i_k) {
    std::uniform_real_distribution<double> d(0, dr);
    for (int i = 0; i < 3; ++i)
        x[i][i_k] += 2 * d(gen) - 1; // btw -1 and 1

    // check if still inside the box
    // otherwise return false (failed kick)
    if ((x[2][i_k] < 0)
        || (x[0][i_k] * x[0][i_k] + x[1][i_k] * x[1][i_k] > R * R))
        return false;
    return true;
}

double System::potential() {
    // distance between two atoms
    double r[3];
    // sq. mod. of r and 1/r^6
    double r2, 1r6;

    pot = 0.0;
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
                1r6 = 1.0 / (r2 * r2 * r2);
                pot += 4 * (1r6 * 1r6 - 1r6)
            }
        }
    }

    // add last particle's gravitational pot
    pot += gamma * x[2][N - 1];

    return pot
}

void print_pos(std::FILE* file) const {
    char buf[CHUNK_SIZE + 64]; // 4kb + ~ one line

    int buf_cnt = 0;
    for (int i = 0; i < N; ++i) {
        buf_cnt += std::sprintf(&buf[buf_cnt], "%d %d %d\n",
                                x[0][i], x[1][i], x[2][i]);

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
    if (buf_cnt > 0) {
        std::fwrite(buf, buf_cnt, 1, file);
    }
}
