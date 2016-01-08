function c = wspNewton(x, y)
  n = length(x);
  b = y;
  for j = 1:(n-1)
    for k = fliplr(j+1:n)
      b(k) = (b(k) - b(k-1)) / (x(k) - x(k-j));
    endfor
  endfor
  c = b;
endfunction

function w = Horner(c, x, z)
  n = length(c); # degree
  m = length(z); # number of points to calculate
  w = v = ones(1, n); # just to initialize vector of length n, v is tmp w
  for i = 1:m
    v(n) = c(n);
    for j = fliplr(1:(n-1))
      v(j) = v(j + 1) * (z(i) - x(j)) + c(j);
    endfor
    w(i) = v(1);
  endfor
endfunction