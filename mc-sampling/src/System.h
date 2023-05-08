#ifndef _SYSTEM_INCLUDED_
#define _SYSTEM_INCLUDED_

#include <fstream>
#include <random>

class System {
public:
    System(int num_part, double dist); // constructor

    // assignment stuff
    System(const System& x) = delete;
    System& operator=(const System& x) = delete;

    ~System(); // destructor

    void evolve(int num_steps, double temp, double max_disp,
                std::FILE* pos_file, std::FILE* ene_file,
                bool print_energy);

private:
    int N;
    double gamma = 1e-13; // mu * g * sigma / epsilon (adimensional)
    double T;             // temperature
    double d;             // inter-particle distance in the initial lattice
    double L;             // box side
    double* x[3];         // positions array
    double x_old[3];      // array to store old position of kicked particle
    double dr;            // (maximum) random displacement
    double U, dU;         // potential and pot. diff. for Metropolis
    int nacc;             // number of accepted moves

    double r_cut = 3.0; // cutoff radius
    double r_cut2 = r_cut * r_cut;

    // random uniform generator
    std::mt19937 gen;
    std::uniform_real_distribution<double> runif;

    void step();        // function for single MC step
    void kick(int i_k); // kick particle at index i_k
    double potential();

    void print_pos(std::FILE* file) const; // print out positions
    void print_ene(std::FILE* file) const; // print out potential
};

#endif
