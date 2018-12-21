		;Program 3
		;A program designed to store the first 20 numbers in the Fibonacci sequence
		;Author: Michael Watts
		;October 2 2017
		AREA  Program3,CODE,READONLY
STORENUM EQU 0x40000000
STOREODD EQU 0x40000050	
		ENTRY
		LDR  r0,=0 ;holds first Fibonacci number
		LDR  r1,=1 ;holds second Fibonacci number
		LDR  r2,=0 ;begining flag for loop
		LDR  r3,=20 ;end flag for loop
		LDR  r7,=1 ;holds the counter for odd numbers
		LDR  r9,=1
		MOV  r5,#STORENUM ;location numbers are stored
		LDR  r8,=0x40000050 ;location of odd numbers stored
		STRB  r0,[r5],#1 ;stores first fibonacci number and increments storage location afterwards
		STRB  r1,[r5],#1 ;stores second fibonacci number and increments storage location afterwards
		
		  
		
loop	
		
		ADD  r4,r0,r1 ;caculates and stores in r4 the next fibonacci number 
		AND  r6,r4,r9 ;turns off all but last bit
		CMP  r6,#0 ;compares last bit to 1 to check if odd
		ADDGT r7,#1 ;if last bit equals 1, increment counter
		MOV  r0,r1 ;moves value from r1 into r0
		MOV  r1,r4 ;moves value from r4 into r1
		STRB  r1,[r5],#1 ;stores fibonacci number and increments storage location afterwards
		CMP  r3,r2 ;compares contents of r2 and r3 
		ADDGT  r2,#1 ;if r2 is less than r3, increases r2 by 1
		BGT loop ;if r2 is less than r3 go to flag loop
		STRB r7,[r8] ;stores odd number counter at memory location
stop	B	stop			;loop forever 

		END