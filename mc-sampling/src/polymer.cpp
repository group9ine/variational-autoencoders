#include "polymer.hpp"
#include <cfloat>
#include <cmath>
#include <random>

#define RMIN2 1.259921 // minimum of LJ potential
#define RCUT2 9.0
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

    // put first particle in a random position inside the box
    for (int i = 0; i < DIM; ++i) {
        x[0][i] = L * runif(gen);
    }

    for (int i = 1; i < N; ++i) {
        // generate a random vector on unit sphere
        double dx[DIM];
        ranmove(dx);

        // displace previous position to get new site
        for (int j = 0; j < DIM; ++j) {
            double x_new = x[i - 1][j] + dx[j];
            // if it stays inside OK, else move in the other direction
            if (0 < x_new && x_new < L) {
                x[i][j] = x_new;
            } else {
                x[i][j] = x_new - 2 * dx[j];
            }
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
            // add attractive LJ
            if (r2 > RMIN2)
                continue;
            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 1 + 4 * (sr6 * sr6 - sr6);
        } else {
            // add full LJ
            if (r2 > RCUT2)
                continue;
            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 4 * (sr6 * sr6 - sr6);
        }
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
        // add attractive LJ
        if (r2 < RMIN2) {
            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 1 + 4 * (sr6 * sr6 - sr6);
        }

        // continue the loop over the following particles
        for (int j = i + 2; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < DIM; ++k) {
                r = x[i][k] - x[j][k];
                r2 += r * r;
            }

            // add full LJ potential
            if (r2 > RCUT2)
                continue;
            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 4 * (sr6 * sr6 - sr6);
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
