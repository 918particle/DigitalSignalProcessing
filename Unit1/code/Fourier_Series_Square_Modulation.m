clear;
home;
close;
pkg load signal;

%n is a constant
function retval = cosn_An(n,m,x)
	if(n != m)
		An = (m-m*cos(pi*m)*cos(pi*n))/(m*m-n*n)/pi;
		retval = An*cos(n.*x);
	else
		retval = zeros(size(x));
	endif
endfunction

%The full series
function retval = fourier_square_modulation(n,m,x)
	retval = zeros(size(x));
	for i=[1:n]
		retval = retval+cosn_An(i,m,x);
	endfor
	retval = retval + 0.5*sin(m*x);
endfunction

x = 0.0:0.001:(2.0*pi)*50;

S1 = fourier_square_modulation(30,10,x);

plot(x,S1,'color','black','linewidth',3);
grid on;
axis([-1 70 -1.5 1.5]);
xlabel("x");
ylabel("Amplitude");