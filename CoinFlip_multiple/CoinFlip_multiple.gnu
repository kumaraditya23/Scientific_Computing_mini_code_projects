set terminal postscript eps size 6,8 enhanced color
set output "CoinFlip_multiple.eps"
set grid
set xlabel "Fairness(p)"
set ylabel "N of heads in 10 tosses"
set xrange [-0.1: 1.1]
set yrange [-1: 12]
set pointsize 2.5
myrand(x)=(x+rand(0)-0.5)
plot "CoinFlip_multiple.dat" u 1:(myrand($2)) ti "Number of Heads" w points pointtype 6
