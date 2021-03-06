function x = dif(P)
x = [];
n = length(P);
x(1) = P(1)*(n-1);
    for i=2:(n-1)
        x(end+1) = P(i)*(n-i);
    end
end

