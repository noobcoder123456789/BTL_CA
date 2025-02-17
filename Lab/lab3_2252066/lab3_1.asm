.data
string1: .asciiz "Computer Science and Engineering, HCMUT"
string2: .asciiz "Computer Architecture 2022"

.text
main:	
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
	andi $t0, $s0, 1
	beq $t0, $zero, StatementTrue
	
	li $v0, 4
	la $a0, string2
	syscall
	j EndIf
	StatementTrue:
		li $v0, 4
		la $a0, string1
		syscall
	EndIf: