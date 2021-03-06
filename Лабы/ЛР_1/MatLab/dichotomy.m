function x = dichotomy(P)
 b = right_bound(P);
 a = left_bound(P);
    eps = 0.001;
    while abs(calcfunc(P, (b + a) / 2)) >= eps
        if calcfunc(P, (b + a) / 2) < 0
 a = (b + a) / 2;
        else
 b = (b + a) / 2;
        end
    end
 x = (b + a) / 2;
end

