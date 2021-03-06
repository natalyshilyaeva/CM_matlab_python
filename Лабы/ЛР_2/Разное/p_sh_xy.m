function [px,py,pxy]= p_sh_xy(p)
    [n,m] = size(p);
    px = []*[];
    py = []*[];
    for i = [1:n]
        for j = [1:m-1]
            px(i,j+1) = p(i,j)*(m-j);%p'x
        end
    end
    for j = [1:m]
        for i = [1:n-1]
            py(i+1,j) = p(i,j)*(n-i);%p'y
        end
    end  
    pxy = px + py;
end
