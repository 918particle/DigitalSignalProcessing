clear;
home;

R = 50.0; #Ohms
L = 54.0e-6; #Henries
C = 470.0e-12; #Farads

omega_LC = 1.0/(sqrt(L*C));
tau = R*C;
omega = [0.0:0.01: 12.0];
omega = omega .* 10^6;

function r = rlc(omega,omega_LC,tau)
k_squared = 1 - (omega./omega_LC).^2;
k_fourth = k_squared .* k_squared;
denominator = k_fourth + (omega .* tau).^2;
r_real = k_fourth./denominator;
r_imag = (omega.*tau.*k_squared)./denominator;
r = r_real - i*r_imag;
endfunction

plot(omega/2/pi/1e6, (abs(rlc(omega, omega_LC, tau))),'linewidth',3.0,'color','black')
set(gca(),'fontname','Courier','fontsize',18)
xlabel('Frequency [MHz]')
ylabel('Amplitude')

