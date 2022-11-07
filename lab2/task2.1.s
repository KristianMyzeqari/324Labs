.global _start
.equ TIMER, 0xFFC08000



_start:
ARM_TIM_config_ASM:
	
	PUSH	{V1-V3}
	LDR		V1, =TIMER
	STR 	A1, [V1]
	ADD		V3, V1, #8
	STR 	A2, [V3]
	POP		{V1-V3}
	BX LR
	
ARM_TIM_read_INT_ASM:
	PUSH 	{V1}
	LDR		V1, =TIMER
	ADD		V1, V1, #12
	LDR		A1, [V1]
	POP		{V1}
	BX LR

ARM_TIM_clear_INT_ASM:
	PUSH 	{V1}
	LDR		V1, =TIMER
	ADD		V1, V1, #12
	LDR		A1, [V1]
	STR		A1, [V1]
	POP		{V1}
	BX LR