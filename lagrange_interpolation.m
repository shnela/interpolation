function c = wspNewton(x, y)
  n = size(x);
  b = x;
  for j = 1:n
    b(j) = y(j);
  endfor
  for j = 1:n
    for k = fliplr(j+1:n)
      b(k) = (b(k) - b(k-1)) / (x(k) - x(k-j));
    endfor
  endfor
  c = b(1:n-1);
endfunction

function w = Horner(c, x, z)
  v_n = a_n
  for j = 1:(n-1)
    v_j = v_{j+1} * x + a_j
  endfor
endfunction