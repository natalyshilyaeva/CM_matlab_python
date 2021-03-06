function pp = proizvod(p)
pp = [];
n = numel(p);
for i = [1:numel(p)-1]
    pp(i)=p(i)*(n-i);
end
