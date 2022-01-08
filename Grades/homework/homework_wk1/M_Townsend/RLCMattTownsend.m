
%RLC Function Example 
%Matthew Townsend

function r = RLC()
  Resistance = 50.0; %Ohms
  Capacitor = 470.0e-12; %Farads
  Inductor = 54.0e-6; %Henries
  tau = (Resistance*Capacitor);
  omega_LC = 1.0/(sqrt(Inductor*Capacitor));
  omega = [0.0:1.0e3:2.0e6]*2.0*pi;
  
  k_squared = sqrt(1-(omega/omega_LC).^2);
  k_fourth = k_squared.^4;
  denominator = k_squared.^4+(omega*tau).^2;
  imaginary = k_squared.^2 .* omega*tau;
  final = k_fourth./denominator - i*imaginary./denominator;
  
  plot(omega/2/pi/1e6,20*log10(abs(final)))
  xlim([0 2.0]);
  ylim([-30.0 10.0]);
  set(gca,"fontsize",12);
  grid("on");
  title("Magnitude");
  xlabel("Frequency (MHz)");
  ylabel("Amplitude");
endfunction


 