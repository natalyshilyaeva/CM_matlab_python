def proizvod(p):
	pp = []
	n = len(p)
	for i in range(0,n-1):
		pp.append(p[i]*(n-i-1))
	print(pp)
	return pp
proizvod([1,1,1,1,1,1])
proizvod([3,7,-5,-2,4])
proizvod([-2,5])
proizvod([3])
