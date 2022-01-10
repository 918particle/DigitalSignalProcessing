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

x = 0.0:0.001:(2.0*pi)*10; %Octave is awesome!!

S = 0.5 + sinn_An(1,x) + sinn_An(3,x)+sinn_An(5,x) + sinn_An(7,x);
S1 = fourier_square(100,x);

plot(x,S1,'o','color','black','linewidth',3);
hold on;
grid on;
axis([-1 11 -0.5 1.5]);
xlabel("x");
ylabel("Amplitude");
plot(x,square(x)*0.5+0.5,'o','color','red','linewidth',3);
