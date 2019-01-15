clear;
close;
home;

%functions
%n is a constant
function retval = sinn_An(n,x)
	An = 2.0/pi/n;
	retval = An*sin(2.0*pi*n.*x);
endfunction

%The full series
function retval = fourier_square(n,x)
	retval = 0.5;
	for i=[0:n]
		retval = retval+sinn_An(2*i+1,x);
	endfor
endfunction

%dsp parameters for x-axis:
fs = 200.0; %Hz
f_0 = 1; %Hz
T = 30.0; %Total time (1 sec)
dt = 1/fs;
df = 1/T;
f = transpose([0:df:fs/2]);
t = transpose([0.0:dt:T-dt]);
N = length(t)/2;
%dsp parameters for y-axis:
amplitude = 2.0;
n_modes = 60;
noise_sigma = 0.1;
noise = randn(size(t))*noise_sigma;
y = fourier_square(n_modes,t*f_0)+noise;
y = y-mean(y);
Y = sqrt(conj(fft(y)).*fft(y));

%Check Parseval's theorem
%sum(y.^2)
%sum(Y.^2)/length(t)

Y = Y(1:length(f))*dt;

%Plotting section
figure(1, 'position',[0,0,1000,1000]);
subplot(2,1,1);
plot(t,y,'color','black','linewidth',2.0);
xlabel('Time (seconds)','fontname','Courier','fontsize',20);
ylabel('Signal (Volts)','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
axis([0-dt*50 T+dt*50 -amplitude*1.1 amplitude*1.1])
subplot(2,1,2);
plot(f,log10(Y),'color','black','linewidth',2.0);
axis([0-df*50 fs/2+df*50 -2 2]);
hold on;
plot(f,log10(2.0*pi./(f/f_0)),'color','red','linewidth',2.0);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',20);
ylabel('log_{10}(Signal (V/Hz))','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
legend('Signal+Noise','2.0*pi/(f/f_0)');