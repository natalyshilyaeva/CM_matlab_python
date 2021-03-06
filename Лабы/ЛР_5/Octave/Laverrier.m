function p_list = Laverrier(matrix)  
  sz = size(matrix)(1);
  s_list = [];
  for degree = 1:sz
    s = sum(diag(matrix^degree));
    s_list(end+1) = s;
  endfor

  sz = size(s_list)(2);
  s_list_tmp = s_list(sz:-1:1);
  p_list = [1];
  for i = 1:sz
       p = -1/i * sum(s_list_tmp(end-(i-1):end).*p_list);
       p_list(end+1) = p;
  endfor 
endfunction
