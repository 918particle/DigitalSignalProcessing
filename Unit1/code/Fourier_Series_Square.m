clear;
home;
close;
pkg load signal;

%n is a constant
function retval = sinn_An(n,x)
	An = 2.0/pi/n;
	retval = An*sin(n.*x);
endfunction

%The full series
function retval = fourier_square(n,x)
	retval = 0.5;
	for i=[0:n]
		retval = retval+sinn_An(2*i+1,x);
	endfor
endfunction

x = 0.0:0.0001:(2.0*pi)*10;

S = 0.5 + sinn_An(1,x) + sinn_An(3,x)+sinn_An(5,x) + sinn_An(7,x);
S1 = fourier_square(10,x);

%b1 = 2.0/pi;
%b3 = 2.0/(3.0*pi);
%b5 = 2.0/(5.0*pi);
%b7 = 2.0/(7.0*pi);
%S = 0.5 + b1*sin(1.0*x) + b3*sin(3.0*x) + b5*sin(5.0*x) + b7*sin(7.0*x);

plot(x/(2.0*pi),S1,'color','black');
hold on;
grid on;
axis([-1 11 -0.5 1.5]);
xlabel("x/(2pi)");
ylabel("Amplitude");
plot(x/(2.0*pi),square(x)*0.5+0.5,'color','red');