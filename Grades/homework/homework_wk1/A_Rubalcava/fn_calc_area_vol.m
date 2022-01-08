function [A,V] = fn_calc_area_vol(r)
  % r is the radius of sphere 
  % A is the surface area of sphere
  % V is the volume of sphere
  A = 4*pi*r^2;
  V = 4/3*pi*r^3;
endfunction