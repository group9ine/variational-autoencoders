#include "System.h"
#include <cstdlib>
#include <iostream>
#include <string>

int main(int argc, const char* argv[]) {
    if (argc != 8) {
        std::cerr << "Usage: ./main [output file prefix] "
                  << "[N] [gamma] [R] [T] [Nt] [dr]\n";
        return -1;
    }

    // read parameters
    std::string prefix = argv[1];
    std::FILE* pos_file = std::fopen((prefix + "_x.txt").c_str(), "w");
    std::FILE* ene_file = std::fopen((prefix + "_U.txt").c_str(), "w");
    int N = std::atoi(argv[2]);
    double gamma = std::atof(argv[3]);
    double radius = std::atof(argv[4]);
    double temp = std::atof(argv[5]);
    int num_steps = std::atoi(argv[6]);
    double dr = std::atoi(argv[7]);

    // start system and evolve
    System sys(N, gamma);
    sys.init_config(radius, temp);
    sys.evolve(num_steps, dr, pos_file, ene_file, true);

    // close out files
    std::fclose(pos_file);
    std::fclose(ene_file);

    return 0;
}
