 
import numpy as np
def find_best_params(points):
    centered_points = points - np.mean(points, axis=0)
    
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
    
    # going in decreasing distance order, check if each successive point is
    ##  within the poligon with the currently selected point as vertices
    for p in centered_points[3:]:
        # to find if it's within the polygon, check the halfplane given by the two closest
        p1,p2 = [pi+p for pi in sorted(selected_points-p, key=lambda x: x[0]**2 + x[1]**2)[:2]]
        norm = np.array([p1[1]-p2[1], p2[0]-p1[0]])
        centr = (p1+p2)/2
        
        if not sign(np.dot(p-centr,norm)) == sign(np.dot(-centr, norm)):
            # if not in poligon, select the point
            selected_points.append(p)
            
    # find the polygon segment that is closer to the center
    selected_points = sorted(selected_points, key=lambda x: np.arctan2(x[1], x[0]))
    dists = [0 for i in range(len(selected_points))]
    for i in range(len(selected_points)):
        p1 = selected_points[i]
        p2 = selected_points[i-1]
        
        norm = np.array([p1[1]-p2[1], p2[0]-p1[0]])
        #print((norm[0]**2+norm[1]**2)**0.5, p1, p2, selected_points)
        norm /= (norm[0]**2+norm[1]**2)**0.5
        centr = (p1+p2)/2
        dists[i] = np.dot(-centr, norm)
    
    c_ind = dists.index(min(dists)) # index of closest segment
    
    # turn points so that segment faces down
    p1 = selected_points[c_ind]
    p2 = selected_points[c_ind-1]
    norm = np.array([p1[1]-p2[1], p2[0]-p1[0]])
    #print(p1, p2)
    
    theta = np.arctan2(norm[1], norm[0])
    rot_mat = np.array([[np.cos(theta), np.sin(theta)],[-np.sin(theta), np.cos(theta)]])
    
    centered_points = centered_points@rot_mat
    # shift in place
    centered_points -= centered_points.min(axis=0)
    return centered_points

if __name__=="__main__":
    import matplotlib.pyplot as plt
    points = np.array([[0,0],[0,1],[1,0],[1,1],[0,2],[1,2],[0.9,1.7],[0.9,0.7]])
    plt.scatter([i[0] for i in points],[i[1] for i in points])
    new = find_best_params(points)
    plt.scatter([i[0] for i in new],[i[1] for i in new])
    plt.show()
