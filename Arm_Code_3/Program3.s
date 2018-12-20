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
		LDR  r6,=1 ;flag to detect if number is odd using Fibonacci pattern odd odd even
		LDR  r7,=3 ;comparision flag 
		MOV  r5,#STORENUM ;location numbers are stored
		LDR  r8,=0x40000050 ;location of odd numbers stored
		
		
		  
		
loop	
		CMP  r7,r6 ;checks if number is odd
		STRGT  r1,[r8],#1 ;if so stores it in current value of r8 then increments it by one
		ADDGT r6,r6,#1 ;increments odd checker counter
		LDREQ r6,=1 ;resets odd checker value 
		ADD  r4,r0,r1 ;caculates and stores in r4 the next fibonacci number 
		MOV  r0,r1 ;moves value from r1 into r0
		MOV  r1,r4 ;moves value from r4 into r1
		STR  r1,[r5],#1 ;stores fibonacci number and increments storage location afterwards
		CMP  r3,r2 ;compares contents of r2 and r3 
		ADDGT  r2,#1 ;if r2 is less than r3, increases r2 by 1
		BGT loop ;if r2 is less than r3 go to flag loop
		
stop	B	stop			;loop forever 

		END