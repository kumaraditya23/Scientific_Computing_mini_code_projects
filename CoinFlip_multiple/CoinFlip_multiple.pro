pro CoinFlip_multiple


;******************************************************
;***    This IDL code computes number of heads  *******
;***    in 10 coin tosses replicated 100 times  *******
;***    with different fairness factor values   *******
;***    Author: Aditya Kumar (Michigan Tech)    *******
;******************************************************




SEED=12345678
;Define the number of tosses for each experiment
toss=10


;=======================================================
;open the file to write the results
;=======================================================

OPENW,lun, 'CoinFlip_multiple.dat',/get_lun

;initialize the fairness factor
fair_fac=0.0

;Begin simulation
FOR i = 0, 20 DO BEGIN

		
	FOR experiment = 0, 99 DO BEGIN

;Now exclude simulating the extreme cases
;as the random number generator was not
;working for i=20. Manually simulate the 
;extreme cases.	
			IF (i eq 0) THEN BEGIN
				n_heads = 0
			ENDIF ELSE $
			IF (i eq 20) THEN BEGIN
				n_heads=10
			ENDIF ELSE BEGIN
	
			n_heads = RANDOMU(seed, BINOMIAL=[toss,fair_fac], /DOUBLE)
			ENDELSE
			;Write the fairness factor and number of heads to the file
			PRINTF,lun, fair_fac, n_heads
			
		
	ENDFOR
	fair_fac = fair_fac + 0.05

ENDFOR

;=======================================================
;Close the file
;=======================================================
CLOSE, lun


end
