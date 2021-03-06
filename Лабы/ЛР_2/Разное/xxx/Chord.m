function x = Chord(P)
eps = 0.0001;
a = left_bound(P) - 1;
b = right_bound(P) + 1;
    while(abs(a - b) > eps) 
        a = b + (b - a)*f(P,b)/(f(P,b) - f(P,a));
        b = a - (a - b)*f(P,a)/(f(P,a) - f(P,b));
    end
    x = a;
end
    


