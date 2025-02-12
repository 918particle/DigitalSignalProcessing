clear;
close;
home;

%functions
%n is a constant
function retval = sinn_An(n,x)
	An = 2.0/pi/n;
	retval = An*sin(n.*x);
endfunction

%The full series
function retval = fourier_square(n,x)
	retval = 0.5;
	for i=[0:n]
		retval = retval+sinn_An(2*i+1,x);
	endfor
endfunction

%Prediction, for plotting
function retval = predict(f)
	retval = zeros(size(f));
	retval(1) = 0.5;
	n = length(f);
	for i=2:n
		retval(i) = 2.0/pi/i;
	endfor
endfunction

%dsp parameters for x-axis:
fs = 1000.0; %Hz
f_0 = 4; %Hz
T = 2.0; %Total time (10 sec)
dt = 1/fs;
df = 1/T;
f = transpose([0:df:fs/2-df]);
t = transpose([0.0:dt:T-dt]);
N = length(t)/2;
%dsp parameters for y-axis:
amplitude = 1;
n_modes = 25;
noise_sigma = 0.001;
noise = randn(size(t))*noise_sigma;
y = amplitude*fourier_square(n_modes,2*pi*f_0*t)+noise;
%y = y-mean(y);
Y = sqrt(conj(fft(y)).*fft(y));

%Check Parseval theorem
sum(y.^2)
sum(Y.^2)/length(t)

Y_R = Y(1:length(f))*dt;
Y_L = Y(length(f)+1:end)*dt;
P = predict(f);
P = P*max(Y_R)/max(P);
spectrum = 20*log10(Y_R);
prediction = 20*log10(P);
spectrum = spectrum-max(spectrum);
prediction = prediction+13.0;

%Plotting section
figure(1, 'position',[0,0,650,650]);
subplot(2,1,1);
plot(t,y,'color','black','linewidth',2.0);
xlabel('Time (seconds)','fontname','Courier','fontsize',16);
ylabel('Amplitude (Volts)','fontname','Courier','fontsize',16);
set(gca(),'fontname','Courier','fontsize',16);
axis([0-dt*50 T+dt*50 -0.5 amplitude*1.5]);
subplot(2,1,2);
hold on;
plot(f,spectrum,'color','black','linewidth',2.0);
axis([0-df*50 fs/2+df*50 -100 10]);
plot(f,prediction,'color','red','linewidth',2.0);
xlabel('Frequency (Hz)','fontname','Courier','fontsize',16);
ylabel('Amplitude (dB)','fontname','Courier','fontsize',16);
set(gca(),'fontname','Courier','fontsize',16);
%hl = legend('Signal+Noise (Positive frequencies)','Signal+Noise (Negative frequencies)','2pi/(f/f_0)','location','north');
%set(hl,'fontname','Courier','fontsize',10,'box','off');
box on;

%Printint to PDF
print -dpdf "octave1.pdf"
