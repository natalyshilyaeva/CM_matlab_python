function [x, y] = system(f, g)
    x = 1;
    y = 1;
    eps = 0.0001;
    [fdx, fdy] = psk(f);
    [gdx, gdy] = psk(g);
    I = value2(fdx, [x, y]) * value2(gdy, [x, y]) - value2(fdy, [x, y]) * value2(gdx, [x, y]);
    if I == 0
        x = nan;
        y = nan;
        return;
    end
    xprev = inf;
    yprev = inf;
    while (x - xprev)^2 + (y - yprev)^2 >= eps^2
        xprev = x;
        yprev = y;
        I = value2(fdx, [x, y]) * value2(gdy, [x, y]) - value2(fdy, [x, y]) * value2(gdx, [x, y]);
        h = -1 / I * (value2(f, [x, y]) * value2(gdy, [x, y]) - value2(fdy, [x, y]) * value2(g, [x, y]));
        k = -1 / I * (value2(fdx, [x, y]) * value2(g, [x, y]) - value2(f, [x, y]) * value2(gdx, [x, y]));
        x = x + h;
        y = y + k;
    end 
end