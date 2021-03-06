function z = ddel(P, b)
    z = P(1);
    for i=P(2:numel(P))
        z(end+1) = i + z(end)*b;
    end
end

