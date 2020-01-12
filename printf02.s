  .data

  .balign 4
message1:  .asciz "Type a number: "

  .balign 4
message2: .asciz "%d time 5 is %d\n"

  .balign 4
scan_pattern:  .asciz "%d"

  .balign 4
number_read: .word 0

  .balign 4
return: .word 0

  .balign 4
return2: .word 0

  .text

mult_by_5:
  ldr r1, addr_of_return2
  str lr, [r1]

  add r0, r0, r0, LSL #2

  ldr lr, addr_of_return2
  ldr lr, [lr]
  bx lr

addr_of_return2: .word return2

  .global main
main:
  ldr r1, addr_of_return
  str lr, [r1]

  ldr r0, addr_of_msg1
  bl printf

  ldr r0, addr_of_scan_pattern
  ldr r1, addr_of_number_read
  bl scanf

  ldr r0, addr_of_number_read
  ldr r0, [r0]
  bl mult_by_5

  mov r2, r0
  ldr r1, addr_of_number_read
  ldr r1, [r1]
  ldr r0, addr_of_msg2
  bl printf

  ldr lr, addr_of_return
  ldr lr, [lr]
  bx lr

addr_of_msg1: .word message1
addr_of_msg2: .word message2
addr_of_scan_pattern : .word scan_pattern
addr_of_number_read: .word number_read
addr_of_return: .word return

  .global printf
  .global scanf
