function [x,y] = NewtonC(A,B,x0,y0)
    format long;
    xn=x0;
    yn=y0;
    xprev = inf;
    yprev = inf;
%     ax=[];ay=[];axy=[];bx=[];by=[];bxy=[];
    eps = 0.0001;
    while(max(abs(xn-xprev),abs(yn-yprev))>eps)
        [ax,ay,axy] = p_sh_xy(A);
        [bx,by,bxy] = p_sh_xy(B);
        J = f2(ax,xn,yn)*f2(by,xn,yn)-f2(ay,xn,yn)*f2(bx,xn,yn);
        Ainp = f2(A,xn,yn);
        Binp = f2(B,xn,yn);
        hx = -(Ainp*f2(by,xn,yn)-f2(ay,xn,yn)*Binp)/J;
        hy = -(f2(ax,xn,yn)*Binp-Ainp*f2(bx,xn,yn))/J;
        xprev=xn;
        yprev=yn;
        xn = xn + hx;
        yn = yn + hy;
    end
    x = xn;
    y = yn;
end

function z = f2(p,x,y)
    z = f_gorner_xyz(p,x,y);
end

%test
%[x,y]=NewtonC([0 0 0 -1;0 0 0 0;0 0 0 0;2 0 0 -1],[0  0 1 0;0 0 0 0;0 0 0 -1; 0 0 0 -4],1.2,1.7)
%1.3 1.6
%[x,y]=NewtonC([0 0 0 0;0 0 0 0;0 0 0 -1;0 0 1 0],[0 0 0 0;0 0 0 0;0 0 0 -1;0 0 0 4],1,1);
%4 4
%