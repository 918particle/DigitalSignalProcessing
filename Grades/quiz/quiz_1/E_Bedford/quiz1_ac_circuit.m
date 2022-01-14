clear;
home;

R = 43.0; %Units: Ohms
C = 230.0e-10; %Units: Farads
L = 0

omega_LC = 4.0/(sqrt(L*C));
tau = R*C;
omega = [0.0:1.0e3:2.0e6]*2.0*pi;
k = sqrt(1-(omega/omega_LC).^2);
d = k.^4+(omega*tau).^2;
x = k.^4;
y = k.^2.*omega*tau;
h = x./d - i*y./d;

plot(omega/2/pi/1e6,20*log10(abs(h)),'linewidth',2.0,'color','blue')
set(gca(),'fontname','Courier','fontsize',18)
xlabel('Frequency [MHz]')
ylabel('Transfer [dB]')