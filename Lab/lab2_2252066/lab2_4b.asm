.data
information: .asciiz "2252066 - Lo Hoang Bao\n"

.text
main:	
	li $v0, 4
	la $a0, information
	syscall
	
	la $s0, information
	lbu $t0, 0($s0)
	lbu $t1, 21($s0)
	sb $t1, 0($s0)
	sb $t0, 21($s0)
	
	li $v0, 4
	la $a0, information
	syscall