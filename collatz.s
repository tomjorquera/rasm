.text

.global main
main:
  mov r1, #123
  mov r2, #-1

loop:
  add r2, r2, #1
  cmp r1, #1
  beq end

  and r3, r1, #1
  cmp r3, #0
  beq even

odd:
  add r1, r1, r1, LSL #1 /* r1 <- r1 * 3 */
  add r1, r1, #1
  b loop

even:
  mov r1, r1, ASR #1
  b loop

end:
  mov r0, r2
  bx lr
