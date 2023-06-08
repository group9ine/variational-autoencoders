import matplotlib.pyplot as plt
import numpy as np
def find_best_params(points):
    init_trans = np.mean(points, axis=0)
    centered_points = points - init_trans
    
    
    def sign(x):
        if x>0:
            return 1
        if x<0:
            return -1
        return 0
    # order by distance form the center
    centered_points = np.array(sorted(centered_points, key=lambda x: x[0]**2 + x[1]**2, reverse=True))
    # take 3 furthest
    selected_points = [centered_points[i] for i in range(3)]
    
    selected_points = sorted(selected_points, key=lambda x: np.arctan2(x[1],x[0]))
    
    # going in decreasing distance order, check if each successive point is
    ##  within the poligon with the currently selected point as vertices
    for p in centered_points[3:]:
        inside = True
        for j in range(len(selected_points)):
            p1 = selected_points[j]
            p2 = selected_points[j-1]
            
            norm = np.array([p1[1]-p2[1], p2[0]-p1[0]])
            centr = (p1+p2)/2
            
            if sign(np.dot(p-centr, norm) )>0:
                inside=False
                break
        
        if not inside:
            # if not in poligon, select the point
            selected_points.append(p)
            selected_points = sorted(selected_points, key=lambda x: np.arctan2(x[1],x[0]))
            
            
    # find the polygon segment that is closer to the center
    #selected_points = sorted(selected_points, key=lambda x: np.arctan2(x[1], x[0]))
    dists = [0 for i in range(len(selected_points))]
    for i in range(len(selected_points)):
        p1 = selected_points[i]
        p2 = selected_points[i-1]
        
        norm = np.array([p1[1]-p2[1], p2[0]-p1[0]])
        #print((norm[0]**2+norm[1]**2)**0.5, p1, p2, selected_points)
        norm /= (norm[0]**2+norm[1]**2)**0.5
        centr = (p1+p2)/2
        dists[i] = np.abs(np.dot(centr, norm))
    
    c_ind = dists.index(min(dists)) # index of closest segment
    
    # turn points so that segment faces down
    p1 = selected_points[c_ind]
    p2 = selected_points[c_ind-1]
    norm = np.array([p1[1]-p2[1], p2[0]-p1[0]])
        
    ##plt.scatter([i[0] for i in centered_points],[i[1] for i in centered_points], c="blue")
    ##plt.scatter([i[0] for i in selected_points],[i[1] for i in selected_points], c="#00ff00", s=10)
    
    theta = np.pi*3/2 -np.arctan2(norm[1], norm[0])
    rot_mat = np.array([[np.cos(theta), np.sin(theta)],[-np.sin(theta), np.cos(theta)]])
    
    
    centered_points = centered_points@rot_mat
    selected_points = np.array(selected_points)@rot_mat
    # shift in place
    selected_points -= centered_points.min(axis=0)
    centered_points -= centered_points.min(axis=0)
    return centered_points, selected_points
    


if __name__=="__main__":
    with open("./mc-sampling/good-runs/gamma_0.1_30_10_0.75_0.2_10000_2500_2500_x.txt") as f:
        s=f.readlines()
    from sys import argv
    
    try:
        ind=int(argv[1])
    except:
        ind = 1
    points = np.array([float(i.strip()) for i in s[ind].strip().split(" ")]).reshape(30,2)
    #points = np.array([[0,0],[0,1],[1,0],[1,1],[0,2],[1,2],[0.9,1.7],[0.9,0.7]])
    #points += np.random.normal(0,0.05, size=points.shape)
    
    
    plt.scatter([i[0] for i in points],[i[1] for i in points], c="red")
    plt.scatter(*points.mean(axis=0), c="orange")
    
    alpha=2
    points=points@np.array([[np.cos(alpha), np.sin(alpha)],[-np.sin(alpha), np.cos(alpha)]])
    
    new, sel = find_best_params(points)
    plt.scatter([i[0] for i in new],[i[1] for i in new], c="blue")
    plt.scatter([i[0] for i in sel],[i[1] for i in sel], c="#00ff00", s=10)
    plt.scatter(*new.mean(axis=0), c="#aa22cc")
    plt.show()
