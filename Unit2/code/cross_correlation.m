clear;
close;
home;
pkg load signal

%Define a gaussian pulse
fs = 100.0e6; %Hz
dt = 1/fs; %seconds
T = 100e-6; %seconds
t = dt:dt:T; %seconds
mu1 = 10e-6; %seconds
s1 = 1.0e-6; %seconds
f_c = 1.0e6; %Hz
mu2 = 40e-6; %seconds
s2 = s1;
signal_1 = cos(2*pi*f_c*t).*exp(-0.5*(t-mu1).^2./s1^2);
signal_2 = cos(2*pi*f_c*t).*exp(-0.5*(t-mu2).^2./s2^2);
signal_1 = signal_1/sqrt(sum(signal_1.*signal_1));
signal_2 = signal_2/sqrt(sum(signal_2.*signal_2));

[R,lag] = xcorr(signal_2,signal_1);
[R_max,R_index] = max(R);
best_lag = lag(R_index);
time_lag = best_lag*dt;

R_fft = real(ifft(conj(fft(signal_1)).*fft(signal_2)));
lag_fft = (0:length(R_fft)-1);
[R_max_fft,R_index_fft] = max(R_fft);
best_lag_fft = lag_fft(R_index_fft);
time_lag_fft = best_lag_fft*dt;

display("Comparison between cross-correlation lag and true lag (microseonds)")
display([time_lag*1e6 time_lag_fft*1e6 (mu2-mu1)*1e6])

figure(1)
subplot(2,1,1)
plot(t*1e6,signal_1,'color','black');
hold on
plot(t*1e6,signal_2,'color','red');
axis([0 T*1e6 -0.2 0.2]);
set(gca(),'fontsize',20);
xlabel('Time (microseconds)');
ylabel('Amplitude (volts)');
legend('Signal 1','Signal 2')
subplot(2,1,2)
plot(lag*dt*1e6,R,'color','black');
axis([-T*1e6 T*1e6 -1.1 1.1])
xlabel('Time (microseconds)');
ylabel('Amplitude (volts)');
set(gca(),'fontsize',20);
h = legend('cross-correlation');
set(h,'location','northwest');