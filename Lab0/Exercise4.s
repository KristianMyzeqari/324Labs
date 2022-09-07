  .global _start
  _start:
    mov r0, #0x0
    ldr r1, [r0, #0x100]
    add r1, r1, #4
    str r1, [r0, #0x100]