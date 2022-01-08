
## Author: Jackson Diamond <jackson@Jacksons-MBP.home>
## Created: 2022-01-07

clear;
home;

times = 1.0;
function retval = CosPlot (input1)
  times = input1
  t = [0.0:0.01:times];
  retval = plot(t,cos(2.0 * pi .* t));
endfunction
disp(CosPlot(times))