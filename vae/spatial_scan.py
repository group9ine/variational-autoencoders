from math import ceil
import numpy as np

def scan(xyz, *args):
    if len(args)>=3:
        x=args[0]
        y=args[1]
        z=args[2]
    else:
        x=ceil(max([i[0] for i in xyz]))
        y=ceil(max([i[1] for i in xyz]))
        z=ceil(max([i[2] for i in xyz]))
    print(x,y,z)
    res=np.zeros(shape=(z*10, y*10, x*10), dtype=int)
    #[[[[0 for i in range(x*10)]for j in range(y*10)]for k in range(z*10)]for h in range(len(data))]
    
    #print("start dividing by position")
    for r in xyz:
        try:
            res[int(r[2]*10)][int(r[1]*10)][int(r[0]*10)]+=1
        except Exception as e:
            print(r)
            print(e)
    #print("bucketed")
    return res

if __name__=="__main__":
    from sys import argv
    import matplotlib.pyplot as plt
    import numpy as np
    
    with open(argv[1]) as f:
        data = [[float(i.strip()) for i in s.split(" ") if i!=""] for s in f.read().split("\n") if s!=""]
    
    print("got data")
    xyz=[[[data[h][i+3*j]for i in range(3)]for j in range(len(data[h])//3)]for h in range(len(data))]
    print("xyz'd")
    res=[scan(xyz[0])]
    print("got res")
    print(np.sum(res))
    z=len(res[0])
    y=len(res[0][0])
    x=len(res[0][0][0])
    
    
    fig = plt.figure()
    ax = fig.add_subplot(projection='3d')
    ax.scatter([i[0] for i in xyz[0]], [i[1] for i in xyz[0]], [i[2] for i in xyz[0]], s=20)
    
    grid=[[[(i/10, j/10, k/10) if res[0][k][j][i] else (None, None, None) for i in range(x)] for j in range(y)] for k in range(z)]
    grid=np.reshape(grid,(x*y*z,3))
    x=[grid[i][0] for i in range(len(grid)) if grid[i][0] is not None]
    y=[grid[i][1] for i in range(len(grid)) if grid[i][1] is not None]
    z=[grid[i][2] for i in range(len(grid)) if grid[i][2] is not None]
    
    ax.scatter(x,y,z)
    print(sorted([[int(j*10)/10 for j in i] for i in xyz[0]]), sorted([(x[i],y[i],z[i]) for i in range(len(x))]))
    
    #print(np.reshape(xyz[0], (3,len(xyz[0]))),xyz[0])
    plt.show()
