#include "System.h"
#include <cstdlib>
#include <iostream>
#include <string>

int main(int argc, const char* argv[]) {
    if (argc != 7) {
        std::cerr << "Usage: ./main [output file prefix] "
                  << "[N] [L] [T] [Nt] [dr]\n";
        return -1;
    }

    // read parameters
    std::string prefix = argv[1];
    std::FILE* pos_file
        = std::fopen(("dump/" + prefix + "_x.txt").c_str(), "w");
    std::FILE* ene_file
        = std::fopen(("dump/" + prefix + "_U.txt").c_str(), "w");
    int N = std::atoi(argv[2]);
    double box_side = std::atof(argv[3]);
    double temp = std::atof(argv[4]);
    int num_steps = std::atoi(argv[5]);
    double dr = std::atof(argv[6]);

    // start system and evolve
    System sys(N, box_side);
    sys.evolve(num_steps, temp, dr, pos_file, ene_file, true);

    // close out files
    std::fclose(pos_file);
    std::fclose(ene_file);

    return 0;
}
