  .global _start
  _start:
    mov r10, #0x100
    ldr r11, [r10]
    add r11, r11, #4
    str r11, [r10]