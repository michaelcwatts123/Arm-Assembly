		;Part 5
		;A program designed to shift and switch bits
		;Author: Michael Watts
		;October 2 2017
		AREA  Part5,CODE,READONLY
		ENTRY
		LDR r0,=0x20F2 ;stores value of X
		LDR r1,=0x30F0 ;stores value of Y
		LDR r2,=0xC4F8 ;stores value of Z
		
		EOR r5,r1,r2 ;evaluates exclusive or first
		ORR  r6,r0,r1 ;evaluates or second
		
		LSR r0,r0,#9 ;shifts x left by 9 bits
		LSR r1,r1,#1 ;shifts y left by 1 bit
		LSR r2,r2,#5 ;shifts z left by 5 bits
		
		AND r0,r0,#0x3F ;turns off excesses bits
		AND r1,r1,#0x3F ;turns off excess bits
		AND r2,r2,#0x3F ;turns off excess bits
		
stop	B	stop			;loop forever 

		END