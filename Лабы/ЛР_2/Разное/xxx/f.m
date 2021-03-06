function y = f(P,x)
y(1) = P(1);
n = length(P);
for i = 1:(n-1)
    y(end+1) = P(i+1) + y(end)*x;
end
