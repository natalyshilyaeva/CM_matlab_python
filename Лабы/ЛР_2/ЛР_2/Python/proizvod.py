def proizvod(p):
	pp = []
	n = len(p)
	for i in range(0,n-1):
		pp.append(p[i]*(n-i-1))
	print(pp)
	return pp
proizvod_poly([1,1,1,1,1,1])
proizvod_poly([3,7,-5,-2,4])
proizvod_poly([-2,5])
proizvod_poly([3])
