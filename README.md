# Variational autoencoders for Lennard-Jones-like configurations

## Directory structure

```
.
├── mc-sampling
│   ├── dump
│   ├── good-runs
│   ├── src
│   └── test
├── slides
└── vae
    └── saved-models
        ├── decoder
        └── encoder
```

## Main notebook and vae-related files
The most comprehensive Jupyter notebook is located in the `vae` subfolder,
named `vae-training.ipynb`. Within this folder, you can also find a
stand-alone Python code that corrects the unwanted rotations introduced by
the configuration reconstructor. Additionally, the `saved-models` folder
contains several zip files of saved models from previous runs (one of which
is unzipped and can be loaded directly from the notebook).

## C++ code for Monte-Carlo sampling
To build the executable, navigate to the `mc-sampling` subfolder and run
the `make` command. If you need to modify the run parameters, you can do so
in the `sampling.cfg` file (or another file of your choice following the
same conventions). After modifying the parameters, pass the configuration
file to the executable using the command: `./main sampling.cfg`.

The following parameters must be specified (order is not important). Use
the exact parameter names followed by an equal sign *without surrounding
spaces* and provide the corresponding value:


1. `potential`: specify the potential keyword along with its associated
   parameters (refer to the `sampling.cfg` file for more details).
2. `n_parts`: set the number of particles in the box.
3. `side`: define the side length of the box in units of sigma
   (Lennard-Jones parameter).
4. `temp`: specify the temperature in reduced Lennard-Jones units.
5. `max_disp`: set the maximum displacement per trial move in units of
   sigma.
6. `n_systems`: determine the number of separate initializations for the
   same systems. If set to 1, the program will generate an initial
   configuration once and continue to evolve that system. It will print the
   positions and optionally the energies at every `n_sample` timesteps (see
   below). By default, the program generates multiple systems and only
   prints the final configuration after `n_steps` timesteps.
7. `n_steps`: specify the total number of timesteps for each of the
   `n_systems` sub-runs.
8. `n_sample`: control the frequency of energy printing (if `print_en =
   true`) and position printing (if `n_systems = 1`).
9. `print_en`: a boolean value to choose whether to print energies or not.
10. `show_z`: print the average of the “last” coordinate (the second
    coordinate in two dimensions or the third coordinate in three
    dimensions) to the standard output.

To switch between two or three dimensions, manually change the macro

```c++
#define DIM 2
```

in the `metropolis.hpp` file located in `mc-sampling/src` to the desired
dimension (2 or 3) and recompile the program.

The program generates two `txt` files, which are stored in the
`mc-sampling/dump` directory. The files are named using a string that
includes all the chosen parameters in the specified order, such as:

```
gamma_0.1_30_10_0.75_0.2_10000_2500_2500_x.txt
```

You can find some examples from past runs in the `mc-sampling/good-runs`
directory. These examples are also referenced in the `vae-training`
notebook for training and analysis.

## Other stuff
You can use the `format_all` script to apply *cosmetic edits* to all Python
files in the current directory and its subdirectories. To run the script,
you need to install `black` by executing `python3 -m pip install black`, or
`conda install black` if you are using Anaconda.
