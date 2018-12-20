    AREA ShellSort, CODE, READONLY
destinationArray EQU 0x40000000
ENTRY
		LDR    r0,=sourceArray
		LDR    r1,=destinationArray
		MOV  r2,#arraySize
		BL       copyArray
		MOV  r2,#arraySize ;reset array size
		LDR    r1,=destinationArray ;reset pointer to begining of array
	
		LDR  r12,[r1]
		BL       shellSort
stop    B         stop
 
copyArray 
		LDR r3,[r0],#4 ;loads value from destination array and increments pointer
		STR r3,[r1],#4 ;stores values and increments pointer
		SUBS r2,#1 ;decrements counter
		CMP r2,#0
		BNE copyArray ;loops till end of array
        MOV PC,LR    ;Return to calling subroutine      
 
shellSort
		MOV r3,#0 ;r3 is the swap flag set to 0 for true
		MOV r4,r2 ;r4 is distance
		
while	CMP r3,#0 ;or statement check if swap flag is true
		MOVNE r5,#1 ;if false put in 1
		MOVEQ r5,#0
		CMP r4,#1 ;check if distance if greater than 1
		MOVLE r5,#1 ;if false put in 1
		MOVGT r5,#0
		CMP r5,#1 ;if 1 is in r5, failed both conditions
		BEQ endLoop ;break loop
		
		MOV r3,#1 ;swap flag = false
		ADD r4,r4,#1
		LSR r4,#1 ;distance + 1 /2
		MOV r6,#0 ;i
		SUB r7,r2,r4 ;aSize - distance
for		
		ADD r0,r6,r4
		MOV r10,#4
		MUL r0,r10,r0
		LDR r8,[r1, r0] ;num(i+distance)
		MUL r11,r6,r10
		LDR r9,[r1,r11] ;num(i)
		CMP r8,r9 ; num(i+distance) < num(i)
		BGE EIF
		STR r9,[r1,r0] ;num[i + distance] = num[i];
		STR r8,[r1,r6] ;num[i] = temp;
		MOV r3,#0 ;set swap flag true
		
EIF		
		CMP r6,r7 
		ADDLT r6,#1
		BLT	for
		
		
		
		
		
endLoop MOV PC,LR  ;Return to calling subroutine
 
arraySize       EQU 20
sourceArray  DCD 19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0
                        END      