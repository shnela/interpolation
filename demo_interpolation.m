source("lagrange_interpolation.m")

function x = chebyshevNodes(a, b, r)
  x = zeros(1, r);
  for j = 1:r
    x(j) = (b - a)/2 * cos((2*j +1)/(2*r + 2) * pi) + (a + b)/2;
  endfor
endfunction

function test1(f, range, space)
  bigX = linspace(range(1), range(2), 256);
  hold all;
  plot(bigX, f(bigX)); # plot function
  for n = [4, 64]
    x = space(range(1), range(2), n);
    y = f(x);
    
    c = wspNewton(x, y);
    w = Horner(c, x, bigX);
    plot(bigX, w);
    #plot(x, y);
  endfor
endfunction

function max_error = test2(f, range, space)
  bigX = linspace(range(1), range(2), 1000);
  bigY = f(bigX);
  max_error = zeros(5, 1);
  n = [4, 8, 16, 32, 64];
  for i = 1:5
    x = space(range(1), range(2), n(i));
    y = f(x);
    c = wspNewton(x, y);
    w = Horner(c, x, bigX);
    
    max_error(i) = max(abs(w - bigY));
  endfor
  max_error
endfunction

f1 = @(x) cos(3*x);
range1 = [-2 * pi; pi];
f2 = @(x) abs(x);
range2 = [-10; 10];

# PLOT:
#
# cos(3*x) LINSPACE | cos(3*x) CHEBYSHEV
# -------------------------------------
# abs(x) LINSPACE   | abs(x) CHEBYSHEV
#
clf;

subplot(2, 2, 1);
ylim([-10, 10]);
test1(f1, range1, @linspace);

subplot(2, 2, 3);
ylim([-10, 10]);
test1(f2, range2, @linspace);

subplot(2, 2, 2);
ylim([-10, 10]);
test1(f1, range1, @chebyshevNodes);

subplot(2, 2, 4);
ylim([-10, 10]);
test1(f2, range2, @chebyshevNodes);

disp("f1, linspace")
test2(f1, range1, @linspace);
disp("f1, chebyshevNodes")
test2(f1, range1, @chebyshevNodes);
disp("f2, linspace")
test2(f2, range1, @linspace);
disp("f2, chebyshevNodes")
test2(f2, range1, @chebyshevNodes);