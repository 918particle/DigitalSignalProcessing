clear;
close;
home;

fs = 1e3;
dt = 1/fs;
totalT = 20.0;
t = dt:dt:totalT;
t0 = 1.0;
T = 0.1;

function retval = sP(x,t0,T)
  dt = x(2)-x(1);
  retval = zeros(size(x));
  retval(find(and(x>t0-T/2,x<t0+T/2-dt))) = 1.0;
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
  kmax = length(f);
  retval = zeros(kmax,1);
  for i=[1:kmax]
    retval(i) = abs(sin(pi*i*M/N)/sin(pi*i/N));
  endfor
endfunction

sig = sP(t,t0,T);
[f,S] = set_spectrum(t,t0,T,fs);
N = length(S);
parseval_theorem_check = [sum(sig.^2) sum(S.^2)/N];

N = length(t);
M = length(find(sig>0));
sync_spec = dft_sync(f,N,M);
plot(f,sync_spec,'color','red')
hold on
plot(f,S,'--','color','black')