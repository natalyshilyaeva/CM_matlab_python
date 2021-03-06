function [Np,Nm] = Shturm(p)
    n = numel(p);
    ns = [];
    sys = []*[];
    ns(1)=n;
    sys(1,[1:n]) = p;
    ns(2)=n-1;
    sys(2,[1:n-1]) = p_derivative(p);
    while(ns(end)>1)
        mod = division_pp(sys(end-1,[1:ns(end-1)]),sys(end,[1:ns(end)]));
        ns(end+1)=numel(mod);
        sys(end+1,[1:numel(mod)]) = -mod;
    end
    nmi=0;
    nz=0;
    npi=0;
    [l,n]=size(sys);
    for i = [2:l]
        if(f(sys(i-1,[1:ns(i-1)]),-inf)*f(sys(i,[1:ns(i)]),-inf)<0)
            nmi=nmi+1;
        end
        if(f(sys(i-1,[1:ns(i-1)]),0)*f(sys(i,[1:ns(i)]),0)<0)
            nz=nz+1;
        end 
        if(f(sys(i-1,[1:ns(i-1)]),inf)*f(sys(i,[1:ns(i)]),inf)<0)
            npi=npi+1;
        end
    end
    Np = nz - npi;
	Nm = nmi - nz;
    Np + Nm
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

function p = cut_first_zeroes(p)
    while(p(1)==0)
       p(1)=[]; 
    end
end

function res2 = division_pp(p1,p2)
    res = p1;
	res1 = [];
	res2 = p1;
    d = -1*p2([2:numel(p2)]); 
	if(numel(p1)>=numel(p2))
		for i = [1:numel(p1)-numel(d)]
			res(i) = res(i)/p2(1);
			for j = [1:numel(d)]
				res(i+j) = res(i+j)+res(i)*d(j);
            end
        end
        res1 = res([1:numel(p1)-numel(d)]);
        res2 = res([numel(p1)-numel(d)+1:numel(p1)]);
    end
    res2 = cut_first_zeroes(res2);
end
