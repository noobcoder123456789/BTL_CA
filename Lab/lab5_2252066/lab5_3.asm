.data 
array: .float 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0
const: .float 0.0
max_string: .asciiz "Max of Array = "
min_string: .asciiz "Min of Array = "
endl: .asciiz "\n"

.text	
	la   $a0, const
	lwc1 $f14, 0($a0)
	la   $a0, array
	lwc1 $f0, 0($a0)
	lwc1 $f1, 0($a0)
	addi $t0, $0, 1
	addi $t1, $0, 20
	addi $a0, $a0, 4
	
	for:
		slt    $at, $t0, $t1
		beq    $at, $0, end_for
		addi   $t0, $t0, 1
		lwc1   $f2, 0($a0)
		addi   $a0, $a0, 4
		c.lt.s $f2, $f0
		bc1t   end_swap_max
		swap_max:
			add.s $f0, $f14, $f2
		end_swap_max:
		c.lt.s $f1, $f2
		bc1t   for
		swap_min:
			add.s $f1, $f14, $f2
		end_swap_min:
		j      for
	end_for:
	
	addi  $v0, $0, 4
	la    $a0, max_string
	syscall
	
	addi  $v0, $0, 2
	add.s $f12, $f14, $f0
	syscall
	
	addi  $v0, $0, 4
	la    $a0, endl
	syscall
	
	addi  $v0, $0, 4
	la    $a0, min_string
	syscall
	
	addi  $v0, $0, 2
	add.s $f12, $f14, $f1
	syscall
	
	