clear;
home;
close;

fs = 44000.0
dt = 1/fs;
f= 3000.0;

function retval = sinn_An(n,t)
  An = 2/pi/n;
  retval = An *sin(n.*t);
endfunction

function retval = fourier_square(n,t)
	retval = 0.5;
	for i=[1:n]
		retval = retval+sinn_An(i,t);
	endfor
endfunction

t = 0.0:dt:1.0;
s1 = fourier_square(100,2.0*pi*f.*t);
s2 = sin(2.0*pi*f.*t);

player1 = audioplayer(s1,fs,8);
player2 = audioplayer(s2,fs,8);

play(player1)
pause
play(player2)