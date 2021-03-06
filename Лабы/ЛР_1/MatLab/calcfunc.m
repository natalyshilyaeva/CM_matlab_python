function z = calcfunc(P, x)
    z = P(1);
    for i=P(2:numel(P))
        z = i + z*x;
    end
end

