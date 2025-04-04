clear;
close;
home;
pkg load signal;

%dsp parameters for x-axis:
fs = 1.0e4; %Hz
fc = 0.5e2; %Hz
fc = fc/fs;
x = exp(-2*pi*fc);
a0 = 1-x;
b1 = x;
N = 1000;
M = 100;

%Low-pass filtering
st = [zeros(M,1); ones(N-M,1);];
y = zeros(size(st));
y(1) = a0*st(1);
for i = 2:N
	y(i) = a0*st(i)+b1*y(i-1);
endfor

a0 = (1+x)/2;
a1 = -a0;
b1 = x;

%High-pass filtering
z = zeros(size(st));
z(1) = a0*st(1);
for i = 2:N
	z(i) = a0*st(i)+a1*st(i-1)+b1*z(i-1);
endfor

%Plotting section
figure(1, 'position',[0,0,1000,1000]);
subplot(2,1,1);
plot(st,'color','black','linewidth',2.0);
hold on;
plot(y,'color','red','linewidth',2.0);
axis([0 N+1 0 2]);
xlabel('Sample','fontname','Courier','fontsize',20);
ylabel('Amplitude','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);
subplot(2,1,2);
plot(st,'color','black','linewidth',2.0);
hold on;
plot(z,'color','red','linewidth',2.0);
axis([0 N+1 0 2]);
xlabel('Sample','fontname','Courier','fontsize',20);
ylabel('Amplitude','fontname','Courier','fontsize',20);
set(gca(),'fontname','Courier','fontsize',20);