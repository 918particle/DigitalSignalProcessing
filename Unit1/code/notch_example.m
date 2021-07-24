clear;
close;
home;

a_c = 1.0;
a_s = 1.0e-2;

f_c = 1.0e6; %Units: Hz
f_s = 0.1e6; %Units: Hz
f_samp = 10.0e6; %Units: Hz
t_min = 0.0; %Units: seconds
t_max = 20.0/f_s; %Units: seconds
dt = 1/f_samp; %Units: seconds

t = [t_min:dt:t_max];

x_c = a_c*sin(2.0*pi*f_c.*t); %Carrier signal
x_s = a_s*sin(2.0*pi*f_s.*t); %Data signal
x_T = x_c.*x_s; %Mix them together

x_T = x_T + randn(size(x_T))*1.0e-2;

f_min = 0.0;
f_max = f_samp/2.0;
df = 1/t_max;

R = 50.0; %Units: Ohms
C = 470.0e-12; %Units: Farads
L = 54.0e-6; %Units: Henries

omega_LC = 1.0/(sqrt(L*C));
tau = R*C;
omega = [0.0:df:f_max]*2.0*pi;
k = sqrt(1-(omega/omega_LC).^2);
d = k.^4+(omega*tau).^2;
x = k.^4;
y = k.^2.*omega*tau;
h = x./d - i*y./d;

h = ones(size(h)) - h; %Given an h value at an f, change to 1 - h.

h = [h fliplr(conj(h(2:end)))];
h_t = real(ifft(h));  ... Numerical artifacts that are imaginary.

x_T_conv = conv(x_T,h_t); %Convolution... applying the transfer function to the data.
x_T_conv = x_T_conv(1:length(t));

figure(1);
subplot(4,1,1)
plot(t*1e3,x_c,'color','red');
subplot(4,1,2)
plot(t*1e3,x_s,'color','blue');
subplot(4,1,3)
plot(t*1e3,x_T,'color','black');
subplot(4,1,4)
plot(t*1e3,x_T_conv)