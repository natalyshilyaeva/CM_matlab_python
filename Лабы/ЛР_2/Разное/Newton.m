function x = Newton(p,a,b)
    format long;
    ps = proizvod(p);
    step = 0.5;
    a = b-step;
    if(f(p,b)==0)
        x = b;
    else
        
        start = f(p,b);
        while(f(p,a)*start >=0)
            a=a-step;
        end
        b = a + 2*step;     
           
        x = a - f(p,a)/f(ps,a);
        eps = 0.001;
        if(f(p,a)*f(p,x)>0)
            while(abs(f(p,a))>=eps)
                a = a - f(p,a)/f(ps,a);
            end
            x=a;
        elseif(f(p,b)*f(p,x)>0)
            while(abs(f(p,b))>=eps)
                b = b - f(p,b)/f(ps,b);
            end
            x=b;
        end
    end
end

function out = f(p,a)
p2 = p;
for i = [2:length(p2)]
    p2(i) = p2(i) + p2(i-1)*a;
end
out = p2(end);
end

