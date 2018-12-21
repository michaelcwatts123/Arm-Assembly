RCC_APB2ENR EQU 0x40021018
GPIOE_BSRR  EQU 0x40011810
GPIOE_CRH 	EQU 0x40011804
DELAY_VALUE EQU 0x10000
SRAM 		EQU 0x20000000

			AREA Lab4, CODE, READONLY
			ENTRY
			LDR r0, =RCC_APB2ENR
			LDR r1, =GPIOE_CRH
			LDR r2, =GPIOE_BSRR
			LDR r3, =0x40
			STR r3, [r0]
			LDR r3, =0x33333333
			STR r3, [r1] 
			LDR r8, =TableStart
			MOV r9,#0	
			LDR r10, =0x00000000
			STR r10, [r2]
			
			LDR r4, =0x100
			LDR r5, =SRAM
			MOV r8, #8
			LDR r12,=4
			CMP r9,#0
			MOVEQ r11,#0
			BEQ	mainLoop
			CMP r9,#8
			MOVGT r11,#0
			BGT	mainLoop
			MUL r9,r9,r12
			LDR r11,[r8, r9]
mainLoop
			LDR r9, =SRAM
			
			LDR r5, =DELAY_VALUE
			MOV r4, r11
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
			LDR r4, [r9], #4
			LDR r4, =0x01000000
			MOV r8, #8
turnOff 	STR r4, [r2]
			MOV r6, r5
delayOff
			SUB r6, r6, #1
			CMP r6, #0
			BNE delayOff
			LDR	r11,=0
			STR r11, [r2]
			SUB r8, r8, #1
			CMP r8, #0
			BNE turnOff
		
			B	mainLoop
stop		B 	stop
TableStart
			DCD 0x100
			DCD 0x300
			DCD 0x700
			DCD 0xF00
			DCD 0x1F00
			DCD 0x3F00
			DCD 0x7F00
			DCD 0xFF00

			END