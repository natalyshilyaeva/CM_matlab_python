def f(p,a):
    p2 = [i for i in p]
    for i in range(1,len(p2)):
        p2[i] = p2[i] + p2[i-1]*a
    return p2[len(p2)-1]
#f([1,-8,5,2,-7],2)
#f([1,-2,1],1)
    
def proizvod(p):
    pp = []
    n = len(p)
    for i in range(0,n-1):
        pp.append(p[i]*(n-i-1))
    return pp

def Newton(p,a,b):
	ps = proizvod(p)
	step = 0.5
    #b = 100
	a = b - step
	if(f(p,b)==0):
		x = b
	else:
		start = f(p,b)
		while(f(p,a)*start>=0):
			a=a-step
		b = a + 2*step
		x = a - f(p,a)/f(ps,a)
		eps = 0.001
		if(f(p,a)*f(p,x)>0):
			while(abs(f(p,a))>=eps):
				a = a - f(p,a)/f(ps,a)
			x=a
		elif(f(p,b)*f(p,x)>0):
			while(abs(f(p,b))>=eps):
				b = b - f(p,b)/f(ps,b)
			x=b
	print(x)
	return x
Newton([1,-4,-42,104,361,-420],9,9)
Newton([10,42,-137,-604,-615,-100],5,5)
Newton([1,-2,-39,148,-140],8,8)
Newton([1,-13,47,-23-48,36],13,13)
Newton([1,-1,-3,-9],3,3)
