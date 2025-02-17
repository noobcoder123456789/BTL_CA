.data
input:  .asciiz  "Input: "
output1: .asciiz "a = b + c = "
output2: .asciiz "a = b - c = "
output3: .asciiz "a = b * c = "
output4: .asciiz "a = b / c = "
output5: .asciiz "a = 0"

.text
main:	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
	li $s1, 100
	li $s2, 2
	
	addi $t0, $s0, -1
	addi $t1, $s0, -2
	addi $t2, $s0, -3
	addi $t3, $s0, -4
	
	beq $t0, $zero, Case1
	beq $t1, $zero, Case2
	beq $t2, $zero, Case3
	beq $t3, $zero, Case4
	
	li $v0, 4
	la $a0, output5
	syscall
	j EndSwitch
	
	Case1:
		li $v0, 4
		la $a0, output1
		syscall
		
		li $v0, 1
		add $a0, $s2, $s1
		syscall
		j EndSwitch
		
	Case2:
		li $v0, 4
		la $a0, output2
		syscall
		
		li $v0, 1
		sub $a0, $s1, $s2
		syscall		
		j EndSwitch

	Case3:
		li $v0, 4
		la $a0, output3
		syscall
		
		li $v0, 1
		mul $a0, $s1, $s2
		syscall
		j EndSwitch		
		
	Case4:
		li $v0, 4
		la $a0, output4
		syscall
		
		li $v0, 1
		div $a0, $s1, $s2
		syscall
		j EndSwitch		
		
	EndSwitch: