clear;
close;
home;

fs = 1e3;
dt = 1/fs;
totalT = 100.0;
t = dt:dt:totalT;
t0 = 1.0;
T = 0.0725;

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

function retval = dft_sync(f,N,M)
k = 0:length(f);
retval = zeros(k,1);
for i=[0:N]
retval(i) = abs(sin(pi*i*M/N)/sin(pi*i/N));
endfor
endfunction

sig = sP(t,t0,T);
[f,S] = set_spectrum(t,t0,T,fs);
N = length(S);

parseval_theorem_check = [sum(sig.^2) sum(S.^2)/N];


