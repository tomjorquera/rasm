  .data

  .balign 4
message1:  .asciz "Plz type a number: "

  .balign 4
message2: .asciz "You typed %d\n"

  .balign 4
scanpattern: .asciz "%d"

  .balign 4
number_read:  .word 0

  .balign 4
return:  .word 0

  .text

  .global main
main:
  ldr r1, addr_of_return
  str lr, [r1]

  ldr r0, addr_of_msg1
  bl printf

  ldr r0, addr_of_scanpattern
  ldr r1, addr_of_number_read
  bl scanf

  ldr r0, addr_of_msg2
  ldr r1, addr_of_number_read
  ldr r1, [r1]
  bl printf

  ldr r0, addr_of_number_read
  ldr r0, [r0]

  ldr lr, addr_of_return
  ldr lr, [lr]
  bx lr

addr_of_msg1: .word message1
addr_of_msg2: .word message2
addr_of_scanpattern: .word scanpattern
addr_of_number_read: .word number_read
addr_of_return: .word return

  .global printf
  .global scanf
