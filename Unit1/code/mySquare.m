function ret = mySquare(x)
	n = length(ret = zeros(size(x)));
	dt = x(2)-x(1);
	for i=[1:n]
		if(abs(mod(floor(x(i)),2))<dt)
			ret(i) = 1.0;
		else
			ret(i) = 0.0;
		endif
	endfor
endfunction