R = 50.0;
C = 470.0e-12;
L = 54.0e-6;

w_LC = 1.0/(sqrt(L * C));
t = R * C;
w = [0.0:1.0e3:2.0e6] * 2.0 * pi;
k = sqrt(1-(w/w_LC).^2);
d = k.^4+(w * t).^2;

X = k.^4;
Y = k.^2.* w * t;
H = X./d - i * Y./d;

plot(w/2/pi/1e6, 20 * log10(abs(H)),'linewidtH', 1.0, 'color', 'red')

set(gca(), 'fontname', 'Arial', 'fontsize', 14)

Ylabel('Transfer')
Xlabel('Freq(MHz)')
