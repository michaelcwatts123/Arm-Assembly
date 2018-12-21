		;Part 5
		;A program designed to copy a string in reverse order
		;Author: Michael Watts
		;October 29 2017
		AREA  Part3B,CODE,READONLY
STORE   EQU 0x40000000	;location to store string in reverse order
		ENTRY
		MOV r0,#STORE ;stores location of store in r0
		LDR r1,=STRING ;stores location of string in r1
		LDRB r3,[r1] ;loads first character into r3
loop	LDRB r2,[r1],#1 ;loads character located at r1 in r2 and increments r1 by 1
		CMP r2,#0 ;checks for end of string
		BNE loop ;if not loop again
		
loop2	LDRB r2,[r1] ;loads character at r1 into r2
		STRB r2,[r0],#1 ;stores the character in r2 at r0 and increments r0 by 1
		SUB  r1,#1 ;subtracts 1 from r1
		CMP r3,r2 ;compares current character to first character
		BNE loop2 ;loops if not equal
		
stop	B	stop			;loop forever 
STRING  DCB "Hello",0 ;string 
		END