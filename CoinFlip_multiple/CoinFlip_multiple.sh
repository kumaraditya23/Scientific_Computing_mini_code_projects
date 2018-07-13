#!/bin/bash
###################################################
#### This script automates the gnuplot ############
#### construction of plotting the  simulated ######
#### and theoretical probabilities for the  #######
#### the multiple coin tossing experiment. ##########
#### It also outputs the time taken to complete ###
#### the plotting and file generation process. ####
#### It was supposed to automate the compilation###
#### execution of CoinFlip_multiple.pro as well as ##
#### generation of CoinFlip_multiple.dat. ###########
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
set output "CoinFlip_multiple.eps"
set grid
set xlabel "Fairness(p)"
set ylabel "N of heads in 10 tosses"
set xrange [-0.1: 1.1]
set yrange [-1: 12]
set pointsize 2.5
myrand(x)=(x+rand(0)-0.5)
plot "CoinFlip_multiple.dat" u 1:(myrand(\$2)) ti "Number of Heads" w points pointtype 6
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
#==================================================
t=$(date -u -d @${time_to_run} +"%T")
echo $t
exit 0

