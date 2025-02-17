.data 
const: .float 3.14, 0
endl: .asciiz "\n"
input: .asciiz "Nhap Ban Kinh Duong Tron R = "
dien_tich: .asciiz "Dien Tich = "
chu_vi: .asciiz "Chu Vi = "
hellu: .asciiz "Input Khong Hop Le"

.text
	la   $a0, input
	addi $v0, $0, 4
	syscall
	
	addi $v0, $zero, 6
	syscall
	
	la   $a0, const
	lwc1 $f1, 0($a0)
	lwc1 $f2, 4($a0)
	
	c.lt.s $f0, $f2
	bc1t   except
	
	add.s $f4, $f0, $f0
	mul.s $f4, $f4, $f1
	
	mul.s $f5, $f0, $f1
	mul.s $f5, $f5, $f1
	
	la    $a0, chu_vi
	addi  $v0, $0, 4
	syscall
	
	add.s $f12, $f2, $f4
	addi  $v0, $0, 2
	syscall
	
	la    $a0, endl
	addi  $v0, $0, 4
	syscall
	
	la    $a0, dien_tich
	addi  $v0, $0, 4
	syscall
	
	addi  $v0, $0, 2
	add.s $f12, $f2, $f5
	syscall
	j     end
	
except:    
	la    $a0, hellu
	addi  $v0, $0, 4
	syscall
end: