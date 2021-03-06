function b = right_bound(P)
    b = 1;
    ff = 0;
    K = ddel(P,b);
    n = length(K);
    while (ff ~= 1)
        f = 0;
        for i = K
            if i < 0
                f = 1;
            end
            if f > 0
                b = b+1;
                K = ddel(P,b);                
                break
            end
        end
        if f == 0
            ff = 1;
        end
    end
end

