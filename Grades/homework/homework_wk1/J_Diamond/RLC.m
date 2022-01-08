clear;
home;

R = 50.0; %Units: Ohms
C = 470.0e-12; %Units: Farads
L = 54.0e-6; %Units: Henries

function retval = RLC_Plot(R,C,L)
  omega_LC = 1.0/(sqrt(L*C));
  tau = R*C;
  omega = [0.0:1.0e3:2.0e6]*2.0*pi;
  k = sqrt(1-(omega/omega_LC).^2);
  d = k.^4+(omega*tau).^2;
  x = k.^4;
  y = k.^2.*omega*tau;
  h = x./d - i*y./d;
  retval = plot(omega/2/pi/1e6,20*log10(abs(h)),'linewidth',3.0,'color','black')
  set(gca(),'fontname','Courier','fontsize',18)
  xlabel('Frequency [MHz]')
  ylabel('Transfer [dB]')
endfunction
disp(RLC_Plot(R,C,L))