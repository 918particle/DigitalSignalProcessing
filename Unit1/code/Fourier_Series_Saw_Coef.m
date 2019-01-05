clear;
home;
close;
pkg load signal;

%n is a constant
function retval = An(n)
	retval = -1.0./n/pi;
endfunction

S = [0.5 An([1:20])];

plot([0:20],-log10(abs(S)),'o','color','black','markersize',12);
grid on;
axis([-1 21 -1 2]);
xlabel("n","fontname","Courier","fontsize",20);
ylabel("-log10(|An|)","fontname","Courier","fontsize",20);
set(gca(),"fontname","Courier","fontsize",20);