		;Part 5
		;A program designed to copy a string in reverse order
		;Author: Michael Watts
		;October 29 2017
		AREA  Part3B,CODE,READONLY

		ENTRY
		LDR r4,=STRING ;stores address of string in r4
		LDR r1,=0 ;puts 0 in r1
		
loop	LDRB r2,[r4],#1 ;loads first character into r2 and increments r4 by 1
		CMP r2,#0x0D ;compares to carriage return 
		ADDNE r1,#1 ;if not equal adds 1 to r1
		BNE loop ;if not equal loops 
		

		
stop	B	stop			;loop forever 
STRING  DCB "Hello",0x0D
		END