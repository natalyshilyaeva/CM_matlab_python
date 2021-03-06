def upper_bound_Newton(p):
        positiving(p)
        R = -1000000000
        pdlist=[]
        pdlist.append(p)
        while(p_derivative(pdlist[-1])!=[]):
                pdlist.append(p_derivative(pdlist[-1]))
        R = 1#=0?
        i = 0
        while(i<len(pdlist)):
                if(f(pdlist[i],R)<0):#<=0?
                        R+=1
                        i=0
                else:
                        i+=1
        print(R)
        return R


def f(p,x):
	p2 = [i for i in p]
	for i in range(1,len(p2)):
			p2[i] += p2[i-1]*x
	return p2[len(p2)-1]
def p_derivative(p):
	pout = []
	n = len(p)
	for i in range(0,n-1):
		pout.append(p[i]*(n-i-1))
	return pout
def positiving(p):
        if(p[0]<0):
                for i in range(len(p)):
                        p[i]*=-1
        return p

upper_bound_Newton([1,4,1,-14,-20,-8])
upper_bound_Newton([-1,-2,-2,-5,0,-3,-4,2,-5,0])
upper_bound_Newton([1,1.4,-13.85,1.842,6.264])

