.data
input1: .asciiz "Nhap vao so nguyen a: "
input2: .asciiz "Nhap vao so nguyen b: "
input3: .asciiz "Nhap vao so nguyen c: "
input4: .asciiz "Nhap vao so nguyen d: "
input5: .asciiz "Nhap vao so nguyen x: "
output: .asciiz "f = a.x^3 + b.x^2 - c.x - d = "

.text
main:	
	li $v0, 4
	la $a0, input1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero

	li $v0, 4
	la $a0, input2
	syscall	
	li $v0, 5
	syscall
	add $t1, $v0, $zero

	li $v0, 4
	la $a0, input3
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	li $v0, 4
	la $a0, input4
	syscall	
	li $v0, 5
	syscall
	add $t3, $v0, $zero
	
	li $v0, 4
	la $a0, input5
	syscall	
	li $v0, 5
	syscall
	add $t4, $v0, $zero
	
	li $v0, 4
	la $a0, output
	syscall
	mul $s0, $t0, $t4
	add $s0, $s0, $t1
	mul $s0, $s0, $t4
	sub $s0, $s0, $t2
	mul $s0, $s0, $t4
	sub $s0, $s0, $t3
	
	li $v0, 1
	add $a0, $s0, $zero
	syscall
	