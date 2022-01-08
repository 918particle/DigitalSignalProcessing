clear;
home;

R = 50.0;
C = 470.0e-12;
L = 54.0e-6;
tau = R*C;
omega_LC = 1.0/sqrt(L*C);
omega =[0.0:0.01:2];
omega = omega .* 10e6

function r = rlc(omega,omega_LC,tau)
k_squared = 1-(omega./omega_LC).^2
x = k_squared .* k_squared
denominator = x + (omega.*tau).^2
r_real = x./ denominator
r_imag = (omega.*tau.*k_squared)./ denominator
r = r_real- i*r_imag 
endfunction
plot(omega/2/pi/1e6,20*log10(abs(rlc(omega,omega_LC,tau))),'linewidth',3.0,'color','blue')