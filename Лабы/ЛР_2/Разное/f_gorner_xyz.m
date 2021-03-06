function z = Gorner(p,x,y)
pp = p;
[n,m] = size(p);

for i = [1:n]
    for j = [2:m]
        pp(i,j) = pp(i,j) + pp(i,j-1)*x;
    end
    if(i>1)
        pp(i,end) = pp(i,end) + pp(i-1,end)*y;
    end
end
z = pp(end,end);
% xx = [-5:5];
% yy = [-5:5];
% [xx,yy]=meshgrid(xx,yy);
% ff = inline('xx^2 + 2*yy*xx+yy^2-xx^2*yy+3*yy-4');
% mesh(ff(xx,yy));
% ff(1,2)
end

%tests
% f_gorner_xyz([0 0 1;-1 2 3;1 0 -4],1,2)
% 9
%f_gorner_xyz([0 0 0 0;0 0 0 0;0 0 0 0; 1 1 1 1],-3,0)
%-20
%