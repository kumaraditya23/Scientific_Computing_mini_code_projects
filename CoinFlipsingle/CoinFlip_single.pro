pro CoinFlip_single

;******************************************************
;***	This IDL code computes number of heads 	*******
;***	in 10^m coin tosses.			*******
;***	Author: Aditya Kumar (Michigan Tech)	*******
;******************************************************



SEED=12345678

number_tosses = [1,10,100,1000,10000,100000,1000000,10000000,100000000]

result = make_array(9,1,/double,value=0)

;=======================================================
;open the file to write the results
;=======================================================
OPENW,lun, 'CoinFlip_single.dat',/get_lun
PRINTF,lun, 'Number of Tosses','	Number of Heads'


;=======================================================
;Start the simulation
;=======================================================
FOR i=0, 8 DO BEGIN
	heads_prob = 0.5
	result = RANDOMN(seed, BINOMIAL=[number_tosses[i],heads_prob],/DOUBLE)
	print, result

;Write the number of tosses and number of heads to the file
	PRINTF,lun, number_tosses[i], result
ENDFOR


;=======================================================
;Close the file
;=======================================================
CLOSE, lun

end
