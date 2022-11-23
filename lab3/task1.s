.global _start

n1:		.word 319
n2:		.word 239

n3:		.word 79
n4:		.word 59

.equ	pixel_memory, 0xc8000000
.equ	char_memory, 0xc9000000


_start:
        bl      draw_test_screen
end:
        b       end
@ TODO: Insert VGA driver functions here.
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
		push {r0, r1, r2, r3, r4}
		ldr r4, =pixel_memory
		mov r0, r0, lsl #1
		mov r1, r1, lsl #10
		add r3, r1, r0
		strh r2, [r4, r3]
		pop {r0, r1, r2, r3, r4}
		bx lr

VGA_write_char_ASM:
		push {r0, r1, r2, r3, r4}
		ldr r4, =char_memory
		mov r1, r1, lsl #7
		add r3, r1, r0
		strb r2, [r4, r3]
		pop {r0, r1, r2, r3, r4}
		bx lr


draw_test_screen:
        push    {r4, r5, r6, r7, r8, r9, r10, lr}
        bl      VGA_clear_pixelbuff_ASM
        bl      VGA_clear_charbuff_ASM
        mov     r6, #0
        ldr     r10, .draw_test_screen_L8
        ldr     r9, .draw_test_screen_L8+4
        ldr     r8, .draw_test_screen_L8+8
        b       .draw_test_screen_L2
.draw_test_screen_L7:
        add     r6, r6, #1
        cmp     r6, #320
        beq     .draw_test_screen_L4
.draw_test_screen_L2:
        smull   r3, r7, r10, r6
        asr     r3, r6, #31
        rsb     r7, r3, r7, asr #2
        lsl     r7, r7, #5
        lsl     r5, r6, #5
        mov     r4, #0
.draw_test_screen_L3:
        smull   r3, r2, r9, r5
        add     r3, r2, r5
        asr     r2, r5, #31
        rsb     r2, r2, r3, asr #9
        orr     r2, r7, r2, lsl #11
        lsl     r3, r4, #5
        smull   r0, r1, r8, r3
        add     r1, r1, r3
        asr     r3, r3, #31
        rsb     r3, r3, r1, asr #7
        orr     r2, r2, r3
        mov     r1, r4
        mov     r0, r6
        bl      VGA_draw_point_ASM
        add     r4, r4, #1
        add     r5, r5, #32
        cmp     r4, #240
        bne     .draw_test_screen_L3
        b       .draw_test_screen_L7
.draw_test_screen_L4:
        mov     r2, #72
        mov     r1, #5
        mov     r0, #20
        bl      VGA_write_char_ASM
        mov     r2, #101
        mov     r1, #5
        mov     r0, #21
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #22
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #23
        bl      VGA_write_char_ASM
        mov     r2, #111
        mov     r1, #5
        mov     r0, #24
        bl      VGA_write_char_ASM
        mov     r2, #32
        mov     r1, #5
        mov     r0, #25
        bl      VGA_write_char_ASM
        mov     r2, #87
        mov     r1, #5
        mov     r0, #26
        bl      VGA_write_char_ASM
        mov     r2, #111
        mov     r1, #5
        mov     r0, #27
        bl      VGA_write_char_ASM
        mov     r2, #114
        mov     r1, #5
        mov     r0, #28
        bl      VGA_write_char_ASM
        mov     r2, #108
        mov     r1, #5
        mov     r0, #29
        bl      VGA_write_char_ASM
        mov     r2, #100
        mov     r1, #5
        mov     r0, #30
        bl      VGA_write_char_ASM
        mov     r2, #33
        mov     r1, #5
        mov     r0, #31
        bl      VGA_write_char_ASM
        pop     {r4, r5, r6, r7, r8, r9, r10, pc}
.draw_test_screen_L8:
        .word   1717986919
        .word   -368140053
        .word   -2004318071