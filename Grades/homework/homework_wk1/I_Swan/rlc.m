clear;
home;

R = 50.0;
C = 470.0e-12;
L = 54.0e-6;
tau = R*C;
omega_LC = 1.0/(sqrt(L*C));
omega = [0.0:1.0e3:2.0e6]*2.0*pi;

k = sqrt(1-(omega/omega_LC).^2);
x = k.^4;
d = k.^4 + (omega*tau).^2;
y = omega*tau.*k.^2;
h = x./d - i*y./d;


plot(omega/2/pi/1e6,20*log10(abs(h)),'linewidth',3.0,'color','black')
xlabel('Frequency [MHz]')
ylabel('Transfer [dB]')
