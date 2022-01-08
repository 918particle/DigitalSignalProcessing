
R = 50.0;
C = 470.0e-12;
L = 54.0e-6;

omegaLC = 1.0/(sqrt(L*C));
t = R*C;
omega = [0.0:1.0e3:2.0e6]*2.0*pi;
k = sqrt(1-(omega/omegaLC).^2);
d = k.^4+(omega*t).^2;
n1 = k.^4;
n2 = k.^2.*omega*t;
h = n1./d - i*n2./d;

plot(omega/2/pi/1e6,20*log10(abs(h)))