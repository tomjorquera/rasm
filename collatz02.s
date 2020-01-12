  .data

message: .asciz "Type a number: "
scan_format: .asciz "%d"
message2: .asciz "Length of the Hailstone seq for %d is %d\n"

  .text

collatz:
  mov r1, r0
  mov r0, #0

collatz_loop:
  cmp r1, #1
  beq collatz_end
  and r2, r1, #1
  cmp r2, #0
  bne collatz_odd

collatz_even:
  mov r1, r1, ASR #1
  b collatz_end_loop

collatz_odd:
  add r1, r1, r1, LSL #1
  add r1, r1, #1

collatz_end_loop:
  add r0, r0 , #1
  b collatz_loop

collatz_end:
  bx lr

  .global main
main:
  push {lr}
  sub sp, sp, #4

  ldr r0, addr_of_msg
  bl printf

  ldr r0, addr_of_scan_format
  mov r1, sp
  bl scanf

  ldr r0, [sp]

  bl collatz

  mov r2, r0

  ldr r1, [sp]

  ldr r0, addr_of_msg2
  bl printf

  add sp, sp, #4
  pop {lr}
  bx lr

addr_of_msg: .word message
addr_of_scan_format: .word scan_format
addr_of_msg2: .word message2
