#!/bin/bash 
###################################################
#### This script automates the gnuplot ############
#### construction of plotting the  simulated ######
#### and theoretical probabilities for the  #######
#### the single coin tossing experiment. ##########
#### It also outputs the time taken to complete ###
#### the plotting and file generation process. ####
#### It was supposed to automate the compilation###
#### execution of CoinFlip_single.pro as well as ##
#### generation of CoinFlip_single.dat. ###########
#### However, IDL cannot be compiled and ##########
#### executed directly from the command line ######
#### which has forced exclusion of these from #####
#### the script.                              #####
#### General steps for an IDL program:        #####
#### Type IDL on the command line and enter   #####
#### .compile program_name.pro                #####
#### program_name                             #####
#### Script Author: Aditya Kumar (Michigan Tech)###
###################################################
#
#==================================================
#Record the starting time in seconds
#==================================================
start=$(date +"%s")

#==================================================
#Start with gnuplot
#==================================================
gnuplot <<- EOF
set terminal postscript eps size 6,8 enhanced color
set output "CoinFlip_single.eps"
set xlabel "Number of Tosses"
set ylabel "Probability"
set xrange [0: 1e8]
set yrange [0.499: 0.507] 
set pointsize 2.5
plot "CoinFlip_single.dat" u 1:(\$2/\$1) ti "Simulated Probability" w points pointtype 5, "th_prob.dat" u 1:(\$2/\$1) ti "Theoretical Probability" w points pointtype 5
EOF
#
#==================================================
#End plotting
#==================================================
#
#==================================================
#Record end time and compute time taken and print 
#==================================================
end=$(date +"%s")
time_to_run=$(($end-$start))
echo $time_to_run

#==================================================
#Convert time taken to human readable format and
#print.
#==================================================
t=$(date -u -d @${time_to_run} +"%T")
echo $t
exit 0
