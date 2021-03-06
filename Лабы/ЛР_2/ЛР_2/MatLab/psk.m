function [fdx, fdy] = psk(f)
 fdx = zeros(size(f));
 fdy = zeros(size(f));
 s = size(fdx);
 xp = s(2) - 1;
 yp = s(1) - 1;
    for i = 1:xp
       fdx(1:end, i + 1) = (xp - i + 1) * f(1:end, i);
    end
    for i = 1:yp
       fdy(i + 1, 1:end) = (yp - i + 1) * f(i, 1:end);
    end
end
