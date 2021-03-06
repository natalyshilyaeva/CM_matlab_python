function retval = Net_derivative (values, span, step)
  accuracy = 3;
  iter = min(length(values), accuracy);
  first = span(1);
  last = span(2);
  x = first:step:last;
  a(:, 1) = values(:);
  for i = 2:iter
    for j = 1:length(values) - i+1
      a(j, i) = -a(j, i-1) + a(j+1, i-1);
    end
  end
  
  for i = 1:length(values)-iter
    res = 0;
    sign = 1;
    for j = 2:iter
      res += (a(i, j)*sign) / (j-1);
      sign = sign*-1;
      
    end
    der(i) = res/step;
  end
  retval = der;
  plot(x, values,"g", x(1:length(x)-iter), der, "b");
     
endfunction
