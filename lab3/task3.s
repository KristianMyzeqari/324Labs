.global _start

input_mazes:// First Obstacle Course
            .word 2,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,1,1
            .word 0,1,0,1,1,1,0,0,0,1,1,1
            .word 0,0,0,1,1,1,0,0,0,1,1,1
            .word 1,1,1,1,1,1,0,0,1,0,0,0
            .word 1,1,1,1,1,1,0,1,0,0,0,0
            .word 1,1,1,1,1,1,0,0,0,0,0,3
            // Second Obstacle Course
            .word 2,1,0,1,1,1,0,0,0,0,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,1,0,1,1,1,0,0,0,1,0,1
            .word 0,0,0,1,1,1,0,0,0,1,0,1
            .word 1,1,1,1,1,1,0,0,1,0,0,0
            .word 1,1,1,1,1,1,0,1,0,0,0,0
            .word 1,1,1,1,1,1,1,0,0,0,0,3
            // Third Obstacle Course
            .word 2,0,0,0,0,1,0,0,0,1,0,1
            .word 0,1,1,1,0,1,1,1,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,1,1,0,1,1,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 1,1,0,1,1,1,1,1,1,1,1,1
            .word 0,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,0,1,1,1,1,1,0,1
            .word 0,0,0,0,0,0,0,1,0,0,0,3
            // Fourth Obstacle Course
            .word 2,1,0,0,0,0,0,0,0,0,0,1
            .word 0,1,0,1,1,1,0,1,1,1,0,1
            .word 0,1,0,0,0,1,0,1,0,1,0,1
            .word 0,1,0,1,0,1,1,1,0,1,0,1
            .word 0,0,0,1,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,1,1,1,1,0,1
            .word 0,1,0,1,0,0,0,1,0,0,0,1
            .word 0,1,0,1,1,1,0,1,0,1,1,1
            .word 0,1,0,1,0,0,0,0,0,0,0,3
            // Fifth Obstacle Course
            .word 2,0,0,0,0,1,0,1,0,1,0,1
            .word 1,1,0,1,1,1,0,1,0,1,0,1
            .word 0,0,0,0,0,0,0,0,0,0,0,1
            .word 0,1,1,1,0,1,1,1,1,1,0,1
            .word 0,0,0,1,0,1,0,1,0,0,0,1
            .word 1,1,0,1,1,1,0,1,1,1,0,1
            .word 0,0,0,1,0,1,0,0,0,0,0,1
            .word 0,1,0,1,0,1,0,1,0,1,1,1
            .word 0,1,0,0,0,1,0,1,0,0,0,3
            // Sixth Obstacle Course
            .word 2,0,0,0,0,0,0,1,0,0,0,1
            .word 1,1,0,1,0,1,0,1,0,1,0,1
            .word 0,0,0,1,0,1,0,0,0,1,0,1
            .word 1,1,1,1,0,1,1,1,1,1,1,1
            .word 0,0,0,1,0,0,0,1,0,0,0,1
            .word 0,1,1,1,0,1,1,1,0,1,0,1
            .word 0,1,0,0,0,0,0,0,0,1,0,1
            .word 0,1,0,1,1,1,1,1,1,1,0,1
            .word 0,0,0,0,0,0,0,0,0,1,0,3
            // Seventh Obstacle Course
            .word 2,0,0,0,0,0,0,0,1,0,1,0
            .word 1,1,1,0,1,1,1,1,1,0,1,0
            .word 1,0,0,0,0,0,1,0,0,0,0,0
            .word 1,1,1,1,1,0,1,1,1,0,1,1
            .word 1,0,0,0,1,0,0,0,0,0,0,0
            .word 1,0,1,0,1,0,1,0,1,0,1,0
            .word 1,0,1,0,0,0,1,0,1,0,1,0
            .word 1,1,1,1,1,1,1,1,1,0,1,0
            .word 1,0,0,0,0,0,0,0,0,0,1,3
            // Eighth Obstacle Course
            .word 2,0,0,0,0,0,0,0,0,0,0,0
            .word 1,0,1,1,1,1,1,0,1,1,1,0
            .word 1,0,0,0,1,0,0,0,1,0,0,0
            .word 1,1,1,1,1,0,1,1,1,1,1,1
            .word 1,0,0,0,1,0,1,0,0,0,0,0
            .word 1,0,1,1,1,0,1,1,1,0,1,0
            .word 1,0,0,0,0,0,0,0,1,0,1,0
            .word 1,1,1,0,1,0,1,1,1,1,1,0
            .word 1,0,0,0,1,0,0,0,0,0,0,3
            // Nineth Obstacle Course
            .word 2,0,0,0,0,0,1,0,1,0,1,0
            .word 1,0,1,1,1,1,1,0,1,0,1,0
            .word 1,0,0,0,1,0,0,0,0,0,0,0
            .word 1,0,1,0,1,1,1,0,1,1,1,1
            .word 1,0,1,0,1,0,1,0,0,0,1,0
            .word 1,0,1,1,1,0,1,0,1,1,1,0
            .word 1,0,0,0,1,0,0,0,0,0,1,0
            .word 1,0,1,1,1,0,1,1,1,0,1,0
            .word 1,0,0,0,0,0,1,0,0,0,0,3


