.data
input1: .asciiz "Nhap Phan Tu Thu "
input2: .asciiz ": "
endl: .asciiz "\n"
merge_i: .asciiz "Merge "
array: .word 0:201 
space_character: .asciiz " "
new_stack: .word 0:201

.text
main:	
	lui $s0, 1234
	ori $s0, $s0, 5678
	lui $s1, 4321
	ori $s1, $s1, 8765
	
	lui $s2, 9876
	ori $s2, $s2, 5432
	lui $s3, 2109
	ori $s3, $s3, 8765
	
	