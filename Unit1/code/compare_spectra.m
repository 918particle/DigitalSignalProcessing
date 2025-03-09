clear;
close;
home;

fs = 1e3;
dt = 1/fs;
totalT = 1.0;
t = dt:dt:totalT;
t0 = 0.1;
T = 0.01;

function retval = sP(x,t0,T)
  retval = zeros(size(x));
  retval(find(and(x>t0-T/2,x<t0+T/2))) = 1.0;
endfunction

function [f,S] = set_spectrum(t,t0,T,fs)
  s = sP(t,t0,T);
  S = fft(s);
  S = S(1:end/2);
  S = abs(S);
  N = length(S);
  f = linspace(0,fs/2,N);
endfunction

subplot(4,2,1)
[f,S] = set_spectrum(t,t0,T,fs);
plot(f,S)
xlabel("Frequency (Hz)")
subplot(4,2,2)
plot(t,sP(t,t0,T))
xlabel("Time (s)")
subplot(4,2,3)
[f,S] = set_spectrum(t,t0,T*2,fs);
plot(f,S)
xlabel("Frequency (Hz)")
subplot(4,2,4)
plot(t,sP(t,t0,T*2))
xlabel("Time (s)")
subplot(4,2,5)
[f,S] = set_spectrum(t,t0,T*4,fs);
plot(f,S)
xlabel("Frequency (Hz)")
subplot(4,2,6)
plot(t,sP(t,t0,T*4))
xlabel("Time (s)")
subplot(4,2,7)
[f,S] = set_spectrum(t,t0,T*8,fs);
plot(f,S)
xlabel("Frequency (Hz)")
subplot(4,2,8)
plot(t,sP(t,t0,T*8))
xlabel("Time (s)")
