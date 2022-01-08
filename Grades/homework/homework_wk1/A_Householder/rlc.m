R = 50;
C = 470e-12;
L = 54e-6;

f = [0.0:.01:2];
f_mega = f.*10^6;
omega = f_mega.*2*pi;
omegaLC = 1/sqrt(L*C);
tau = R*C;

function r_val = h(omega, omegaLC, tau)
	K = sqrt(1-(omega./omegaLC).^2);
	d = (K.^4+(omega*tau).^2);
	X = K.^4./d;
	Y = -1*(K.^2.*omega*tau)./d;

	r_val = X + i*Y;

endfunction

plot(f,abs(h(omega, omegaLC, tau)),'linewidth',5, 'color','green')
set(gca(), 'fontsize', 30)
xlabel('Frequency (mHz)')
ylabel('Amplitude')
title('RLC Circuit')
axis([0 2 0 1.2])

