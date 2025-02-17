.data
iArray: .word 41

.text
	lui  $1, 4097
	ori  $4, $1, 0
	addi $a1, $0, 10
	
	addi $t0, $t0, 0
	add  $s0, $a0, $0
	For_input:
		slt  $at, $t0, $a1
		beq  $at, $0, End_For_input
		
		addi $t0, $t0, 1
		addi $v0, $0, 5
		syscall
		
		sw   $v0, 0($s0)
		addi $s0, $s0, 4
		j    For_input
	End_For_input:
	
	jal range
	addi $a0, $v0, 0
	addi $v0, $0, 1
	syscall
	j End
	
	min:
		add  $s0, $a0, $0
		addi $t0, $0, 1
		lw   $v0, 0($s0)
		addi $s0, $s0, 4
		for_min:
			slt  $at, $t0, $a1
			beq  $at, $0, end_for_min
			lw   $t1, 0($s0)
			addi $s0, $s0, 4
			addi $t0, $t0, 1
			slt  $at, $t1, $v0
			beq  $at, $0, for_min
			add  $v0, $t1, $0
			j    for_min
		end_for_min:
		jr $ra
	end_min:
	
	max:
		add  $s0, $a0, $0
		addi $t0, $0, 1
		lw   $v0, 0($s0)
		addi $s0, $s0, 4
		for_max:
			slt  $at, $t0, $a1
			beq  $at, $0, end_for_max
			lw   $t1, 0($s0)
			addi $s0, $s0, 4
			addi $t0, $t0, 1
			slt  $at, $v0, $t1
			beq  $at, $0, for_max
			add  $v0, $t1, $0
			j    for_max
		end_for_max:
		jr $ra
	end_max:
	
	range:
		addi $sp, $sp, -4
		sw   $ra, 0($sp)
		jal  max
		add  $s4, $v0, $0
		jal  min
		add  $s5, $v0, $0
		sub  $v0, $s4, $s5
		lw   $ra, 0($sp)
		addi $sp, $sp, 4
		jr   $ra
	End_range:
End: