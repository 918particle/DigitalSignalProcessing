clear;
home;
close;
pkg load signal;

%n is a constant
function retval = sinn_An(n,x)
	An = 2/pi/n;
	retval = An*sin(n.*x);
endfunction

%The full series
function retval = fourier_square(n,x)
	retval = 0.5;
	for i=[0:n]
		retval = retval+sinn_An(2*i+1,x);
	endfor
endfunction

f = 10.0; %Hz
t = 0.0:0.001:2;
x = 2.0*pi*f*t;

S = 0.5 + sinn_An(1,x) + sinn_An(3,x)+sinn_An(5,x) + sinn_An(7,x);
S1 = fourier_square(100,x);

plot(t,S,'-','color','black','linewidth',3);
hold on;
grid on;
xlabel("x");
ylabel("Amplitude");
plot(t,square(x)*0.5+0.5,'o','color','red','linewidth',3);
set(gca(),'fontsize',30)
axis([-0.1 2.1 -2 2])
