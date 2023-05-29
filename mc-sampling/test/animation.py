import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation


def animate_2d(fname, nframes):
    # read data into array
    data = np.loadtxt(fname)

    # get parameters from file name
    params = fname.split("_")
    num_part = int(params[3])
    box_side = float(params[4])

    # split x and y into third dimension
    data = data.reshape((-1, num_part, 2)) / box_side

    fig, ax = plt.subplots()

    # define the animation function
    def update(ind):
        ax.clear()
        plt.plot(
            data[ind, :, 0], data[ind, :, 1], linestyle="-", marker="o"
        )
        ax.set_title(f"Particle positions ({ind} / {nframes})")
        ax.set_xlim(0, 1)
        ax.set_ylim(0, 1)

    # create the animation
    animation = FuncAnimation(
        fig, update, frames=int(nframes), interval=300
    )

    # save the animation in fname(-".x").gif
    animation.save("animation.gif")


def main():
    import sys

    animate_2d(sys.argv[1], sys.argv[2])


if __name__ == "__main__":
    main()
