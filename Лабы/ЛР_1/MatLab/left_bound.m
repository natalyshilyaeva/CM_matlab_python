function a = left_bound(P)
    P(2:2:end) = -P(2:2:end);
    a = -right_bound(P);
end
        %for i = (n-1):(-2):l           
            %if rem((n-i), 2) == 0
                %P(i) = (-1)*P(i);
            %end
        %end
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


