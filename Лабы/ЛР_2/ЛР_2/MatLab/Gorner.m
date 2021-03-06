function z = Gorner(p,x,y)
pp = p;
[n,m] = size(p);

for i = [1:n]
    for j = [2:m]
        pp(i,j) = pp(i,j) + pp(i,j-1)*x;
    end
    if(i>1)
        pp(i,end) = pp(i,end) + pp(i-1,end)*y;
    end
end
z = pp(end,end);
end