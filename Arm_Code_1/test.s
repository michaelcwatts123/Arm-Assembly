		AREA  Program1,CODE,READONLY
		ENTRY
	
		
		LDR  r10,C
		LDR  r11,D
		SUB  r12,r11,r10 ;D-C which is the same as -C+D stored in r12
			
		LDR  r3,E
		LDR  r2,F
		SUB  r1,r2,r3 ;F-E
		MUL  r4,r1,r1 ;the value of F-E times itself stored in r4
		
		MUL  r5,r12,r4 ;multiple the value of r12 by the value of r4
		LSR  r0,r4,#4 ;LSR 4 same as dividing by 16
stop	B	stop			;loop forever
C		DCD	234
D		DCD	401
E		DCD 9
F		DCD 100
		END