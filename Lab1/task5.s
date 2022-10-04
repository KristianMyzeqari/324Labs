.global _start
input_image: .word 1057442138,  2410420899, 519339369,  2908788659, 1532551093, 4249151175, 4148718620, 788746931,  3777110853, 2023451652
			 .word 3000595192,   1424215634, 3130581119, 3415585405, 2359913843, 1600975764, 1368061213, 2330908780, 3460755284, 464067332
			 .word 2358850436,   1191202723, 2461113486, 3373356749, 3070515869, 4219460496, 1464115644, 3200205016, 1316921258, 143509283
			 .word 3846979011,   2393794600, 618297079,  2016233561, 3509496510, 1966263545, 568123240,  4091698540, 2472059715, 2420085477
			 .word 395970857,    2217766702, 44993357,   694287440,  2233438483, 1231031852, 2612978931, 1464238350, 3373257252, 2418760426
			 .word 4005861356,   288491815, 3533591053,  754133199,  3745088714, 2711399263, 2291899825, 2117953337, 1710526325, 1989628126
			 .word 465096977,    3100163617, 195551247,  3884399959, 422483884,  2154571543, 3380017320, 380355875,  4161422042, 654077379
			 .word 2168260534,   3266157063, 3870711524, 2809320128, 3980588369, 2342816349, 1283915395, 122534782,  4270863000, 2232709752
			 .word 1946888581,   1956399250, 3892336886, 1456853217, 3602595147, 1756931089, 858680934,  2326906362, 2258756188, 1125912976
			 .word 1883735002,   1851212965, 3925218056, 2270198189, 3481512846, 1685364533, 1411965810, 3850049461, 3023321890, 2815055881


spacer0:				.word 0
array_space_alpha:	.space 25
spacer1:				.word 0
array_space_blue:	.space 25
spacer2:				.word 0
array_space_green:	.space 25
spacer3:				.word 0
array_space_red:	.space 25
spacer4:				.word 0

j:	.word 0

length: .word 25

output: .word 36
_start:
	LDR A1, =output
	LDR A2, =input_image
	LDR A3, length
	MOV A4, #1
	PUSH	{LR}
	BL		organizeArrays
	BL		sortArrayAlpha
	BL		sortArrayBlue
	BL		sortArrayGreen
	BL 		sortArrayRed
	BL		getmedian
	POP		{LR}
end: b end

organizeArrays:
		PUSH {V1-V8}
		MOV V1, #0	//counter for elements inserted in arrays
		LDR V2, j	//assign value of j
		MOV V3, #0  //element being stored
		LDR V5, =array_space_alpha
		LDR V6, =array_space_blue
		LDR V7, =array_space_green
		LDR V8, =array_space_red
			
forloopJ:
			CMP V2, #5
			BGE rowDone
			
			LDR V4, [A2, V3]		// V4 contains the first pixel
			
			STRB V4, [V5, V1]		//store alpha channel
			ROR V4, V4, #8
			
			STRB V4, [V6, V1]		//store blue channel
			ROR V4, V4, #8
			
			STRB V4, [V7, V1]		//store green channel
			ROR V4, V4, #8
			
			STRB V4, [V8, V1]		//store red channel
		
			ROR V4, V4, #8			//Return to original state
			ADD V2, V2, #1			//Increment j
			ADD V3, V3, #4			//Increment element being stored by 4 to get next byte in memory
			ADD V1, V1, #1
			b forloopJ
rowDone:
			CMP V1, #25
			BGE organizedone
			ADD V3, V3, #24				//Increment element being stored by 24 to get second row of array
			MOV V2, #0					//Reset j counter
			b forloopJ
			
organizedone:
		POP {V1-V8}
		BX LR
		
sortArrayAlpha:

	CMP		A4, A3
	BGE		arrayASorted
	PUSH	{V1-V5}
	LDR		V5, =array_space_alpha
	MOV		V1, A4				// Set j=i
	LDRB	V3, [V5, A4]	// Get element i from the array and load it into register V3 (value)

	
