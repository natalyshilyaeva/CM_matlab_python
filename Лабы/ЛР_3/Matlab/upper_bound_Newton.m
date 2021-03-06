function R = upper_bound_Newton(p)
    p=positiving(p);
	R = -inf;
    n = numel(p);
	pdlist=[]*[];
	pdlist(1,[1:n]) = (p);
	for i = [1:n]
		pdlist([end+1],[1:n-i]) = p_derivative(pdlist(end,[1:n-i+1]));
    end
	R = 1;%=0?
	i = 1;
	while(i<=n)
		if(f(pdlist(i,[1:n-i+1]),R)<0)%<=0?
			R = R+1;
			i=1;
        else
			i=i+1;
        end
    end
   R
end

function y = f(p,x)
p2 = p;
for i = [2:length(p2)]
    p2(i) = p2(i) + p2(i-1)*x;
end
y = p2(end);
end

function pout = p_derivative(p)
pout = [];
n = numel(p);
for i = [1:numel(p)-1]
    pout(i)=p(i)*(n-i);
end
end

function pout = positiving(p)
pout = p;
if (p(1)<0)
    for i = [1:numel(p)]
        pout(i)=-1*p(i);
    end
end
end

