.global _start              // define entry point

// initialize memory
n1:       .word 11          // value of dividend
n2:		  .word 5			// value of divisor
result:	  .space 4			// allocated space for the result

_start:                 	// execution begins here!
    	LDR R0, n1       	// put the address of dividend in A1
    	LDR R1, n2       	// put the address of divisor in A2
		LDR R2, =result
		mov r3, #0
		BL	LOOP
		endd: b endd	

LOOP:   	CMP R0, R1         	// subtract divisor from dividend
			BLE END
			SUB R0, R0, R1
			ADD R3, R3, #1
			B	LOOP
		
		
END:		LSL R3, R3, #16
			ADD R3, R0
			STR R3, [R2]
				BX LR
