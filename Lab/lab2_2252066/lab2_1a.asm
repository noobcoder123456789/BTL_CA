.data
input1: .asciiz "Nhap vao so nguyen A: "
input2: .asciiz "Nhap vao so nguyen B: "
input3: .asciiz "Nhap vao so nguyen C: "
output: .asciiz "Gia Tri Cua Ham f(a, b, c) = (a - b) - c = "

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
	la $a0, output
	syscall
	sub $t0, $t0, $t1
	sub $t0, $t0, $t2
	add $a0, $zero, $t0
	li $v0, 1
	syscall
	
