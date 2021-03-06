function z = replace(P, b)
    P = ddel(P,b);
    z = P(end);
    P = P(1:numel(P)-1);
    for i=1:numel(P)
        P = ddel(P,b);
        z(end+1) = P(end);
        P=P(1:numel(P)-1);
    end
    z = flip(z);
end

