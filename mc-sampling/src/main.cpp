#include "fake.hpp"
#include "gamma.hpp"
#include "polymer.hpp"
#include <chrono>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

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
    std::string potential;
    std::vector<double> params;
    int n_parts, n_systems, n_steps, n_sample;
    double side, temp, max_disp;
    bool print_en, show_z;

    // read config from file
    std::ifstream cfg(argv[1]);
    if (!cfg.good()) {
        std::cout << "Configuration file not found!\n";
        return -1;
    }

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
        if (key == "potential") {
            // the potential string contains also the parameters,
            // comma-separated --> parse "value" by comma
            std::istringstream valss(value);
            // start by reading name
            std::getline(valss, potential, ',');
            // read the parameters
            std::string par;
            while (valss.good()) {
                std::getline(valss, par, ',');
                params.push_back(std::stod(par));
            }
        } else if (key == "n_parts") {
            n_parts = std::stoi(value);
        } else if (key == "side") {
            side = std::stod(value);
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
        } else if (key == "show_z") {
            show_z = (value == "true") ? true : false;
        }
    }

    if (line_cnt != 10) {
        std::cout
            << "Error in configuration file: wrong number of parameters\n";
        return -1;
    }

    if (potential != "poly" && potential != "gamma"
        && potential != "fake") {
        std::cout << "Error in configuration file: unknown potential\n";
        return -1;
    }

    // print out info about chosen potential
    std::cout << "Potential '" << potential << "' with ";
    if (potential == "poly") {
        std::cout << "k = " << params[0] << ", R_0 = " << params[1]
                  << '\n';
    } else if (potential == "gamma") {
        std::cout << "gamma = " << params[0] << '\n';
    } else if (potential == "fake") {
        std::cout << "p = " << int(params[0]) << ", gamma = " << params[1]
                  << '\n';
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
    std::stringstream fname_ss;
    fname_ss << "_";
    for (double& p : params) {
        fname_ss << p << "_";
    }
    fname_ss << n_parts << "_" << side << "_" << temp << "_" << max_disp
             << "_" << n_systems << "_" << n_steps << "_" << n_sample;
    std::string prefix = potential + fname_ss.str();

    // position and energy files (in append mode to handle all the
    // different generated systems)
    std::FILE* pos_file
        = std::fopen(("dump/" + prefix + "_x.txt").c_str(), "a");
    std::FILE* ene_file
        = std::fopen(("dump/" + prefix + "_U.txt").c_str(), "a");

    // define timers
    auto begin = std::chrono::high_resolution_clock::now();
    auto middle = std::chrono::high_resolution_clock::now();
    auto end = std::chrono::high_resolution_clock::now();
    // length of one step in the n_systems loop
    std::chrono::duration<double> t_step = end - begin;
    double mins_left;

    // start system and evolve
    mc::metropolis* sys;
    if (potential == "poly") {
        sys = new mc::polymer(n_parts, side, params[0], params[1]);
    } else if (potential == "gamma") {
        sys = new mc::gamma(n_parts, side, params[0]);
    } else if (potential == "fake") {
        sys = new mc::fake(n_parts, side, int(params[0]), params[1]);
    }

    for (n = 0; n < n_systems; ++n) {
        begin = middle;
        middle = std::chrono::high_resolution_clock::now();

        sys->init_config(); // reset positions
        sys->evolve(n_systems, n_steps, n_sample, temp, max_disp, pos_file,
                    ene_file, print_en, show_z);

        // running average of elapsed time
        t_step = t_step + (end - begin - t_step) / (n + 1);
        mins_left = (t_step * (n_systems - n) / 60).count();
        // print out remaining time
        std::cout << "\tTime left: " << std::setw(4) << (int)(mins_left)
                  << " m " << std::setw(2)
                  << (int)((mins_left - (int)(mins_left)) * 60) << " s\r"
                  << std::flush;

        end = std::chrono::high_resolution_clock::now();
    }

    // close out files
    std::fclose(pos_file);
    std::fclose(ene_file);

    return 0;
}
