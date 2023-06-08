import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation


def animate_2d(fname, nframes):
    # get parameters from file name
    params = fname.split("_")
    # set the index pot_pars to the last parameter of the potential,
    # given the potential type (poly has two parameters, gamma only one)
    if params[0].endswith("poly"):
        pot_pars = 2
    elif params[0].endswith("gamma"):
        pot_pars = 1
    elif params[0].endswith("fake"):
        pot_pars = 2
    else:
        print("Error: filename begins with unknown potential identifier.")
        return

    num_part = int(params[pot_pars + 1])
    box_side = float(params[pot_pars + 2])

    # read data into array
    data = np.loadtxt(fname)

    # split x and y into third dimension
    data = data.reshape((-1, num_part, 2)) / box_side

    fig, ax = plt.subplots()

    # define the animation function
    def update(ind):
        ax.clear()
        if params[0].endswith("poly"):
            plt.plot(data[ind, :, 0], data[ind, :, 1], marker="o")
        else:  # gamma case --> plot without lines
            plt.scatter(data[ind, :, 0], data[ind, :, 1])
        ax.set_title(f"Particle positions ({ind} / {nframes})")
        ax.set_xlabel("x / L")
        ax.set_ylabel("y / L")
        ax.set_xlim(0, 1)
        ax.set_ylim(0, 1)

    # create the animation
    animation = FuncAnimation(
        fig, update, frames=int(nframes), interval=100
    )

    # save the animation in fname(-".x").gif
    animation.save("animation.gif")


def main():
    import sys

    animate_2d(sys.argv[1], sys.argv[2])


if __name__ == "__main__":
    main()
