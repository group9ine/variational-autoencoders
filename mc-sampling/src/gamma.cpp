#include "gamma.hpp"

#define RCUT2 9.0

mc::gamma::gamma(int npart, double side, double gam)
    : mc::metropolis(npart, side), g(gam) {}

mc::gamma::~gamma() {
    // destruction of x is performed in base class
}

void mc::gamma::init_config() {
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

double mc::gamma::potential_one(int k) const {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    // start with gravitational potential
    double pot = g * x[k][DIM - 1];
    // loop over all other particles
    for (int i = 0; i < N; ++i) {
        if (i != k) {
            r2 = 0.0;
            for (int j = 0; j < DIM; ++j) {
                r = x[i][j] - x[k][j];
                r2 += r * r;
            }

            if (r2 > RCUT2)
                continue;

            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 4 * (sr6 * sr6 - sr6);
        }
    }

    return pot;
}

double mc::gamma::potential_full() const {
    // distance between two atoms
    double r;
    // sq. mod. of r and 1/r^6
    double r2, sr6;

    double pot = 0.0;
    for (int i = 0; i < (N - 1); ++i) {
        // add gravitational part
        pot += g * x[i][DIM - 1];
        for (int j = i + 1; j < N; ++j) {
            r2 = 0.0;
            for (int k = 0; k < DIM; ++k) {
                r = x[i][k] - x[j][k];
                r2 += r * r;
            }

            if (r2 < RCUT2)
                continue;

            sr6 = 1.0 / (r2 * r2 * r2);
            pot += 4 * (sr6 * sr6 - sr6);
        }
    }

    // add last particle's gravitational pot
    pot += g * x[N - 1][DIM - 1];

    return pot;
}
