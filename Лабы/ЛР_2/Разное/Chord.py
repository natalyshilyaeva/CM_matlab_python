def f(p,a):
    p2 = [i for i in p]
    for i in range(1,len(p2)):
        p2[i] = p2[i] + p2[i-1]*a
    #print(p2[len(p2)-1])
    return p2[len(p2)-1]
#f([1,-8,5,2,-7],2)
#f([1,-2,1],1)
    
def Chord(p,a,b):
    step = 0.5
    #b = 100
    a = b - step
    if(f(p,b)==0):
        x = b
    else:
        start_sig = f(p,b)
        while(f(p,a)*start_sig>=0):
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
#Chord([1,0,-16,-36,-45],-10,20)
#Chord([1,-7,-45,307,644,-3300,-3600],-10,20)
#Chord([4,-24,33,4,-37,20],-10,20)
Chord([1,-4,-42,104,361,-420],9,9)
Chord([10,42,-137,-604,-615,-100],5,5)
Chord([1,-2,-39,148,-140],8,8)
Chord([1,-13,47,-23-48,36],13,13)
Chord([1,-1,-3,-9],3,3)
