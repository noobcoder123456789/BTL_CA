.data
input1:  .asciiz  "Input a: "
input2:  .asciiz  "Input b: "
input3:  .asciiz  "Input c: "
output1: .asciiz "a = b * c = "
output2: .asciiz "a = b + c = "

.text
main:	
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, $zero

	li $v0, 4
	la $a0, input2
	syscall	
	
	li $v0, 5
	syscall
	add $s1, $v0, $zero
	
	li $v0, 4
	la $a0, input3 
	syscall
	
	li $v0, 5
	syscall
	add $s2, $v0, $zero
	
	slti $t0, $s0, -3
	addi  $t1, $s0, -7
	sub $t1, $zero, $t1
	slti $t1, $t1, 1 
	or $t0, $t0, $t1
	beq $t0, $zero, Else
	mul $s0, $s1, $s2
	
	li $v0, 4
	la $a0, output1
	syscall
	j EndIf
	Else:
		li $v0, 4
		la $a0, output2
		syscall
		add $s0, $s1, $s2
	EndIf:
	
	li $v0, 1
	add $a0, $s0, $zero
	syscall