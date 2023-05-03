#ifndef _SYSTEM_INCLUDED_
#define _SYSTEM_INCLUDED_

#include <fstream>
#include <random>

class System {
public:
    System(int num_part, double pot_param); // constructor

    // assignment stuff
    System(const System& x) = delete;
    System& operator=(const System& x) = delete;

    ~System(); // destructor

    void init_config(double radius, double temp);
    void evolve(int num_steps, double max_disp, std::FILE* out_file);

private:
    int N;
    double gamma;    // mu * g * sigma / epsilon (adimensional)
    double T;        // temperature
    double R;        // box radius
    double* x[3];    // positions array
    double x_old[3]; // to store old position of kicked particle
    double dr;       // (maximum) random displacement

    double r_cut = 3.0; // cutoff radius
    double r_cut2 = r_cut * r_cut;

    std::mt19937 gen; // random generator

    void step();        // function for single MC step
    bool kick(int i_k); // kick particle at index i_k
    double potential(); // specify the kicked particle

    void print_pos(std::FILE* file) const; // print out positions
};

#endif
