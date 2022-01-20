## Copyright (C) 2022 Jackson Diamond
## Author: Jackson Diamond <jackson@Jacksons-MBP.home>
## Created: 2022-01-16
clear;
home;
pkg load signal;

function retval = quiz2 (input1, input2)
  retval = disp('start quiz 2');
endfunction
quiz2(10,20)
% Review Material Q1
disp('the review section')
a = -2 + i*2;
b = -2 - i*2;
c = 2 - i*2;
function retval = GetPhase (z)
  retval = atan(imag(z)/real(z))*180/pi; % in degrees now
endfunction
disp('The phase angles are:')
GetPhase(a)
GetPhase(b)
GetPhase(c)

% Q2
disp('A sinusoidal signal f(t)=A·cos(ωt+θ) can be represented by a phasor F=Ae^jθ at t=0')
function retval = CalcPhasor(A,w,phi)
   retval = A * exp(i*phi);
endfunction
disp('The phasors that best repsent the sineoids are:')
CalcPhasor(4,10.0,(pi/6))  % v(t) = 4 cos(2π(10.0)t + 30◦)
% change sine to cosine => phi + 90
newAngle = (-(pi/3)+(pi/2));
CalcPhasor(2,10.0,newAngle) % v(t) = 2 sin(2π(10.0)t − 60◦)

% Fouier Analysis 
disp("Fouier Analysis")
function retval = SinSqu(n,x)
	retval =  ((sin((2.0*pi*x).*(2.0*n - 1)))/(2.0*n -1)); %sine repsentation of square wave 
endfunction

function retval = expSqu(n,x) % This is the correct exopentital form of it but still no imagnary numbers
	retval =  (exp(i*((2.0*pi*x).*(2.0*n - 1))) - exp(-i*((2.0*pi*x).*(2.0*n - 1))))/((2*i).*(2.0*n -1));
endfunction
%The full series
function retval = fourier_square(n,x)
	retval = 0.0;
	for i=[1:n] % summation
		retval = retval+expSqu(i,x);
	endfor
  retval = retval*(4/pi);
endfunction
x = 0.0:0.001:(2.0*pi); 
S1 = fourier_square(1000,x);
plot(x,S1);
axis([0 8 -1.5 1.5]);
% Q1  
phasesV = atan(imag(S1)/real(S1)); % Couldn't figure out how to get the phase directly from the function
figure(2);
plot(x,2*pi*x); %frequency vs phases?
xlabel('Frequency');
ylabel('Phases');

% Q2
disp("The magntuide is :")
m = sqrt(sum(S1.*S1))
disp("Based on the graph of the fourier square there seems to be no point with zero magntuide")
disp("because of how extreme the values are close to the period")

disp("Probablity and Statistics ")
% Q1
p = rand(1000,1);
P = ((p - min(p))/(max(p) - min(p))); %normalized p
figure(3)
plot(P)
quad(P,0,1)

% Q2
disp("The statistical mean of the disturbtion is : ")
st = mean(P)

% Q3
disp("The standard deviation of the function is : ")
sd = std(P)
  