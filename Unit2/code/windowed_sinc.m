clear;
close;
home;

fs = 1.0e4;
fcl = 2.6e3;
fch = 2.4e3;
fcl = fcl/fs;
fch = fch/fs;
dt = 1/fs;
T = 1.0;
y = randn(size(dt:dt:T));
y = y/sqrt(sum(y.*y));
N = 201;
n = 0:N-1;
alpha = (N-1)/2;
%Low-pass filter design
h_lp = sin(2*pi*fcl*(n-alpha))./(pi*(n-alpha));
h_lp(alpha+1) = 2*fcl;
h_lp = transpose(h_lp).*blackman(N);
%High-pass filter design
h_hp = sin(2*pi*fch*(n-alpha))./(pi*(n-alpha));
h_hp(alpha+1) = 2*fch;
h_hp = transpose(h_hp).*blackman(N);
h_hp = -h_hp;
h_hp(alpha+1) = 1+h_hp(alpha+1);
%DFT computation
z = conv(conv(y,h_hp),h_lp);
Z = fft(z);
Z = 20*log10(abs(Z(1:end/2)*dt));
f = linspace(0,fs/2,length(Z));
%Plotting
plot(f,Z)
set(gca(),'fontname','Courier','fontsize',20);
xlabel('Frequency (Hz)');
ylabel('Signal (dB/Hz)');
axis([0 fs/2 -200 0]);