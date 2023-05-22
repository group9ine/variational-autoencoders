#include "System.h"
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>

int main(int argc, const char* argv[]) {
    // print ASCII art
    std::ifstream logo("logo.txt");
    if (logo.is_open()) {
        std::cout << logo.rdbuf() << '\n';
    }

    if (argc != 2) {
        std::cout << "Usage: ./main [config file]\n";
        return -1;
    }

    // define variables to hold the config parameters
    std::string prefix;
    int n_parts, n_systems, n_steps, n_sample;
    double side, gamma, temp, max_disp;
    bool print_en;

    // read config from file
    std::ifstream cfg(argv[1]);
    std::string line;
    int line_cnt = 0;
    while (std::getline(cfg, line)) {
        // skip comments and empty lines
        if (line.empty() || line[0] == '#') {
            continue;
        }

        line_cnt += 1;

        // split line into key + value
        std::istringstream iss(line);
        std::string key, value;
        std::getline(iss, key, '=');
        std::getline(iss, value);

        // parse the value depending on the key
        if (key == "prefix") {
            prefix = value;
        } else if (key == "n_parts") {
            n_parts = std::stoi(value);
        } else if (key == "side") {
            side = std::stod(value);
        } else if (key == "gamma") {
            gamma = std::stod(value);
        } else if (key == "temp") {
            temp = std::stod(value);
        } else if (key == "max_disp") {
            max_disp = std::stod(value);
        } else if (key == "n_systems") {
            n_systems = std::stoi(value);
        } else if (key == "n_steps") {
            n_steps = std::stoi(value);
        } else if (key == "n_sample") {
            n_sample = std::stoi(value);
        } else if (key == "print_en") {
            print_en = (value == "true") ? true : false;
        }
    }

    if (line_cnt != 10) {
        std::cout
            << "Error in configuration file! Wrong number of parameters\n";
        return -1;
    }

    // particles per side if they were in a cubic lattice
    int n = int(ceil(pow(double(n_parts), 1.0 / DIM)));
    if (side / n < 1) {
        std::cerr << "Oh, look who's caused another issue.\n"
                  << "Surprise, surprise. If you could just take a\n"
                  << "moment to fix the box side length, that would be\n"
                  << "*so* appreciated. We wouldn't want to, you know,\n"
                  << "inconvenience anyone. Heaven forbid. Thanks for\n"
                  << "your *prompt* attention to this matter. Don't\n"
                  << "worry, I'll just sit here and wait for you to\n"
                  << "do your job.\n\n";
    }

    // add config parameters to file prefixes
    std::stringstream params;
    params << "_" << n_parts << "_" << side << "_" << gamma << "_" << temp
           << "_" << max_disp << "_" << n_systems << "_" << n_steps << "_"
           << n_sample;
    prefix += params.str();

    // position and energy files (in append mode to handle all the
    // different generated systems)
    std::FILE* pos_file
        = std::fopen(("dump/" + prefix + "_x.txt").c_str(), "a");
    std::FILE* ene_file
        = std::fopen(("dump/" + prefix + "_U.txt").c_str(), "a");

    // start system and evolve
    System sys(n_parts, side, gamma);
    for (n = 0; n < n_systems; ++n) {
        sys.init_config(); // reset positions
        sys.evolve(n_steps, n_sample, temp, max_disp, pos_file, ene_file,
                   print_en);
    }

    // close out files
    std::fclose(pos_file);
    std::fclose(ene_file);

    return 0;
}
