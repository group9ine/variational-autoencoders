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
        │   ├── assets
        │   └── variables
        └── encoder
            ├── assets
            └── variables
```

## Main notebook and vae-related files
The most comprehensive Jupyter notebook is inside the subfolder `vae`, it’s
called `vae-training.ipynb`. There you can also find a stand-alone Python
code with the algorithm to correct the unwanted rotations introduced by the
configuration reconstructor, and a folder `saved-models` with some zipfiles
of saved models from past runs (and one unzipped to be loaded from the
notebook).

## C++ code for Monte-Carlo sampling
If you get a `core dumped` error, it’s most probably due to not having
created the `dump` directory inside `mc-sampling`.

## Other stuff
Run `format_all` to perform *cosmetic edits* on all python files in the
current directory and subdirectories. To run it you have to install `black`
with `python3 -m pip install black`, or `conda install black` if you’re
using anaconda.
