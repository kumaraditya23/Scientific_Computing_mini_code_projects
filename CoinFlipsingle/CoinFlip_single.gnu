set terminal postscript eps size 6,8 enhanced color 
set output "CoinFlip_single.eps"
set xlabel "Number of Tosses"
set ylabel "Probability"
set xrange [0: 1e8]
set yrange [0.499: 0.507] 
set pointsize 2.5
plot "CoinFlip_single.dat" u 1:($2/$1) ti "Simulated Probability" w points pointtype 5, "th_prob.dat" u 1:($2/$1) ti "Theoretical Probability" w points pointtype 5
  
