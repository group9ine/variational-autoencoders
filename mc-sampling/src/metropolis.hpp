#ifndef METROPOLIS_INCLUDED
#define METROPOLIS_INCLUDED

#include <fstream>
#include <random>

#define DIM 2

namespace mc {
class metropolis {
public:
    metropolis(int npart, double side); // constructor

    // delete copy constructor and assignment operator
    metropolis(const metropolis& x) = delete;
    metropolis& operator=(const metropolis& x) = delete;

    virtual ~metropolis(); // destructor

    virtual void init_config() = 0;
    void evolve(int nsysts, int nsteps, int nsample, double temp,
                double max_disp, std::FILE* pos_file, std::FILE* ene_file,
                bool print_energy, bool show_z);

protected:
    int N;             // number of particles
    double L;          // box side
    double T;          // temperature
    double** x;        // positions array
    double x_old[DIM]; // array to store old position of kicked particle
    double dr;         // (maximum) random displacement
    double U, dU;      // potential and pot. diff. for Metropolis
    int nrej = 0;      // number of rejected moves

    // random uniform generator
    std::mt19937 gen;
    std::uniform_real_distribution<double> runif;

    void step();      // function for single Metropolis step
    void kick(int k); // kick particle at index k

    // potentials: single particle and total
    virtual double potential_one(int k) const = 0;
    virtual double potential_full() const = 0;

    void print_pos(std::FILE* file) const; // print out positions
    void print_ene(std::FILE* file) const; // print out potential
};
} // namespace mc

#endif
