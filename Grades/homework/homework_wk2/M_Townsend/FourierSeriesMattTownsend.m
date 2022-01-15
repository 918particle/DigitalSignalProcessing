
%Fourier Square Series that plays a noise 
%through the speakers when amplitude is peaking and turns back off
%then graph will appear. 

pkg load signal; 

function product = product_An(n,x)
  An = 2.0/pi/n;
  product = An*sin(n.*x);
endfunction 

function product = Series(n,x)
  product = 0.5;
  for i=[0:n]
    product = product+product_An(2*i+1,x);
    fs = 44100;
    ts = 0:1/fs:1;
    signal = cos(2*pi*500*ts);
    player = audioplayer(signal, fs,8);
    playblocking(player);
    endfor
endfunction 

x = 0.0:0.001:(2.0*pi)*5;
S = Series(4,x);

plot(x,S,'color','blue','linewidth',4);
title("Fourier Series (Square)");
xlabel("X","fontsize",12);
ylabel("Amplitude","fontsize",12);
axis([-1 32 -.2 1.3]);
set(gca, "fontsize",18);
hold on;
grid on;
plot(x,square(x)*0.5+0.5,'color','green','linewidth',4);

