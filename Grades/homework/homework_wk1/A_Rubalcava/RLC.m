R = 50.0;
C = 470.0e-12;
L = 50e-6;

tau = R*C; 
omega = [0.0:1.0e3:2.0e6]*2.0*pi;
omega_LC = 1.0/(sqrt(L*C)); 
k = sqrt(1-(omega/omega_LC).^2);
n = k.^4+(omega*tau).^2;
m = k.^4;
%n = k.^4+(omega*tau)^2; 
o = k.^2.*omega*tau; 
h = m./n - j*o./n; 

plot(omega/2/pi/1e6,20*log10(abs(h)),'linewidth',2.0,'color','green')
set(gca(), 'fontname', 'Courier', 'Fontsize', 18)
xlabel('Frequency [MHz]')
ylabel ('Transfer [dB]')

