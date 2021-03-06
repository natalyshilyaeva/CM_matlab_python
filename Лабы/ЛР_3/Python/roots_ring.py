import sys
def roots_ring(p):
    r = 0
    R = sys.float_info.max
    a0 = abs(p[0])
    an = abs(p[-1])
    A = an
    B = a0
    for i in range(0,len(p)-1):
        if (abs(p[i]) > A):
            A = abs(p[i])
        if (abs(p[i]) > B):
            B = abs(p[i])
    if(a0!=0):
        R = 1+A/a0
    if(an!=0):
        r = 1/(1+B/an)
    else:
        for i in range(len(p)-1,-1,-1):
            if p[i]!=0:
                r = 1/(1+B/abs(p[i]))
                if i==0:
                    r = 0
                    R = 1
                break;
    if(r>=R):#no roots
        r = 0
        R = sys.float_info.max
    print(r,R)
    return [r,R]

roots_ring([1,-4,-42,104,361,-420])
roots_ring([-1,-2,-2,-5,0,-3,-4,2,-5,0])
roots_ring([1,1.4,-13.85,1.842,6.264])


