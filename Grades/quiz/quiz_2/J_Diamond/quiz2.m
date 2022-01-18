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
  retval = atan(imag(z)/real(z));
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

% Fouier Analysis - I tried to replicate these in my own way but was met with some frustration so I used yours
disp("Fouier Analysis")
function retval = exp_An(n,x)
	An = 2.0/pi/n;
	retval = (An/(2*i))*(exp(i*n.*x)-exp(-i*n.*x)); % changed to expoitenal form
endfunction
%The full series
function retval = fourier_square(n,x)
	retval = 0.0;
	for i=[1:n] % summation
		retval = retval+exp_An(i,x);
	endfor
endfunction
x = 0.0:0.001:(2.0*pi)*10; %time
% Q1  
S1 = fourier_square(1000,x);
phasesV = atan(S1); %There is no imagnary value for the transform
plot(x .^ -1,phasesV); %frequency vs phases
xlabel('Frequency');
ylabel('Phases');

% Q2
disp("The magntuide is :")
figure(2);
plot(x,S1);
m = sqrt(sum(S1.*S1))
disp("Based on the graph of the fourier square there seems to be no point with zero magntuide")
disp("because of how extreme the values are close to the period")

disp("Probablity and Statistics ")
% Q1
p = rand(1,100) + rand(1,100);
P = ((p - min(p))/(max(p) - min(p))); %normalized p
% I was confused by finding the probablity to be 1 but i beleive i normalized it correctly
quad(P,0,1)

% Q2
disp("The statistical mean of the disturbtion is : ")
st = sum(P)/size(P,2)

% Q3
disp("The standard deviation of the function is : ")
meanP = sum(P);
re = 0;
for i=[1:100]
  re = re + ((P(i) - meanP).^2);
endfor
sd = sqrt(re/100)
  