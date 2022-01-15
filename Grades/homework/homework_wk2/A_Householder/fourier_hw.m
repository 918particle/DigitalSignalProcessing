%by Andrew Householder
x = [0.0:0.001:10*pi];
n = 15; 		%number of terms in approximating sum

%trapezoid rule to approximate integrals
function area = riemann(f,a,b,s,n)
	dx = (b-a)/s;
	sum = 0.0;
	for t = 0:(s-1)
		sum = sum + f(a + (t*dx),n) + f(a + ((t+1)*dx),n); 		%f is a function of both x and n for fourier coeff.
	endfor
	area = 0.5*dx*sum;
endfunction

%semicircle function
function y = f(x,n)
	r = pi;
	y = sqrt(r^2-(mod(x-2*r,2*r)-r).^2);
endfunction

function y = fcos(x,n)
	r = pi;
	y = (1/pi)*cos(n.*x).*sqrt(r^2-(mod(x-2*r,2*r)-r).^2);
endfunction

function y = fsin(x,n)
	r = pi; 
	y = (1/pi)*sin(n.*x).*sqrt(r^2-(mod(x-2*r,2*r)-r).^2);
endfunction

function S = fourier_sum(x,n)
	S = riemann(@fcos,0,2*pi,700,0)/2;
	for i = [1:n]
		An = riemann(@fcos,0,2*pi,700,i);
		Bn = riemann(@fsin,0,2*pi,700,i);
		S = S + An.*cos(i.*x) + Bn.*sin(i.*x);
	endfor
endfunction

S1 = fourier_sum(x,n);

figure(1);
subplot(2,1,1);
plot(x,f(x,n),'linewidth',3,'color','b')
axis([0 max(x) 0 6])
set(gca(),'fontsize',26)
xlabel('Independent Parameter')
ylabel('Dependent Parameter')
legend('Repeating semicircles','location','north')

hold on

subplot(2,1,2);
plot(x,S1,'linewidth',3,'color','r')
set(gca(),'fontsize',26)
xlabel('Independent Parameter')
ylabel('Dependent Parameter')
axis([0 max(x) 0 6])
legend('Fourier Approx. N=15','location','north')

fs = 44000.0;
player = audioplayer(f(x,n),fs,8);
play(player)

pause(1)

player = audioplayer(S1,fs,8);
play(player)
