function y = polynom(p, x)
 y = p(1);
 p(1) = [];
    for i = p
 y = i + y * x;
    end
end