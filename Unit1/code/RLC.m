clear;
home;

R = 50.0;
C = 470.0e-12;
L = 2.0*54.0e-6;

omega_LC = 1.0/(sqrt(L*C));
tau = R*C;
omega = [0.0:1.0e3:10.0e6];
k = sqrt(1-(omega/omega_LC).^2);
d = k.^4+(omega*tau).^2;
x = k.^4;
y = k.^2.*omega*tau;
h = x./d -i*y./d;

plot(omega,h)
