#include "polymer.hpp"
#include <cfloat>
#include <cmath>
#include <random>

#define RMIN 1.122462 // minimum of LJ potential
#define RMIN2 1.259921
#define INF DBL_MAX

mc::polymer::polymer(int npart, double side, double bond_k, double bond_l)
    : mc::metropolis(npart, side), k(bond_k), R0(bond_l), R02(R0 * R0),
      kR02(0.5 * k * R02) {}

mc::polymer::~polymer() {
    // destruction of x is performed in base class
}

void mc::polymer::init_config() {
    // set up random generator
    std::random_device rd;
    gen = std::mt19937(rd());
    runif = std::uniform_real_distribution<double>(0, 1);

    // linear initialization
    for (int i = 0; i < N; ++i) {
        x[i][0] = 0.5 * (L + 2 * i - N);
        for (int j = 1; j < DIM; ++j) {
            x[i][j] = 0.5 * L;
        }
    }
}

double mc::polymer::potential_one(int k) const {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < N; ++i) {
        if (i == k)
            continue;

        // get square distance
        r2 = 0.0;
        for (int j = 0; j < DIM; ++j) {
            r = x[i][j] - x[k][j];
            r2 += r * r;
        }

        // if prev/next particle in the chain, add chain potential
        if (i == k - 1 || i == k + 1) {
            if (r2 > R02)
                return INF;
            pot -= kR02 * log(1 - r2 / R02);
        }

        // add LJ potential
        sr6 = 1.0 / (r2 * r2 * r2);
        pot += 1 + 4 * (sr6 * sr6 - sr6);
    }

    return pot;
}

double mc::polymer::potential_full() const {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < (N - 1); ++i) {
        // get square distance from next particle
        r2 = 0.0;
        for (int k = 0; k < DIM; ++k) {
            r = x[i][k] - x[i + 1][k];
            r2 += r * r;
        }

        // next particle in the chain --> add chain potential
        if (r2 > R02)
            return INF;
        pot -= kR02 * log(1 - r2 / R02);

        // continue the loop over the following particles
        for (int j = i + 2; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < DIM; ++k) {
                r = x[i][k] - x[j][k];
                r2 += r * r;
            }

            // add LJ potential
            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 1 + 4 * (sr6 * sr6 - sr6);
        }
    }

    return pot;
}

#if DIM == 2
void mc::polymer::ranmove(double* vec) {
    vec[0] = 1 - 2 * runif(gen);
    vec[1] = 1 - 2 * runif(gen);
}
#elif DIM == 3
void mc::polymer::ranmove(double* vec) {
    double ran1, ran2;
    double ransq = 2;
    while (ransq > 1) {
        ran1 = 1 - 2 * runif(gen);
        ran2 = 1 - 2 * runif(gen);
        ransq = ran1 * ran1 + ran2 * ran2;
    }
    double ranh = 2 * sqrt(1 - ransq);

    vec[0] = ran1 * ranh;
    vec[1] = ran2 * ranh;
    vec[2] = 1 - 2 * ransq;
}
#endif
