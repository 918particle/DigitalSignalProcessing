fs = 1000.0;
dt = 1/fs;
t = [0:dt:4];

function retval = An_sin(n,x);
  An = 2.0/pi/n;
  retval = An*sin(n.*x);
 endfunction

x = 0.0:1:(2.0*pi)*10;

y = sin(2.0.*pi*132.0*t);
y1 = 2*y;

plot(t,y1,'color','black','linewidth',3);
xlabel("Time (secs)");
ylabel("Amplitude (Volts)");
grid on
axis([0 1 -1 1]);
player = audioplayer(y1,fs,8);
play(player)