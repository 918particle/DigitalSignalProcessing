clear;
close;
home;

fs = 44000.0;
dt = 1/fs;
f = 440.0;

%n is a constant
function retval = sinn_An(n,t)
	An = 2/pi/n;
	retval = An*sin(n.*t);
endfunction

%The full series
function retval = fourier_square(n,t)
	retval = 0.5;
	for i=[1:n]
		retval = retval+sinn_An(i,t);
	endfor
endfunction

t = 0.0:dt:0.1; %Octave is awesome!!
S1 = fourier_square(100,2.0*pi*f.*t);
S2 = sin(2.0*pi*f.*t);
S3 = sin(2.0*pi*f*2.*t);
player = audioplayer([S2 S3 S2 S3 S2 S3 S2 S3],fs,8);
play(player)
