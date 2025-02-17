.data
input: .space 11
endl: .asciiz "\n"

.text
main:	
	lui $s0, 0x0003
	ori $s0, $s0, 0x0D40
	addi $s0, $s0, 4000
	subi $s0, $s0, 700
	
	li $v0, 1
	add $a0, $s0, $0
	syscall