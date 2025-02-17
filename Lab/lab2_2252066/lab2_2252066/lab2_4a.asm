.data
array: .space 41

.text
main:	
	la $s0, array
	li $t0, 0
	la $s1, array
	for:
		beq $t0, 10, end
		li $v0, 5
		syscall
		sw $v0, 0($s1)
		addi $s1, $s1, 4
		addi $t0, $t0, 1
		j for
	end:
	
	lw $t0, 16($s0)
	lw $t1, 24($s0)
	sub $s0, $t0, $t1
	li $v0, 1
	add $a0, $s0, $zero
	syscall