.data
output: .asciiz "invalid input"

.text
main:	
	addi $v0, $zero, 5
	syscall
	add  $s0, $v0, $zero
	
	slt $t0, $s0, $0
	beq $t0, 1, CASE1
	
	beq $v0, $0, CASE2
	beq $v0, 1, CASE3
	
	addi $t0, $0, 0
	addi $t1, $0, 1
	addi $t2, $0, 2
	addi $t3, $s0, 0
	addi $s0, $0, 1
	j FOR
FOR:
	slt $t4, $t2, $t3
	beq $t4, $zero, CASE4
	add $t0, $t1, $0
	add $t1, $s0, $0
	add $s0, $t1, $t0
	addi $t2, $t2, 1
	j FOR
	
CASE1:
	addi $v0, $zero, 4
	la $a0, output
	syscall
	j END

CASE2:
	addi $v0, $0, 1
	add  $a0, $s0, $0
	syscall
	j END

CASE3:
	addi $v0, $0, 1
	add  $a0, $s0, $0
	syscall
	j END	
	
CASE4:
	addi $v0, $0, 1
	add $a0, $s0, $0
	syscall
	j END
END: