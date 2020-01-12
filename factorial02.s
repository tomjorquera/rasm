  .data

message1: .asciz "Type a number: "
format: .asciz "%d"
message2: .asciz "The factorial of %d is %d\n"

  .text

factorial:
  push {r4, lr}
  mov r4, r0

  cmp r0, #0
  bne is_nonzero
  mov r0, #1
  b end

is_nonzero:
  sub r0, r0, #1
  bl factorial

  mov r1, r4
  mul r0, r0, r1

end:
  pop {r4, lr}
  bx lr

  .global main
main:
  str lr, [sp,#+4]!
  sub sp, sp, #4

  ldr r0, addr_of_msg1
  bl printf

  ldr r0, addr_of_format
  mov r1, sp
  bl scanf

  ldr r0, [sp]
  bl factorial

  mov r2, r0
  ldr r1, [sp]
  ldr r0, addr_of_msg2
  bl printf

  add sp, sp, #+4
  ldr lr, [sp], #+4
  bx lr

addr_of_msg1: .word message1
addr_of_msg2: .word message2
addr_of_format: .word format
