function z = del(P, x)
    z = P(1);
    for i=P(2:numel(P))
        z(end+1) = i + z(end)*x;
    end
    if (z(end) == 0)
        z = z(1:end-1);
    else z = z(1:end-1);
    end
end

