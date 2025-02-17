.data
input: .space 11
endl: .asciiz "\n"

.text
main:	
	la $a0, input
	li $a1, 11
	li $v0, 8
	syscall
	
	li $v0, 4
	la $a0, endl
	syscall
	li $v0, 4
	la $a0, input
	syscall
