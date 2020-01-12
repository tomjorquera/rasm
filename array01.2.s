.data

.balign 4
a: .skip 400

.balign 4
b: .skip 8

.text

.global main
main:
  ldr r1, addr_of_a
  mov r2, #0
loop:
  cmp r2, #100
  beq end
  str r2, [r1, +r2, LSL #2]
  add r2, r2, #1
b loop
end:
  mov r0, #0
  bx lr

addr_of_a: .word a
