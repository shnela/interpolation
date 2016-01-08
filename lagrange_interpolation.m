function c = wspNewton(x, y)
  n = length(x);
  b = y;
  for j = 1:(n-1)
    for k = fliplr(j+1:n)
      b(k) = (b(k) - b(k-1)) / (x(k) - x(k-j));
    endfor
  endfor
  c = b(1:n-1);
endfunction

function w = Horner(c, x, z)
  n = length(c); # degree
  m = length(z); # number of points to calculate
  w = ones(1, m); # just to initialize vector of length n
  for j = 1:n
    w = w .* (z .- c(j));
  endfor
endfunction