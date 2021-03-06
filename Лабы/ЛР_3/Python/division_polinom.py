def division_polinom(p1,p2):
	res = [i for i in p1]
	res1 = []
	res2 = [i for i in p1]
	d = [-p2[i] for i in range(1,len(p2))]
	if(len(p1)>=len(p2)):
		for i in range(0,len(p1)-len(d)):
			res[i] /= p2[0]
			for j in range(len(d)):
				res[i+1+j] += res[i]*d[j]
		res1 = [res[i] for i in range(len(p1)-len(d))]
		res2 = [res[i] for i in range(len(p1)-len(d),len(p1))]
	print(res1,res2,":",res)
	return res

division_polinom([-1,-2,-2,-5,0,-3,-4,2,-5,0],[1,4,1,-14,-20,-8])
division_polinom([1,4,1,-14,-20,-8],[1,3])
division_polinom([1,0,0,-1],[1,1,1])

