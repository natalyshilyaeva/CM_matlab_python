function [res1,res2,res] = division_polinom(p1,p2)
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
end