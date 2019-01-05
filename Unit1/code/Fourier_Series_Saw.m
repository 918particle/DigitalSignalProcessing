clear;
home;
close;
pkg load signal;

%n is a constant
function retval = sinn_An(n,x)
	An = -1.0./n/pi;
	retval = An*sin(n.*x);
endfunction

function retval = sinn_An_mod(n,x)
	An = -1.0./n/pi*log10(1+n);
	retval = An*sin(n.*x);
endfunction

%The full series
function retval = fourier_saw(n,x)
	retval = 0.5;
	for i=[1:n]
		retval = retval+sinn_An(i,x);
	endfor
endfunction

function retval = fourier_saw_mod(n,x)
	retval = 0.5;
	for i=[1:n]
		retval = retval+sinn_An_mod(i,x);
	endfor
endfunction

x = 0.0:0.001:(2.0*pi)*10;

S = 0.5 + sinn_An(1,x) + sinn_An(3,x)+sinn_An(5,x) + sinn_An(7,x);
S1 = fourier_saw(20,x);
S2 = fourier_saw_mod(20,x);

%b1 = 2.0/pi;
%b3 = 2.0/(3.0*pi);
%b5 = 2.0/(5.0*pi);
%b7 = 2.0/(7.0*pi);
%S = 0.5 + b1*sin(1.0*x) + b3*sin(3.0*x) + b5*sin(5.0*x) + b7*sin(7.0*x);

plot(x/(2.0*pi),S1,'color','black');
hold on;
plot(x/(2.0*pi),S2,'color','blue');
grid on;
axis([-1 11 -0.5 1.5]);
xlabel("x/(2pi)");
ylabel("Amplitude");
plot(x/(2.0*pi),sawtooth(x)*0.5+0.5,'color','red');
xlabel("x/(2pi)","fontname","Courier","fontsize",20);
ylabel("Amplitude","fontname","Courier","fontsize",20);
set(gca(),"fontname","Courier","fontsize",20);