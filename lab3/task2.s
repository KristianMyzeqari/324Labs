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

@ TODO: copy VGA driver here.
VGA_clear_pixelbuff_ASM:
		push {r0, r1, r2, r5, r6}
		mov r2, #0
		ldr r5, n1 //x axis max

outerFor:
		CMP r5, #0
		blt done
		ldr r6, n2 //y axis max
innerFor:
		CMP r6, #0
		blt doneInner
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

@ TODO: insert PS/2 driver here.
read_PS2_data_ASM:
		push {r4, r5, r6}
		ldr r4, =ps2_memory
		lsr r5, r4, #15
		tst r5, #1
		bgt isOne
		b	end2
isOne:	ldrb r6, [r4]
		mov r0, #1
		strb r4, [r0]
		pop {r4, r5, r6}
		bx lr
		
end2:	mov r0, #0
		pop {r4, r5, r6}
		bx lr


write_hex_digit:
        push    {r4, lr}
        cmp     r2, #9
        addhi   r2, r2, #55
        addls   r2, r2, #48
        and     r2, r2, #255
        bl      VGA_write_char_ASM
        pop     {r4, pc}
write_byte:
        push    {r4, r5, r6, lr}
        mov     r5, r0
        mov     r6, r1
        mov     r4, r2
        lsr     r2, r2, #4
        bl      write_hex_digit
        and     r2, r4, #15
        mov     r1, r6
        add     r0, r5, #1
        bl      write_hex_digit
        pop     {r4, r5, r6, pc}
input_loop:
        push    {r4, r5, lr}
        sub     sp, sp, #12
        bl      VGA_clear_pixelbuff_ASM
        bl      VGA_clear_charbuff_ASM
        mov     r4, #0
        mov     r5, r4
        b       .input_loop_L9
.input_loop_L13:
        ldrb    r2, [sp, #7]
        mov     r1, r4
        mov     r0, r5
        bl      write_byte
        add     r5, r5, #3
        cmp     r5, #79
        addgt   r4, r4, #1
        movgt   r5, #0
.input_loop_L8:
        cmp     r4, #59
        bgt     .input_loop_L12
.input_loop_L9:
        add     r0, sp, #7
        bl      read_PS2_data_ASM
        cmp     r0, #0
        beq     .input_loop_L8
        b       .input_loop_L13
.input_loop_L12:
        add     sp, sp, #12
        pop     {r4, r5, pc}
