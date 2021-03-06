function pout = proizvod_poly(p)
pout = [];
n = numel(p);
for i = [1:numel(p)-1]
    pout(i)=p(i)*(n-i);
end
