

%This functions purpose is to take a users input
%of freq to count in a 20 second timeframe.
%Then it will plot with the X value on x axis
%and sin of the X value on y axis. 

%Example that is plotted = ListPlot(0.1)

%Matthew Townsend

function create = ListPlot(freq)
  start = 0.0;
  stop = 20.0;
  create = [];
  create = [start:freq:stop];
  plot(create,sin(create),"b");
  set(gca, "fontsize", 12);
  title ("Plot of function");
  xlabel("X value");
  ylabel("sin(X)");
  grid("on");
endfunction
  