function val = value2(f, p)
    x = p(1);
    y = p(2);
    px = [];
    for py = f
       px(end + 1) = polynom(py', y);
    end
    val = polynom(px, x);
end