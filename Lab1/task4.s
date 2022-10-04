.global _start
arr:   .word 68, -22, -31, 75, -10, -61, 39, 92, 94, -55 // test array
N:	   .word 10
i:	   .word 1
_start:


	LDR		A1, =arr			// A1 contains the address of the array
	LDR		A2, N				// A2 contains the number of elements in the array
	LDR		A3, i				// A3 will register the value of i which is passed as an argument
	//PUSH 	{A1, A3, LR}		// Push the arguments that will be changed in the function 
	B		sortlist			// Enter "sortlist" subroutine
	//POP		{A1, A3, LR}
end:	B 		end

sortlist:

	CMP		A3, A2
	BGE		exit
	//PUSH	{V1-V4}
	MOV		V1, A3					// Set j=i
	LDR		V3, [A1, A3, LSL #2]	// Get element i from the array and load it into register V3 (value)

	
forloop:
		SUB		V2, V1, #1				// Set V2 as j-1
		CMP		V1, #0
		BLE		exitfor 
		LDR		V4, [A1, V2, LSL #2]	// Get element j-1 from the array and load it into register V4 (arr[j-1])
		CMP		V4, V3
		BLE		exitfor
		STR		V4, [A1, V1, LSL #2]
		SUB		V1, V1, #1
		B		forloop
		
exitfor:
	STR		V3, [A1, V1, LSL #2]
	ADD		A3, A3, #1
	//POP 	{V1-V4}
	//PUSH 	{LR}
	B		sortlist
	//POP		{LR}
	
exit:
	B end