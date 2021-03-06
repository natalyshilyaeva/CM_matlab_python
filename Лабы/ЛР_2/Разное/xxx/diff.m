function z = diff(P)
z = [];
n = length(P);
z(1) = P(1)*(n-1);
    for i=2:(n-1)
        z(end+1) = P(i)*(n-i);
    end
end

