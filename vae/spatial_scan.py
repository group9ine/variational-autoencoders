from math import ceil
import numpy as np

def scan(xyz, *args, **kwargs):
    n = kwargs["dim"] if "dim" in kwargs.keys() else 3
    lims = [0 for i in range(n)] 
    w = [0 for i in range(n)] 
    if len(args)>=n:
        #x=args[0]
        #y=args[1]
        #z=args[2]
        for i in range(n):
            lims[i]=args[i]
            w[i]=ceil(max([j[i] for j in xyz]))
    else:
        #print(args, len(args), kwargs)
        #x=ceil(max([i[0] for i in xyz]))
        #y=ceil(max([i[1] for i in xyz]))
        #z=ceil(max([i[2] for i in xyz]))
        for i in range(n):
            lims[i]=ceil(max([j[i] for j in xyz]))
            w[i]=lims[i]
            
    #print(x,y,z)
    #res=np.zeros(shape=(z*10, y*10, x*10), dtype=int)
    res=np.zeros(shape=tuple([i*10 for i in lims]), dtype=int)
    #[[[[0 for i in range(x*10)]for j in range(y*10)]for k in range(z*10)]for h in range(len(data))]
    
    #print("start dividing by position")
    for r in xyz:
        try:
            #res[int(r[2]*10)][int(r[1]*10)][int(r[0]*10)]+=1
            res[tuple([int(r[i]*10*lims[i]/w[i]) for i in reversed(range(n))])]+=1
        except Exception as e:
            print(r)
            print(e)
    #print("bucketed")
    # m = kwargs["mult"] if "mult" in kwargs.keys() else 10
    # return m*(res-1/np.prod(lims))
    return res

def deploy(s, *args, **kwargs):
    if type(s) == list:
        s=np.array(s)
    #z=len(s[0])
    #y=len(s[0][0])
    #x=len(s[0][0][0])
    
    n = kwargs["dim"] if "dim" in kwargs.keys() else 3
    N = kwargs["N"] if "N" in kwargs.keys() else 30
    
    lims = [0 for i in range(n)] 
    for i in range(n):
        lims[n-i-1]=len(s[tuple([0 for j in range(i+1)])])
    
    #m = kwargs["mult"] if "mult" in kwargs.keys() else 10
    #s=np.int64(2*(s+1/np.prod(lims))/m)
    
    if(s.std()==0):
        print("all same")
        return tuple([[] for i in range(n)])
    
    s=np.int64(s>s.mean()+5*(s[np.logical_and(s>s.mean()-s.std(),s<s.mean()+s.std())]).std())
    
    #print("limits are: ", lims)
    #grid=[[[(i/10, j/10, k/10) if s[0][k][j][i] else (None, None, None) for i in range(x)] for j in range(y)] for k in range(z)]
    #grid=np.reshape(grid,(x*y*z,3))
    grid=np.zeros(shape=(*[i for i in reversed(lims)], n))
    mesh=np.meshgrid(*[[i for i in range(lims[j])] for j in range(n)])
    indexes=np.reshape(mesh, (n,np.prod(lims)))
    for ind in zip(*indexes):
        try:
            grid[tuple(reversed(ind))]=tuple([0.05+i/10 for i in ind]) if s[0][tuple(reversed(ind))] else tuple([None for i in ind])
        except:
            print(tuple(reversed(ind)), grid.shape,s[0].shape) 
    grid=np.reshape(grid,(np.prod(lims),n))
    #x=[grid[i][0] for i in range(len(grid)) if grid[i][0] is not None]
    #y=[grid[i][1] for i in range(len(grid)) if grid[i][1] is not None]
    #z=[grid[i][2] for i in range(len(grid)) if grid[i][2] is not None]
    #return x,y,z
    return tuple([[grid[i][j] for i in range(len(grid)) if not np.isnan(grid[i][j])] for j in range(n)])

def rand_deploy(s, *args, **kwargs):
    if type(s) == list:
        s=np.array(s)
    
    n = kwargs["dim"] if "dim" in kwargs.keys() else 3
    N = kwargs["N"] if "N" in kwargs.keys() else 30
    
    lims = [0 for i in range(n)] 
    for i in range(n):
        lims[n-i-1]=len(s[tuple([0 for j in range(i)])])
    
    #s = (s - min(s)) / (max(s) - min(s))
    s = s.cumsum()
    s = s/s[-1]
    
    grid = [[0 for i in range(N)] for j in range(n)]
    exts = np.random.uniform(size=(N,))
    inds = [-1 for i in range(N)]
    for i in range(N):
        ind = list(s>exts[i]).index(True)
        counter = 0
        while ind in inds and counter < 100:
            u = np.random.uniform()
            ind = list(s>u).index(True)
            counter += 1
        inds[i] = ind
        pos = [ind for j in range(n)]
        #print("lims: ", lims, "; ind: ", ind)
        for j in range(n):
            #print("j: ",j)
            for k in range(j):
                pos[j] //= lims[n-k-1]
            pos[j] = pos[j] % lims[n-j-1]
            grid[j][i] = pos[j]
    
    return tuple(grid)

if __name__=="__main__":
    from sys import argv
    import matplotlib.pyplot as plt
    
    with open(argv[1]) as f:
        data = [[float(i.strip()) for i in s.split(" ") if i!=""] for s in f.read().split("\n") if s!=""]
    
    print("got data")
    xyz=[[[data[h][i+3*j]for i in range(3)]for j in range(len(data[h])//3)]for h in range(len(data))]
    print("xyz'd")
    res=[scan(xyz[0],4,4,4)]
    print("got res")
    print(np.sum(res))
    
    
    
    fig = plt.figure()
    ax = fig.add_subplot(projection='3d')
    ax.scatter([i[0] for i in xyz[0]], [i[1] for i in xyz[0]], [i[2] for i in xyz[0]], s=20)
    
    x,y,z = deploy(res)
    ax.scatter(x,y,z)
    #print(sorted([[int(j*10)/10 for j in i] for i in xyz[0]]), sorted([(x[i],y[i],z[i]) for i in range(len(x))]))
    
    #print(np.reshape(xyz[0], (3,len(xyz[0]))),xyz[0])
    plt.show()
