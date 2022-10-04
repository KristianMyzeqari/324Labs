.global _start
arr:   .word 68, -22, -31, 75, -10, -61, 39, 92, 94, -55 // test array
N:	   .word 10	
_start:


	LDR		A1, =arr			// A1 contains the elements in the array
	LDR		A2, N				// A2 contains the number of elements in the array
	PUSH	{A1, A2, LR}
	BL		sortlist			// Enter "sortlist" subroutine
	POP		{A1, A2, LR}
end:	B 		end
sortlist:	
		PUSH	{V1-V7}
		LDR		V1, [SP, #24]	// V1 contains array address
		MOV		V2, #1			// V2 contains i		

		
FORLOOP:
			CMP		V2, A2
			BGE		EXIT			// 
			LDR		V3, [V1, V2, LSL #2]	// Value (array element to be sorted)
			MOV		V4, V2			// V4 is j
		
WHILELOOP:
				CMP		V4, #0
				BLE		EXITWHILE
				SUB		V7, V4, #1
				LDR		V5, [V1, V7, LSL #2]			// Get value at [j-1] and load in register V5
				CMP		V5, V3
				BLE		EXITWHILE
				STR		V5, [V1, V4, LSL #2]
				SUB 	V4, V4, #1
				B		WHILELOOP
EXITWHILE:		
			STR		V3, [V1, V4, LSL #2]
			ADD		V2, V2, #1
			B		FORLOOP
			
EXIT:	POP	{V1-V7}
		BX 	LR
		