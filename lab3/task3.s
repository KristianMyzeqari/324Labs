.global _start

n1:		.word 319
n2:		.word 239

n3:		.word 79
n4:		.word 59

.equ	pixel_memory, 0xc8000000
.equ	char_memory, 0xc9000000
.equ    ps2_memory, 0xff200100

_start:
        bl      input_loop
end:
        b       end

VGA_clear_pixelbuff_ASM:
		push {r0, r1, r2, r5, r6}
		mov r2, #0
		ldr r5, n1 //x axis max

outerFor:
		CMP r5, #0
		BLE done
		ldr r6, n2 //y axis max
innerFor:
		CMP r6, #0
		BLE doneInner
		mov r0, r5
		mov r1, r6
		push {lr}
		bl VGA_draw_point_ASM
		pop {lr}
		sub r6, r6, #1
		b	innerFor
doneInner:
		sub r5, r5, #1
		b outerFor
		
done:
		pop {r0, r1, r2, r5, r6}
		bx lr
		
VGA_clear_charbuff_ASM:
		push {r0, r1, r2, r5, r6}
		mov r2, #0
		ldr r5, n3 //x axis max

outerFor1:
		CMP r5, #0
		BLE done1
		ldr r6, n4 //y axis max
innerFor1:
		CMP r6, #0
		BLE doneInner1
		mov r0, r5
		mov r1, r6
		push {lr}
		bl VGA_write_char_ASM
		pop {lr}
		sub r6, r6, #1
		b	innerFor1
doneInner1:
		sub r5, r5, #1
		b outerFor1
		
done1:
		pop {r0, r1, r2, r5, r6}
		bx lr
		

VGA_draw_point_ASM:
		push {r0, r1, r2, r3, r4, r5, r6}
		ldr r4, =pixel_memory
		ldr r5, n1
		ldr r6, n2
		
		cmp r0, #0
		blt finish
		cmp r0, r5
		bgt finish
		mov r0, r0, lsl #1
		
		cmp r1, #0
		blt finish
		cmp r1, r6
		bgt finish
		mov r1, r1, lsl #10
		
		add r3, r1, r0
		strh r2, [r4, r3]
finish:	pop {r0, r1, r2, r3, r4, r5, r6}
		bx lr

VGA_write_char_ASM:
		push {r0, r1, r2, r3, r4, r5, r6}
		ldr r4, =char_memory
		ldr r5, n3
		ldr r6, n4
		
		cmp r0, #0
		blt fini1
		cmp r0, r5
		bgt fini1
		
		cmp r1, #0
		blt fini1
		cmp r1, r6
		bgt fini1
		mov r1, r1, lsl #7
		
		add r3, r1, r0
		strb r2, [r4, r3]
fini1:	pop {r0, r1, r2, r3, r4, r5, r6}
		bx lr