		;Program 2
		;A program designed to loop through a hexadecimal number, adding each digit together and saving the result
		;Author: Michael Watts
		;October 2 2017
		AREA  Program2,CODE,READONLY
		ENTRY
		LDR  r0,=0 ;holds final total
		LDR  r1,=0x120A760C ;loads in value to be summed
		LDR  r2,=0 ;begining flag for loop
		LDR  r3,=8 ;end flag for loop
		LDR  r4,=0 ;holds digit to be added
		LDR  r5,=28 ;holds the amount of bits to be logical shifted right
		LDR  r6,=0x0FFFFFFF ;holds the value to AND with r1
		  
loop	CMP  r3,r2 ;compares contents of r2 and r3
		LSR  r4,r1,r5 ;gets single hex digit from r1 and stores it in r4
		SUB  r5,#4 ;moves the digit to be selected from r1 down by one byte
		ADD  r0,r0,r4 ;adds the indivual digit to the final total
		
		AND  r1,r6,r1 ;forces selected bits to 0
		LSR  r6,r6,#4 ;shifts r6 down one byte 
		
		ADDGT  r2,#1 ;if r2 is less than r3, increases r2 by 1
		BGT loop ;if r2 is less than r3 go to flag loop
		
stop	B	stop			;loop forever 

		END