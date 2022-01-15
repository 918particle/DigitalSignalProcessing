## Copyright (C) 2022 Jackson Diamond
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} deltaFourier (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Jackson Diamond <jackson@Jacksons-MBP.home>
## Created: 2022-01-14
clear;
home;

function retval = deltaFourier (A,f,t_0)
  w = (1/(2*pi))*f;
  retval = A*exp(-j*w.*t_0);
endfunction

t = [0:0.1:10];
a = deltaFourier(3.0,300.0,t);
%plot(t,a);

% part 1
tp = 4.0 %picked time for t_0 to get a complex value
b = deltaFourier(2.0,300.0,tp);
disp('The magnitude squared of the Fourier transform at time tp is')
m = sqrt(sum(b.*b));
disp(m^2)

% part 2
fr = [200.0:2.0:400.0]; %frequncey range
phiL = [0:0.1:10]; % to hole the phi values to graph
for i=[0:1:100]
  c = deltaFourier(2.0,fr,i);
  phi = atan(imag(c)/real(c)); %vector to hold all the phis
  phiL(i+1) = phi;
endfor
plot(fr,phiL,'color','red','linewidth',3);
disp('Grpahed in red is the frequencies vs  the phis');

% part 3
hold on;
gd = polyder(-phiL); %negative derative of phi
gd(101)=1; %the derative function made the vector one short so i fixed it here
plot(fr,gd,'color','blue','linewidth',3);
axis("auto");
xlabel('Frequency (Hz)');
legend('Red = Phi-s','Blue = Group Delays','location',"southwest")
