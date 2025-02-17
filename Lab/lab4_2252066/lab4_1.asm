.data
cArray: .asciiz "Computer Architecture 2022"

.text
	lui $1, 4097
	ori  $4, $1, 0
	addi $a1, $0, 26
	jal reverse
	
	addi $v0, $0, 4
	syscall
	j End
	
	reverse:
		add $t0, $0, $0
		srl $t1, $a1, 1
		For_reverse:
			slt  $at, $t0, $t1
			beq  $at, $0, End_reverse
			add  $at, $a0, $t0
			lb   $t2, 0($at)
			addi $at, $a1, -1
			sub  $at, $at, $t0
			add  $at, $at, $a0
			lb   $t3, 0($at)
			sb   $t2, 0($at)
			add  $at, $a0, $t0
			sb   $t3, 0($at)	
			addi $t0, $t0, 1		
			j    For_reverse
		End_reverse:
		jr $ra
	end_reverse:
End: