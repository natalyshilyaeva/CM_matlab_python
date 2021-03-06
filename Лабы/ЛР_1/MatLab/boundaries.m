%function boundaries(P)
function x = boundaries(P)
    b = 1;
    ff = 0;
    K = ddel(P,b);
    n = length(K);
    while (ff ~= 1)
        f = 0;
        for i = 1 : n
            if K(i) < 0
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
    
    P(2:2:end) = -P(2:2:end);
    a = -right_bound(P);
%     ff = 0;
%     n = length(P);
%         for i = 1 : n           
%             if rem(i, 2) == 0
%                 P(i) = (-1)*P(i);
%             end
%         end
%     R = ddel(P,a);
%     n = length(R);
%     while ff ~= 1
%         f = 0;
%         for i = 1 : n
%             if R(i) < 0
%                 f = 1;
%             end
%             if f > 0
%                 a = a + 1;
%                 R = ddel(P,a);
%                 break
%             end
%         end
%         if f == 0
%             ff = 1;
%         end
%     a = (-1)*a;         
%     end
    
   disp([a, b]); 
   %z1 = a;
   %z2 = b;
end

