clear;
home;

tmax = 10; #seconds
dt = .09; #seconds
f = 10; #Hz
A = 2; #Volts

v = [0:dt:tmax];


#unction r = rlc(tmax,dt,f,A,v)
  
#r = A*cos(2*pi.*f.*dt);
#endfunction

plot(v, A*cos(2*pi.*f.*v),'linewidth',3.0,'color','black')
set(gca(),'fontname','Courier','fontsize',18)
xlabel('Time (Seconds)')
ylabel('Amplitude')


