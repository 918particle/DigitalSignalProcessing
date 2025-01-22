clear;
close;
home;

fs = 44000.0;
dt = 1/fs;
f = 440.0;

t = 0.0:dt:0.1; %Octave is awesome!!
S1 = sin(2.0*pi*f.*t);
S2 = sin(2.0*pi*f*2.*t);
S_all = [];
for i=1:8
	if(mod(i,2)==0)
		S_all = [S_all S1];
	else
		S_all = [S_all S2];
	endif
endfor
player = audioplayer(S_all,fs,8);
play(player)
