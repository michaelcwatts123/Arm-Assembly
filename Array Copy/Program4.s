		;Part 5
		;A program designed to copy an array ingoring duplicates
		;Author: Michael Watts
		;October 29 2017
		AREA  Program4,CODE,READONLY
STORAGE EQU 0x40000000
		ENTRY
		LDR r0,=sourceArray ;holds location of source array
		
		LDR r2,=STORAGE ;holds location to store values
		
		LDR r3,=tsize ;holds size of array to be copied
		LDR r4,=0 ;keeps track of current place in parsing of source array
		LDR r8,=0 ;keeps track of how many items are in the new array
		
		
OLOOP   LDR r5,[r0] ;loads first 4 bytes of number
		LDR r6,[r0,#4] ;loads second 4 bytes of number
		ADD r0,#8 ;increments pointer to next DCQ
		LDR r9,=0 ;sets counter for interating through new loop
ILOOP	LDR r7,=STORAGE ;loads location of new array
		
		LDR r10,[r7] ;loads first 4 bytes of number from location of r7
		LDR r11,[r7,#4] ;loads second 4 bytesof number from location of r7 + 4
		ADD r7,#8 ;points r7 to next DCQ
		CMP r5,r10 ;compares first 8 bytes of number to be added to number from array
		BNE NLOOP ;branches if not equal 
		CMP r6,r11	;compares next 4 bytes of number to be added to number from array
		BEQ ESCAPE ;if equal skips method to add to array
NLOOP	CMP r9,r8 ;checks inner loop counter vs total number of elements in new array
		ADDNE r9,#1 ;adds one if not equal
		
		BNE ILOOP ;loops if counter does not equal number of elements in new array
		STR r5,[r2],#4 ;stores at r4 and increments r4 first 4 bytes of DCQ
		STR r6,[r2],#4 ;stores at r4 and increments r4 second 4 bytes of DCQ
		ADD r8,#1 ;increments counter of elements 
ESCAPE	CMP r4,r3 ;checks to see if r4 equals r3
		ADDNE r4,#1 ;incrments r4 if they do not
		BNE OLOOP ;braches back to loop if they do not
		
		
stop	B	stop			;loop forever 
sourceArray
            DCQ   0x0200200AD00236DD
            DCQ   0x00003401AAC4D097
            DCQ   0x000001102ACFF200
            DCQ   0x00010AA0AD3C66DF
            DCQ   0x0000FC3D76400CCB
            DCQ   0x000090045ACDD097
            DCQ   0x00000FF000004551
            DCQ   0x0200200AD00236DD
            DCQ   0x003AC401AAC4D097
            DCQ   0x000090045ACDD097
            DCQ   0x09990AA0AD3C66DF
            DCQ   0x1000200AD00236DD
            DCQ   0x00003401AAC4D097
            DCQ   0x000001102ACFF200
            DCQ   0x00010AA0AD3C66DF
            DCQ   0x003AC401AAC4D097
            DCQ   0x1000FC3D76400CCB
            DCQ   0x000090045ACDD097
            DCQ   0x00000FF000004551
            DCQ   0x00000000003C66DF
endArr 
tsize   EQU   ((endArr-sourceArray) / 8)
		END