n1:		.word 319
n2:		.word 239

n3:		.word 79
n4:		.word 59

block:	.word 219

gridColour: .word 51297

size:	.word 432

.equ	pixel_memory, 0xc8000000
.equ	char_memory, 0xc9000000
.equ    ps2_memory, 0xff200100

_start:
        bl      VGA_fill_ASM
		bl		draw_grid_ASM
		bl		draw_ampersand_ASM
		bl		draw_exit_ASM
		
		//mov		r6, #39
		//mov		r7, #13
		//bl 		draw_obstacles_ASM
		mov		r5, #8
		bl		fill_grid_ASM
end:
        b       end

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


VGA_fill_ASM:
        push {r0, r1, r2, r5, r6}
		ldr r2, gridColour
		ldr r5, n1 //x axis max

outerFor2:
		CMP r5, #0
		BLT done2
		ldr r6, n2 //y axis max
innerFor2:
		CMP r6, #0
		BLT doneInner2
		mov r0, r5
		mov r1, r6
		push {lr}
		bl VGA_draw_point_ASM
		pop {lr}
		sub r6, r6, #1
		b	innerFor2
doneInner2:
		sub r5, r5, #1
		b outerFor2
done2:
		pop {r0, r1, r2, r5, r6}
		bx lr
		
draw_grid_ASM:
		push {r0, r1, r3}
		mov r0, #0
		mov r3, #26
forx:	cmp r0, #312
		bgt next
		mov r1, #0
forxy:	cmp r1, #234
		bgt lineDone
		push {lr}
		bl	VGA_draw_point_ASM
		pop {lr}
		add	r1, r1, #1
		b	forxy
lineDone:
		add r0, r0, r3
		b	forx

next:	mov r1, #0
fory:	mov r3, #26
		cmp r1, #234
		bgt linesDone2
		mov r0, #0
foryx:	cmp r0, #312
		bgt lineDone2
		push {lr}
		bl	VGA_draw_point_ASM
		pop {lr}
		add	r0, r0, #1
		b	foryx
lineDone2:
		add r1, r1, r3
		b	fory
linesDone2:
		pop {r0, r1, r3}
		bx lr
		
draw_ampersand_ASM:
		push {r0, r1, r2}
		mov r0, #3
		mov r1, #3
		mov r2, #38
		push {lr}
		bl VGA_write_char_ASM
		pop {lr}
		pop {r0, r1, r2}
		bx lr

draw_exit_ASM:
		push {r0, r1, r2}
		mov r0, #73
		mov r1, #55
		mov r2, #69
		push {lr}
		bl VGA_write_char_ASM
		pop {lr}
		mov r0, #74
		mov r1, #55
		mov r2, #88
		push {lr}
		bl VGA_write_char_ASM
		pop {lr}
		mov r0, #75
		mov r1, #55
		mov r2, #73
		push {lr}
		bl VGA_write_char_ASM
		pop {lr}
		mov r0, #76
		mov r1, #55
		mov r2, #84
		push {lr}
		bl VGA_write_char_ASM
		pop {lr}
		pop {r0, r1, r2}
		bx lr

draw_obstacles_ASM:
		push {r0, r1, r2, r3, r4, r5, r6, r7}
		sub r6, #13		//original x border
		mov r4, r6
		sub r7, #13		//original y border
		mov r5, r7
		
		add r2, r6, #26 //max x coordinate
		add r3, r7, #26 //max y coordinate
		
xtravel: cmp r4, r2
		 bgt blockDone
		 mov r5, r7
ytravel: cmp r5, r3
		 bgt lineComp
		 mov r0, r4
		 mov r1, r5
		 push {r2, lr}
		 mov r2, #0
		 bl VGA_draw_point_ASM
		 pop {r2, lr}
		 add r5, #1
		 b ytravel
lineComp: add r4, #1
		  b xtravel
		
blockDone:
		pop {r0, r1, r2, r3, r4, r5, r6, r7}
		bx lr
		

fill_grid_ASM:
		push {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10}
		ldr r3, =input_mazes
		ldr r4, =pixel_memory
		sub r5, #1			//input is in r5
		ldr r0, size
		mul r0, r0, r5
		add r3, r3, r0
		ldr r10, =#299
		mov r7, #13
xgrid:	cmp r7, #247
		bge	mazeF
		mov r6, #13
ygrid:	cmp r6, r10
		bgt	rowF
		ldr r9, [r3], #4
		cmp r9, #3
		beq mazeF
		cmp r9, #1
		bne nexta
		push {lr}
		bl draw_obstacles_ASM 
		pop {lr}
nexta:	add r6, #26
		b ygrid
rowF:	add r7, #26
		b xgrid

mazeF:	pop {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10}
		bx lr
		
		
		