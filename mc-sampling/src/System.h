#ifndef _SYSTEM_INCLUDED_
#define _SYSTEM_INCLUDED_

#include <fstream>
#include <random>

class System {
public:
    System(int npart, double side, double g); // constructor

    // assignment stuff
    System(const System& x) = delete;
    System& operator=(const System& x) = delete;

    ~System(); // destructor

    void evolve(int nsteps, double temp, double max_disp,
                std::FILE* pos_file, std::FILE* ene_file,
                bool print_energy, bool print_mid_pos);

private:
    int N;
    double L;        // box side
    double gamma;    // mu * g * sigma / epsilon (adimensional)
    double T;        // temperature
    double** x;      // positions array
    double x_old[3]; // array to store old position of kicked particle
    double dr;       // (maximum) random displacement
    double U, dU;    // potential and pot. diff. for Metropolis
    int nrej = 0;    // number of rejected moves

    double r_cut = 3.0; // cutoff radius
    double r_cut2 = r_cut * r_cut;

    // random uniform generator
    std::mt19937 gen;
    std::uniform_real_distribution<double> runif;

    void step();                 // function for single MC step
    void kick(int k);            // kick particle at index k
    double potential_one(int k); // potential of single particle
    double potential_full();     // total potential

    void print_pos(std::FILE* file) const; // print out positions
    void print_ene(std::FILE* file) const; // print out potential
};

#endif
