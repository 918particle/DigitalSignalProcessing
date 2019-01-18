clear;
close;
home;
pkg load signal;

%dsp parameters for x-axis:
fs = 1000.0; %Hz
f_sig = 75; %Hz
T = 20.0; %Total time (1 sec)
dt = 1/fs;
df = 1/T;
f = transpose([0:df:fs/2]);
t = transpose([0.0:dt:T-dt]);
N = length(t)/2;
%dsp parameters for y-axis:
amplitude = 1.0;
noise_sigma = 1.0;
noise = randn(size(t))*noise_sigma;
y = amplitude*sin(2.0*pi*f_sig.*t)+noise;

%filtering
[b1,a1] = butter(8,0.3);
[b2,a2] = butter(8,0.01,"high");
y = filter(b1,a1,y); %low-pass
y = filter(b2,a2,y); %high-pass

%Computing the spectrum
Y = sqrt(conj(fft(y)).*fft(y));
Y_R = Y(1:length(f))*dt;
Y_L = Y(length(f)-1:end)*dt;

%Plotting section
figure(1, 'position',[0,0,1000,1000]);
subplot(2,1,1);
plot(t,y,'color','black','linewidth',2.0);
xlabel('Time (seconds)','fontname','Courier','fontsize',20);
ylabel('Signal (Volts)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
axis([0-dt*50 T+dt*50 -amplitude*10 amplitude*10]);
subplot(2,1,2);
hold on;
plot(f,20*log10(Y_R),'color','black','linewidth',2.0);
plot(f,20*log10(flipud(Y_L)),'o','color','blue','linewidth',2.0);
axis([0-df*50 fs/2+df*50 -50 50]);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('20*log_{10}(Signal (V/Hz))','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
legend('Signal+Noise (Positive frequencies)','Signal+Noise (Negative frequencies)','location','north');
box on;