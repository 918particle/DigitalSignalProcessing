clear;
home;
pkg load signal;

x = 0.0:0.0001:(2.0*pi)*10;
b1 = 2.0/pi;
b3 = 2.0/(3.0*pi);
b5 = 2.0/(5.0*pi);
b7 = 2.0/(7.0*pi);
S = 0.5 + b1*sin(1.0*x) + b3*sin(3.0*x) + b5*sin(5.0*x) + b7*sin(7.0*x);

plot(x/(2.0*pi),S,'color','black');
hold on;
grid on;
axis([-1 11 -0.5 1.5]);
xlabel("x/(2pi)");
ylabel("Amplitude");
plot(x/(2.0*pi),square(x)*0.5+0.5,'color','red');