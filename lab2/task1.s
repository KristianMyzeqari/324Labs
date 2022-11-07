.global _start

.equ SW_MEMORY, 0xFF200040
.equ LED_MEMORY, 0xFF200000

.equ ADDR_FIRST4, 0xFF200020
.equ ADDR_LAST2, 0xFF200030

.equ PUSHBUTTONS, 0xff200050

arr:   .word 0x3f, 0x6, 0x5b, 0x4f, 0x66, 0x6D, 0x7D, 0x7, 0x7F, 0x6f, 0x77, 0x7C, 0x39, 0x5e, 0x79, 0x71 // test array


_start:
	MOV A1, #0x030
	BL HEX_flood_ASM
loop:	
	BL read_slider_switches_ASM
	TST R0, #512
	MOVNE A1, #0x000000f
	BLNE HEX_clear_ASM
	BNE loop
	BL write_LEDs_ASM

	BL read_slider_switches_ASM
	MOV R1, R0
	AND R1, R1, #0x0000000f
	
	BL read_PB_edgecp_ASM		
	TST A1, #0xF				
	BLNE PB_clear_edgecp_ASM		// only clear when edge capture bits are up, otherwise, continue
	BLNE HEX_write_ASM
	
	b loop
	
endd: b endd

read_slider_switches_ASM:
    LDR R1, =SW_MEMORY
    LDR R0, [R1]
    BX  LR
	
write_LEDs_ASM:
    LDR R1, =LED_MEMORY
    STR R0, [R1]
    BX  LR

HEX_write_ASM:
	push 	{V1-V3}
	LDR a3, =arr
	ldr v2, =ADDR_FIRST4
	ldr v3, =ADDR_LAST2
	LDR v1, [A3, A2, LSL #2]
	
	//write6:
	//CMP A1, #32
	//BLT	write5
	//SUB A1, A1, #32
	//strb v1, [v3, #1]
	
	//write5:
	//CMP A1, #16
	//BLT	write4
	//SUB A1, A1, #16
	//strb v1, [v3]
	
	write4:
	CMP A1, #8
	BLT	write3
	SUB A1, A1, #8
	strb v1, [v2, #3]
	
	write3:
	CMP A1, #4
	BLT	write2
	SUB A1, A1, #4
	strb v1, [v2, #2]
	
	write2:
	CMP A1, #2
	BLT	write1
	SUB A1, A1, #2
	strb v1, [v2, #1]
	
	write1:
	CMP A1, #1
	BLT	endWRITE
	strb v1, [v2]
	
endWRITE:POP {V1-V3}
	bx lr

HEX_flood_ASM:
	push 	{V1-V3}
	ldr v2, =ADDR_FIRST4
	ldr v3, =ADDR_LAST2
	MOV v1, #0xff
	
	clear6:
	CMP A1, #32
	BLT	clear5
	SUB A1, A1, #32
	strb v1, [v3, #1]
	
	clear5:
	CMP A1, #16
	BLT	clear4
	SUB A1, A1, #16
	strb v1, [v3]
	
	clear4:
	CMP A1, #8
	BLT	clear3
	SUB A1, A1, #8
	strb v1, [v2, #3]
	
	clear3:
	CMP A1, #4
	BLT	clear2
	SUB A1, A1, #4
	strb v1, [v2, #2]
	
	clear2:
	CMP A1, #2
	BLT	clear1
	SUB A1, A1, #2
	strb v1, [v2, #1]
	
	clear1:
	CMP A1, #1
	BLT	endFLOOD
	strb v1, [v2]
	
endFLOOD:POP {V1-V3}
	bx lr

HEX_clear_ASM:
	push 	{V1-V3}
	ldr v2, =ADDR_FIRST4
	ldr v3, =ADDR_LAST2
	MOV v1, #0x00
	
	display6:
	CMP A1, #32
	BLT	display5
	SUB A1, A1, #32
	strb v1, [v3, #1]
	
	display5:
	CMP A1, #16
	BLT	display4
	SUB A1, A1, #16
	strb v1, [v3]
	
	display4:
	CMP A1, #8
	BLT	display3
	SUB A1, A1, #8
	strb v1, [v2, #3]
	
	display3:
	CMP A1, #4
	BLT	display2
	SUB A1, A1, #4
	strb v1, [v2, #2]
	
	display2:
	CMP A1, #2
	BLT	display1
	SUB A1, A1, #2
	strb v1, [v2, #1]
	
	display1:
	CMP A1, #1
	BLT	endCLEAR
	strb v1, [v2]
	
endCLEAR:POP {V1-V3}
	bx lr

read_PB_data_ASM:
	LDR R3, =PUSHBUTTONS
	LDR A1, [R3]
	BX LR
	
PB_data_is_pressed_ASM: // pass 1,2,4, or 8 in a register as a paraneter: R2, move either 0 or 1 into output register R4
MOV R4, #0
PUSH {LR}
BL read_PB_data_ASM
POP {LR}
TST A1, R2
BEQ returnF
MOV R4, #1
returnF:
BX LR



// MOV R2, #1
//BL PB_data_is_pressed_ASM



read_PB_edgecp_ASM:
	LDR R3, =PUSHBUTTONS
	ADD R3, R3, #12 // pushbutton edbge register is 12 bits away
	LDR R0, [R3]
	BX LR
	
PB_edgecp_is_pressed_ASM:
	MOV R4, #0
	PUSH {LR}
	BL read_PB_edgecp_ASM
	POP {LR}
	TST R0, R2
	BEQ returnE
	MOV R4, #1
	returnE:
	BX LR
	
PB_clear_edgecp_ASM:
	PUSH {v1}
	LDR R3, =PUSHBUTTONS
	ADD R3, R3, #12
	LDR R0, [R3]
	STR R0, [R3]
	POP {v1}
	BX LR