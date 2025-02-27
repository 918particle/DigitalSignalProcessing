clear;
close;
home;

%n is a constant
function retval = sinn_An(n,x)
	An = -1.0./n/pi;
	retval = An*sin(n.*x);
endfunction

%The full series
function retval = fourier_saw(n,x)
	retval = 0.5;
	for i=[1:n]
		retval = retval+sinn_An(i,x);
	endfor
endfunction

%dsp parameters for x-axis:
fs = 2.0e4; %Hz
dt = 1/fs;
N = 20000;
T = N*dt;
t = [dt:dt:T];
f = 440.0; %Hz

%dsp parameters for y-axis:
amplitude = 2.0;
noise_sigma = 1e-1;
noise = randn(size(t))*noise_sigma;
x = 2*pi*f*t;
s = fourier_saw(100,x)+noise;

%the impulse response of the LP filter
f0 = 100*f;
filter_kernel = 2*pi*f0*exp(-2*pi*f0*t);
s_filt = conv(s,filter_kernel);

player = audioplayer(s,fs,8);
play(player)