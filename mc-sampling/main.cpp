#include "System.h"
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>

int main(int argc, const char* argv[]) {
    if (argc != 7) {
        std::cerr << "Usage: ./main [output file prefix] "
                  << "[N] [d] [T] [Nt] [dr]\n";
        return -1;
    }

    // read parameters
    std::string prefix = argv[1];
    int N = std::atoi(argv[2]);
    double dist = std::atof(argv[3]);

    if (dist < 1) {
        std::cerr << "Particles are too close, try again. WAH\n";
        return -1;
    }

    double temp = std::atof(argv[4]);
    int num_steps = std::atoi(argv[5]);
    double dr = std::atof(argv[6]);

    std::stringstream params;
    params << "_" << N << "_" << dist << "_" << temp << "_" << num_steps
           << "_" << dr;
    prefix += params.str();

    std::FILE* pos_file
        = std::fopen(("dump/" + prefix + "_x.txt").c_str(), "w");
    std::FILE* ene_file
        = std::fopen(("dump/" + prefix + "_U.txt").c_str(), "w");
    // start system and evolve
    System sys(N, dist);
    sys.evolve(num_steps, temp, dr, pos_file, ene_file, true);

    // close out files
    std::fclose(pos_file);
    std::fclose(ene_file);

    return 0;
}
