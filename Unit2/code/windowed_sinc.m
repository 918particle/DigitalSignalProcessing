clear;
close;
home;
pkg load signal;

%dsp parameters for x-axis:
fs = 10.0e3; %Hz
f_sig = 1200; %Hz
T = 1.0; %Total time (1 sec)
dt = 1/fs;
t = transpose([dt:dt:T]);
%dsp parameters for y-axis:
amplitude = 1.0;
noise_sigma = 1.0;
noise = randn(size(t))*noise_sigma;
y = noise;

%Low-pass filtering
M = 100;
i = [1:M];
fc = f_sig/fs;
lp_kernel = transpose(sin(2*pi*fc.*(i-M/2))./(i-M/2)).*blackman(M);
lp_kernel(end/2) = 2*pi*fc;
lp_kernel = conv(lp_kernel,lp_kernel);
lp_kernel = lp_kernel/(sqrt(sum(lp_kernel.*lp_kernel)));
z = conv(y,lp_kernel);

%Computing the filtered spectrum
Z = sqrt(conj(fft(z)).*fft(z));
Z = Z(1:end/2)*dt;
f = linspace(0,fs/2,length(Z));

%Plotting section
figure(1, 'position',[0,0,1000,1000]);
plot(f,20*log10(Z),'color','black','linewidth',2.0);
axis([0 fs/2 -250 10]);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('Amplitude (dB/Hz)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
box on;