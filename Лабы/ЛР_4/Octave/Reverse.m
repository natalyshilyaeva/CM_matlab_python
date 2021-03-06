function result = Reverse(mat)
  if  size(mat)(1) == size(mat)(2) && mat(1,1)!=0
    if size(mat) != [1,1]
      result = Reverse(mat(1:end-1,1:end-1));
      if result == 0
        return
      endif
      Y = Multiplication(mat(end,1:end-1),result);
      if abs(mat(end,end)-Multiplication(Y, mat(1:end-1,end)))>0.000001
        O = 1/(mat(end,end)-Multiplication(Y, mat(1:end-1,end)));
      else
        O=0;
        'division by 0, so the Reverse does not exist'
      endif
      X = Multiplication(result, mat(1:end-1,end));
      if O!=0 && size(Multiplication(X*O,Y))(1)==size(X)(1)
        result = [result+Multiplication(X*O,Y), -1*O*X; -1*O*Y,O];
      else 
        result = 0;
      endif
    elseif size(mat) == [1,1]
      result = 1/mat;
    endif
  else
    result = 0;
    'division by 0, so the Reverse does not exist'
  endif
endfunction
