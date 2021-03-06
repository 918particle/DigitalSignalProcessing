clear;
close;
home;
pkg load signal;

%dsp parameters for x-axis:
fs = 10000.0; %Hz
T = 2.0; %Total time
dt = 1/fs;
df = 1/T;
f = transpose([df:df:fs/2+df]);
t = transpose([0.0:dt:T-dt]);
N = length(t)/2;
%dsp parameters for y-axis:
noise_sigma = 1.0;
amplitude = 2.0; %An SNR of only 2.0!
noise = randn(size(t))*noise_sigma;
x = exp(-2*pi*0.025);
a = 1-x;
b = x;
%signals
y_in = zeros(size(t));
y_in(1000:1300) = amplitude;
y_in(1301:1600) = -amplitude;
y_in = y_in+noise;
y_out = zeros(size(y_in));

%filtering
n = length(y_in);

for i=2:n
	y_out(i) = a*y_in(i)+b*y_out(i-1);
endfor

%Computing the spectrum
Y = sqrt(conj(fft(y_out)).*fft(y_out));
Y_R = Y(1:length(f))*dt;
Y_L = Y(length(f)-1:end)*dt;

%Plotting section
figure(1, 'position',[0,0,1000,1000]);
subplot(2,1,1);
plot(t,y_out,'color','black','linewidth',2.0);
xlabel('Time (seconds)','fontname','Courier','fontsize',20);
ylabel('Signal (Volts)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
axis([0-dt*50 T+dt*50 -5*noise_sigma 5*noise_sigma]);
subplot(2,1,2);
hold on;
semilogx(f,20*log10(Y_R),'color','black','linewidth',2.0);
semilogx(f,20*log10(flipud(Y_L)),'o','color','blue','linewidth',2.0);
axis([df fs/2+df*50 -70 20]);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('20*log_{10}(Signal (V/Hz))','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
legend('Signal+Noise (Positive frequencies)','Signal+Noise (Negative frequencies)','location','north');
box on;