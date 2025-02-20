clear;
close;
home;
pkg load signal;

%dsp parameters for x-axis:
fs = 2.0e4; %Hz
dt = 1/fs;
T = 1e3*dt;
df = 1/T;
f = transpose([0:df:fs/2]);
t = transpose([dt:dt:T]);

%dsp parameters for y-axis:
amplitude = 2.0;
noise_sigma = 1e-1;
noise = randn(size(t))*noise_sigma;
y = zeros(size(t));
y(1) = amplitude;
y = y+noise;

%filtering
%[b1,a1] = butter(8,0.5,"low");
%[b2,a2] = butter(8,0.5,"high");
%y = filter(b1,a1,y); %low-pass
%y = filter(b2,a2,y); %high-pass

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
axis([0-dt T+dt -amplitude*1.1 amplitude*1.1]);
subplot(2,1,2);
hold on;
plot(f,20*log10(Y_R),'color','black','linewidth',2.0);
plot(f,20*log10(flipud(Y_L)),'o','color','blue','linewidth',2.0);
axis([0-df*10 fs/2+df*10 -120 0]);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('20*log_{10}(Signal (V/Hz))','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
legend('Signal+Noise (Positive frequencies)','Signal+Noise (Negative frequencies)','location','north');
box on;
