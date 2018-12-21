RCC_APB2ENR EQU 0x40021018
GPIOE_BSRR  EQU 0x40011810
GPIOE_CRH 	EQU 0x40011804
DELAY_VALUE EQU 0x10000


			AREA Lab4, CODE, READONLY
			ENTRY
			LDR r0, =RCC_APB2ENR
			LDR r1, =GPIOE_CRH
			LDR r2, =GPIOE_BSRR
			LDR r3, =0x40
			STR r3, [r0]
			LDR r3, =0x33333333
			STR r3, [r1] 
				
			LDR r10, =0x00000000
			STR r10, [r2]
			
			LDR r4, =0x100
			

			MOV r7,#0
			
mainLoop
			
			
			LDR r5, =DELAY_VALUE
			CMP r7,#0
			MOVEQ r7,#1
			MOVNE r7,#0
			LDREQ r4,=0x00005500
			LDRNE r4,=0x0000AA00
			MOV r8, #8
turnOn		STR r4, [r2]
			MOV r6, r5
delayOn		SUB r6, r6, #1
			CMP r6, #0
			BNE delayOn
			
			SUB r8, r8, #1
			CMP r8, #0
			BNE turnOn
			MOV r6, r5
mainDelay
			SUB r6, r6, #1
			CMP r6, #0
			BNE mainDelay
			
			LDR r4, =0xFF000000
			MOV r8, #8
turnOff 	STR r4, [r2]
			MOV r6, r5
delayOff
			SUB r6, r6, #1
			CMP r6, #0
			BNE delayOff
			
			SUB r8, r8, #1
			CMP r8, #0
			BNE turnOff
		
			B	mainLoop
stop		B 	stop
			END