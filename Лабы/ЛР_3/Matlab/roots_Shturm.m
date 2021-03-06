function [roots,intervals] = roots_Shturm(p)
    roots = [];
    intervals = []*[]; 
    [Left_bound,Right_bound] = Gorner_bounds(p);
    little_shift = 10^(-10);
    Right_bound = Right_bound +little_shift;
    Left_bound = Left_bound -little_shift;
    right_bound = Right_bound;
    left_bound = right_bound -1;
    
    stack_of_bounds = []*[];
    stack_of_bounds(end+1,[1 2]) = [left_bound,right_bound];
    while(right_bound>Left_bound)
        left_bound = stack_of_bounds(end,1); 
        right_bound = stack_of_bounds(end,2); 
        stack_of_bounds(end,:) = [];
        if(f(p,left_bound)~=0)&&(f(p,right_bound)~=0)
            count_roots = Shturm(p,left_bound,right_bound); 
            if(count_roots==0)
                if(isempty(stack_of_bounds))
                    right_bound = left_bound;
                    left_bound = right_bound - 1;
                    stack_of_bounds(end+1,[1 2]) = [left_bound,right_bound]; 
                end
            elseif(count_roots==1)
                intervals(end+1,[1 2]) = [left_bound,right_bound];
                roots(end+1) = Chord(p,left_bound,right_bound);
                if(isempty(stack_of_bounds))
                    right_bound = left_bound;
                    left_bound = right_bound - 1;
                    stack_of_bounds(end+1,[1 2]) = [left_bound,right_bound];
                end
            elseif(count_roots>=2)
                middle = (right_bound+left_bound)/2;
                stack_of_bounds(end+1,[1 2]) = [left_bound,middle];
                stack_of_bounds(end+1,[1 2]) = [middle,right_bound];
            end
        else
            left_bound = left_bound-little_shift;
            right_bound = right_bound+little_shift;
            stack_of_bounds(end,[1 2]) = [left_bound, right_bound];
        end
    end
    roots = roots';
end


function x = Chord(p,A,B)
    format long;
    a = A;
    b = B;
    if(f(p,b)==0)
        x = b;
    elseif(f(p,a)==0)
        x = a;
    else
        x = a - f(p,a)*(b-a)/(f(p,b)-f(p,a));
        eps = 0.000001;
        if(f(p,a)*f(p,x)>0)
            while(abs(f(p,a))>=eps) 
                a = a - f(p,a)*(b-a)/(f(p,b)-f(p,a));
            end
            x=a;
        elseif(f(p,b)*f(p,x)>0)
            while(abs(f(p,b))>=eps)
                b = b - f(p,b)*(b-a)/(f(p,b)-f(p,a));
            end
            x=b;
        end
    end
end

function [l,r] = Gorner_bounds(p)
    p = sign(p(1))*p;
    r = 1e+3;
    while(is_not_neg(Gor_division2(p,r)))
        r=r-1; 
    end
    r=r+2;
    p2 = [];
    n = numel(p);
    for i = 1:n
        p2(i) = (-1)^(n-1)*p(i)*(-1)^(n-i);
    end
    
    l = 1e3;
    while(is_not_neg(Gor_division2(p2,l)))
        l=l-1;
    end
    l=-(l+2);
end

function b = is_not_neg(p)
    b=1;
    for i = p
        if i<0
            b = 0;
            break;
        end
    end
end

function out = Gor_division2(p,a)
    out = p;
    for i = [2:length(out)]
        out(i) = out(i) + out(i-1)*a;
    end
    if(out(end)==0)
        out(end)=[];
    end
end

function N = Shturm(p,a,b)
    n = numel(p);
     ns = [];
    sys = []*[]; 
    ns(1)=n;
    sys(1,[1:n]) = p;
    ns(2)=n-1;
    sys(2,[1:n-1]) = p_derivative(p);
    while(ns(end)>1)
        mod = division_pp(sys(end-1,[1:ns(end-1)]),sys(end,[1:ns(end)]));
        ns(end+1)=numel(mod);
        sys(end+1,[1:numel(mod)]) = -mod;
    end
    Na=0;
    Nb=0;
    [l,n]=size(sys);
    for i = [2:l]
        aa = f(sys(i-1,[1:ns(i-1)]),a);
        ab = f(sys(i,[1:ns(i)]),a);
        if(aa*ab<0)
            Na=Na+1;
        end
        ba = f(sys(i-1,[1:ns(i-1)]),b);
        bb = f(sys(i,[1:ns(i)]),b);
        if(ba*bb<0)
            Nb=Nb+1;
        end
    end
    N = Na - Nb;
end

function y = f(p,x)
    p2 = p;
    for i = [2:length(p2)]
        p2(i) = p2(i) + p2(i-1)*x;
    end
    y = p2(end);
end

function pout = p_derivative(p)
    pout = [];
    n = numel(p);
    for i = [1:numel(p)-1]
        pout(i)=p(i)*(n-i);
    end
end

function p = cut_first_zeroes(p)
    while(p(1)==0)
       p(1)=[]; 
    end
end

function res2 = division_pp(p1,p2)
    res = p1;
	res1 = [];
	res2 = p1;
    d = -1*p2([2:numel(p2)]); 
	if(numel(p1)>=numel(p2))
		for i = [1:numel(p1)-numel(d)]
			res(i) = res(i)/p2(1);
			for j = [1:numel(d)]
				res(i+j) = res(i+j)+res(i)*d(j);
            end
        end
        res1 = res([1:numel(p1)-numel(d)]);
        res2 = res([numel(p1)-numel(d)+1:numel(p1)]);
    end
    res2 = cut_first_zeroes(res2);
end