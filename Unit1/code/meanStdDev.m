clear;
scale = 100;
fs = 1000.0;
dt = 1.0/fs;
t1 = 0.0;
t2 = 10.0;
times = [t1:dt:t2];
amplitudes = randn(size(times));
n = length(times);
window_size = floor(n/scale);
average_amplitudes = zeros(size(times));

for i=window_size+1:n
	average_amplitudes(i) = mean(amplitudes(i-window_size:i));
	stddev_amplitudes(i) = std(amplitudes(i-window_size:i));
endfor

startx = 0;
starty = 0;
width = 2000;
height = 2000;
axisVector=[-0.5 10.5 -5 5];
figure(1,"position",[startx starty width height]);
subplot(2,1,1);
h1 = plot(times,amplitudes,'color','black','linewidth',2);
set(gca(),'fontname','Courier','fontsize',16);
axis(axisVector);
subplot(2,1,2);
h2 = errorbar(times,average_amplitudes,stddev_amplitudes);
set(h2,'color',[0 0 0]);
set(gca(),'fontname','Courier','fontsize',16);
axis(axisVector);

print -dpdf meanStdDev.pdf