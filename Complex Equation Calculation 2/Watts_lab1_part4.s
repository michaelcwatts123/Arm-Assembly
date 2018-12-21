		;Part 4
		;A program designed to evaluate a mathmatical expression
		;Author: Michael Watts
		;October 2 2017
		AREA  Part4,CODE,READONLY
		ENTRY
		LDR r1,=22 ;X
		LDR r2,=17 ;y
		LDR r3,=95 ;Z
		LDR r4,=8
		LDR r5,=7
		
		
		MUL r6,r2,r4 ;8Y
		MUL r7,r3,r5 ;7Z
		ADD r0,r1,r6 ;x+8y
		ADD r0,r0,r7 ;result of previous operation + 7z
		SUB r0,r0,#27 ;result of previous operation - 27
		LSR r0,r0,#3 ;LSR to simulate division by 3
		
stop	B	stop			;loop forever 

		END