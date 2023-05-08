def scan(filename, x, y, z):
    with open(filename) as f:
        data = [
            [float(i.strip()) for i in s.split(" ") if i != ""]
            for s in f.read().split("\n")
            if s != ""
        ]

    res = [
        [
            [[0 for i in range(x * 10)] for j in range(y * 10)]
            for k in range(z * 10)
        ]
        for h in range(len(data))
    ]
    xyz = [
        [
            [data[h][i + 3 * j] for i in range(3)]
            for j in range(len(data[h]) // 3)
        ]
        for h in range(len(data))
    ]

    for h in range(len(data)):
        for r in xyz[h]:
            res[h][int(r[0] * 10)][int(r[1] * 10)][int(r[2] * 10)] += 1

    return xyz, res


if __name__ == "__main__":
    from sys import argv
    import matplotlib.pyplot as plt
    import numpy as np

    xyz, res = scan(argv[1], 1, 1, 1)

    # print(xyz[0], res[0])

    fig = plt.figure()
    ax = fig.add_subplot(projection="3d")
    ax.scatter(
        [i[0] for i in xyz[0]],
        [i[1] for i in xyz[0]],
        [i[2] for i in xyz[0]],
        s=20,
    )

    grid = [
        [
            [
                (i / 10, j / 10, k / 10)
                if res[0][i][j][k]
                else (None, None, None)
                for i in range(10)
            ]
            for j in range(10)
        ]
        for k in range(10)
    ]
    grid = np.reshape(grid, (1000, 3))
    x = [grid[i][0] for i in range(len(grid)) if grid[i][0] is not None]
    y = [grid[i][1] for i in range(len(grid)) if grid[i][1] is not None]
    z = [grid[i][2] for i in range(len(grid)) if grid[i][2] is not None]

    ax.scatter(x, y, z)
    # print(sorted([[int(j*10)/10 for j in i] for i in xyz[0]]), sorted([(x[i],y[i],z[i]) for i in range(len(x))]))

    # print(np.reshape(xyz[0], (3,len(xyz[0]))),xyz[0])
    plt.show()
