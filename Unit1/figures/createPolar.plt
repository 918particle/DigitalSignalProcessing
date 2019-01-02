set terminal postscript color enhanced
set output 'polar.eps'
unset border
set style fill solid 0.50 border
set dummy t, y
set grid polar
set raxis
set polar
set size ratio 1 1,1
set bmargin 5
set tmargin 5
unset xtics
unset ytics
set rtics font "Courier,22"
set ttics 0,30 font "Courier,22"
set pointsize 4
unset key
set xrange [ -2 : 2 ]
set yrange [ -2 : 2 ]
set rrange [ 0.01 : 2 ]
set trange [0:pi/2.0]
plot 1.5 w l lc -1 lw 8, "<echo '1.56 1.5'" w p pt 6 lc -1