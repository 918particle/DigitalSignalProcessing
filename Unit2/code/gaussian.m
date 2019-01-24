clear;
close;
home;
pkg load signal;

%dsp parameters for x-axis:
fs = 1000.0; %Hz
T = 5.0; %Total time
dt = 1/fs;
df = 1/T;
f = transpose([df:df:fs/2+df]);
t = transpose([0.0:dt:T-dt]);
N = length(t)/2;
%dsp parameters for y-axis:
amplitude = 1.0;
mu = 4;
sigma_t = 0.1;
noise_sigma = 0.1;
x = exp(-2*pi*0.005);
a = 1-x;
b = x;
noise = randn(size(t))*noise_sigma;
%signals
y_in = amplitude*exp(-0.5*((t-mu)/sigma_t).^2)+noise;
y_out = zeros(size(y_in));

%filtering - forward
n = length(t);
for i=2:n
	y_out(i) = a*y_in(i)+b*y_out(i-1);
endfor

%Computing the spectrum
Y = sqrt(conj(fft(y_out)).*fft(y_out));
Y_R = Y(1:length(f))*dt;
Y_L = Y(length(f)-1:end)*dt;
%Computing the phase
Y_p = fft(y_out);
p = -unwrap( arg( Y_p( 1:length(f) ) ) )*180.0/pi;

%Plotting section
figure(1, 'position',[0,0,1000,1000]);
subplot(3,1,1);
plot(t,y_out,'color','black','linewidth',2.0);
xlabel('Time (seconds)','fontname','Courier','fontsize',20);
ylabel('Signal (Volts)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
axis([0-dt*50 T+dt*10 -2.1*amplitude 2.1*amplitude]);
subplot(3,1,2);
hold on;
semilogx(f,20*log10(Y_R),'color','black','linewidth',2.0);
semilogx(f,20*log10(flipud(Y_L)),'color','blue','linewidth',2.0);
axis([df fs/2+df*10 -100 0]);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('Signal (dB)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
box on;
subplot(3,1,3);
hold on;
semilogx(f,p,'color','black','linewidth',2.0);
axis([df fs/2+df*10 -2000 200]);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('Phase (deg)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
box on;