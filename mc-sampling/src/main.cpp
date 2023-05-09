#include "System.h"
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>

int main(int argc, const char* argv[]) {
    if (argc != 7) {
        std::cerr << "Usage: ./main [output file prefix] "
                  << "[N] [L] [T] [Nt] [dr]\n";
        return -1;
    }

    // read parameters
    std::string prefix = argv[1];
    int N = std::atoi(argv[2]);
    double side = std::atof(argv[3]);

    // particles per side if they were in a cubic lattice
    int n = int(ceil(pow(double(N), 1.0 / 3)));
    if (side / n) {
        std::cerr << "Particles are too close,"
                  << "choose better next time. WAH\n";
    }

    double temp = std::atof(argv[4]);
    int nsteps = std::atoi(argv[5]);
    double dr = std::atof(argv[6]);

    std::stringstream params;
    params << "_" << N << "_" << side << "_" << temp << "_" << nsteps
           << "_" << dr;
    prefix += params.str();

    std::FILE* pos_file
        = std::fopen(("dump/" + prefix + "_x.txt").c_str(), "w");
    std::FILE* ene_file
        = std::fopen(("dump/" + prefix + "_U.txt").c_str(), "w");
    // start system and evolve
    System sys(N, side);
    // last two arguments decide whether to print energy and positions
    // at every timestep
    sys.evolve(nsteps, temp, dr, pos_file, ene_file, true, true);

    // close out files
    std::fclose(pos_file);
    std::fclose(ene_file);

    return 0;
}