forloopA:
		SUB		V2, V1, #1			// Set V2 as j-1
		CMP		V1, #0
		BLE		exitforA 
		LDRB	V4, [V5, V2]	// Get element j-1 from the array and load it into register V4 (arr[j-1])
		CMP		V4, V3
		BLE		exitforA
		STRB	V4, [V5, V1]
		SUB		V1, V1, #1
		B		forloopA
		
exitforA:
	STRB	V3, [V5, V1]
	ADD		A4, A4, #1
	POP 	{V1-V5}
	PUSH 	{LR}
	BL		sortArrayAlpha
	POP		{LR}
	
arrayASorted:
	MOV A4, #0
	BX LR
	

sortArrayBlue:

	CMP		A4, A3
	BGE		arrayBSorted
	PUSH	{V1-V5}
	LDR		V5, =array_space_blue
	MOV		V1, A4				// Set j=i
	LDRB	V3, [V5, A4]	// Get element i from the array and load it into register V3 (value)

	
forloopB:
		SUB		V2, V1, #1			// Set V2 as j-1
		CMP		V1, #0
		BLE		exitforB 
		LDRB	V4, [V5, V2]	// Get element j-1 from the array and load it into register V4 (arr[j-1])
		CMP		V4, V3
		BLE		exitforB
		STRB	V4, [V5, V1]
		SUB		V1, V1, #1
		B		forloopB
		
exitforB:
	STRB	V3, [V5, V1]
	ADD		A4, A4, #1
	POP 	{V1-V5}
	PUSH 	{LR}
	BL		sortArrayBlue
	POP		{LR}
	
arrayBSorted:
	MOV A4, #0
	BX LR
	
sortArrayGreen:

	CMP		A4, A3
	BGE		arrayGSorted
	PUSH	{V1-V5}
	LDR		V5, =array_space_green
	MOV		V1, A4				// Set j=i
	LDRB	V3, [V5, A4]	// Get element i from the array and load it into register V3 (value)

	
forloopG:
		SUB		V2, V1, #1			// Set V2 as j-1
		CMP		V1, #0
		BLE		exitforG 
		LDRB	V4, [V5, V2]	// Get element j-1 from the array and load it into register V4 (arr[j-1])
		CMP		V4, V3
		BLE		exitforG
		STRB	V4, [V5, V1]
		SUB		V1, V1, #1
		B		forloopG
		
exitforG:
	STRB	V3, [V5, V1]
	ADD		A4, A4, #1
	POP 	{V1-V5}
	PUSH 	{LR}
	BL		sortArrayGreen
	POP		{LR}
	
arrayGSorted:
	MOV A4, #0
	BX LR
	
sortArrayRed:

	CMP		A4, A3
	BGE		arrayRSorted
	PUSH	{V1-V5}
	LDR		V5, =array_space_red
	MOV		V1, A4				// Set j=i
	LDRB	V3, [V5, A4]	// Get element i from the array and load it into register V3 (value)

	
forloopR:
		SUB		V2, V1, #1			// Set V2 as j-1
		CMP		V1, #0
		BLE		exitforR 
		LDRB	V4, [V5, V2]	// Get element j-1 from the array and load it into register V4 (arr[j-1])
		CMP		V4, V3
		BLE		exitforR
		STRB	V4, [V5, V1]
		SUB		V1, V1, #1
		B		forloopR
		
exitforR:
	STRB	V3, [V5, V1]
	ADD		A4, A4, #1
	POP 	{V1-V5}
	PUSH 	{LR}
	BL		sortArrayRed
	POP		{LR}
	
arrayRSorted:
	MOV A4, #0
	BX LR
	
getmedian:
	PUSH 	{V1-V5}
	LDR		V1, =array_space_red
	LDR		V2, =array_space_green
	LDR		V3, =array_space_blue
	LDR		V4, =array_space_alpha
	
	LDRB	V5, [V1, #12]
	ROR		V5, V5, #8
	LDRB	V6, [V2, #13]
	ROR		V6, V6, #16
	LDRB	V7, [V3, #13]
	ROR		V7, V7, #24
	LDRB	V8, [V4, #13]
	ADD		V5, V5, V6
	ADD		V5, V5, V7
	ADD		V5, V5, V8