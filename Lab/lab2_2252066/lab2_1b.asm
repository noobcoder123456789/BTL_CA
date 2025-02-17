.data
input1: .asciiz "Kien Truc May Tinh 2022"

.text
main:	
	li $v0, 4
	la $a0, input1
	syscall