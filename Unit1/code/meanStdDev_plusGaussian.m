clear;
%dsp parameters
scale = 100;
fs = 1000.0;
dt = 1.0/fs;
t1 = 0.0;
t2 = 10.0;
mu = 5.0;
sigma = 1.0;
amp = 2.0;
%plotting parameters
linew = 0.5;
startx = 0;
starty = 0;
width = 2000;
height = 2000;
axisVector=[-0.5 10.5 -10 10];
fonts = 16;
fontn = 'Courier';

%calculations
times = [t1:dt:t2];
n = length(times);
window_size = floor(n/scale);
amplitudes = randn(size(times))+amp*exp(-0.5*((times-mu)/sigma).^2);
average_amplitudes = zeros(size(times));
average_amplitudes_mvg_ave = filter(ones(window_size,1)/window_size,1,amplitudes);
for i=window_size+1:n
	average_amplitudes(i) = mean(amplitudes(i-window_size:i));
	stddev_amplitudes(i) = std(amplitudes(i-window_size:i));
endfor

%plotting
figure(1,"position",[startx starty width height]);
subplot(2,1,1);
h1 = plot(times,amplitudes);
set(gca(),'fontname',fontn,'fontsize',fonts);
set(h1,'color',[0 0 0],'linewidth',linew);
xlabel('Time (s)','fontname',fontn,'fontsize',fonts);
ylabel('Voltage (V)','fontname',fontn,'fontsize',fonts);
axis(axisVector);
subplot(2,1,2);
hold on;
box on;
h2 = plot(times,average_amplitudes_mvg_ave,'linewidth',linew);
%h2 = plot(times,average_amplitudes,'linewidth',linew);
h3 = plot(times,stddev_amplitudes+average_amplitudes_mvg_ave,'linewidth',linew);
h4 = plot(times,-stddev_amplitudes+average_amplitudes_mvg_ave,'linewidth',linew);
xlabel('Time (s)','fontname',fontn,'fontsize',fonts);
ylabel('Voltage (V)','fontname',fontn,'fontsize',fonts);
set(gca(),'fontname',fontn,'fontsize',fonts);
set(h2,'color',[0 0 0]);
set(h3,'color',[0.2 0.2 0.2]);
set(h4,'color',[0.2 0.2 0.2]);
legend();
axis(axisVector);

print -dpdf meanStdDev_plusGaussian.pdf