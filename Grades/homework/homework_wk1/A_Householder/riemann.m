%computes left-side Riemann sum of a function defined within given interval enpoints [a,b] and number of subintervals (n)... by Andrew Householder

function area = riemann(a, b, n)
	function y = f(x)
		y = x^1;
	endfunction

	dx = (b-a)/n;
	sum = 0.0;
	for t = 0:(n-1)
		sum = sum + f(a + (t*dx));
	endfor
	area = dx*sum;
endfunction


