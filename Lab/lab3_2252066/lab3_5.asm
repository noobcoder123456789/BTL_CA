.data
input: .asciiz "Computer Architecture CSE-HCMUT"

.text
main:	
	addi $t0, $zero, 0
	la $t1, input
	addi $s0, $zero, 'r'
	addi $s1, $zero, '\0'
	add $t4, $0, $zero
	
	While:
		lbu $t2, ($t1)
		bne $t2, $s0, Check2
		addi $t4, $0, 1
		j EndWhile
		Check2:
			beq $t2, $s1, EndWhile
			addi $t0, $t0, 1
			addi $t1, $t1, 1
			j While
		j EndWhile
	EndWhile:
	
	beq $t4, $zero, notFound
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	j End
	
notFound:
	li $v0, 1
	addi $a0, $zero, -1
	syscall
	
End: