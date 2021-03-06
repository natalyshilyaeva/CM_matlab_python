import sys
def upper_bound_Lagrange(p):
    R = sys.float_info.max
    if(p[0]<0):
        for i in range(len(p)):
            p[i]*=-1
    k=1
    for i in range(1,len(p)):
        if p[i] < 0:
            k = i
            break
    B = abs(p[k])
    for i in range(k,len(p)):
        if p[i] < 0 and abs(p[i])>B:
            B = abs(p[i])
    R =1 + (B/p[0])**(1/k)
    print(R)
    return R

upper_bound_Lagrange([1,4,1,-14,-20,-8])
upper_bound_Lagrange([-1,-2,-2,-5,0,-3,-4,2,-5,0])
upper_bound_Lagrange([1,1.4,-13.85,1.842,6.264])

