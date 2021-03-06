def f(p,a):
    p2 = [i for i in p]
    for i in range(1,len(p2)):
        p2[i] = p2[i] + p2[i-1]*a
    return p2[len(p2)-1]
    
def Chord(p,a,b):
    step = 0.5
    #b = 100
    a = b - step
    if(f(p,b)==0):
        x = b
    else:
        start = f(p,b)
        while(f(p,a)*start >=0):
            a=a-step
        b = a + 2*step
        x = a - f(p,a)*(b-a)/(f(p,b)-f(p,a))
        eps = 0.001
        if(f(p,a)*f(p,x)>0):
            while(abs(f(p,a))>=eps):
                a = a - f(p,a)*(b-a)/(f(p,b)-f(p,a))
            x=a
        elif(f(p,b)*f(p,x)>0):
            while(abs(f(p,b))>=eps):
                b = b - f(p,b)*(b-a)/(f(p,b)-f(p,a))
            x=b
    print(x)
    return x
Chord([1,-4,-42,104,361,-420],9,9)
Chord([10,42,-137,-604,-615,-100],5,5)
Chord([1,-2,-39,148,-140],8,8)
Chord([1,-13,47,-23-48,36],13,13)
Chord([1,-1,-3,-9],3,3)

