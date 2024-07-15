.data
input1: .asciiz "Nhap Phan Tu Thu "
input2: .asciiz ": "
endl: .asciiz "\n"
merge_i: .asciiz "Merge "
array: .word 10,9,8,7,6,5,4,3,2,1
space_character: .asciiz " "
new_stack: .space 200

.text
main:	
	# $a3 sẽ chứa địa chỉ nền của array
	lui  $at, 0x1001
	ori  $a3, $at, 0x0020
	la   $a3, array
	# $a2 sẽ chứa địa chỉ nền của new_stack 
	lui  $at, 0x1001
	ori  $a2, $at, 0x0120
	# LỆNH GIẢ la   $a3, array # Thanh Ghi $s3 chứa địa chỉ nền của mảng
	# Nhập Mảng Gồm 50 Số Thực
	addi $t0, $0, 0 # Khởi Tạo Giá trị 0 Cho Thanh Ghi $t0
	addi $t5, $0, 50 # Khởi Tạo Giá trị 10 Là Kích Thước Của Mảng Cho Thanh Ghi $t5 
	addi $a1, $a3, 0 # Gán Thanh Ghi $a1 bằng địa chỉ nền của mảng
	
# 	For_input: # Vòng For sử dụng cho việc input các phần tử của mảng 
# 		slt  $t1, $t0, $t5 # So Sánh Nếu Thanh Ghi $t0 nhỏ hơn $t5
# 		beq  $t1, $zero, End_For_input # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp 
# 		
# 		# Print Chuỗi "Nhap Phan Tu Thu i: "
# 		addi $v0, $0, 4 # Khởi tạo Giá Trị 4 cho Thanh Ghi $v0
# 		lui  $at, 4097
# 		ori  $a0, $at, 0
# 		# LỆNH GIẢ la   $a0, input1 # Gán Địa Chỉ Của input1 vào Thanh Ghi $a0 
# 		syscall # Gọi Hệ Thống
# 	
# 		addi $v0, $0, 1 # Khởi Tạo Giá Trị 1 Cho Thanh Ghi $v0 
# 		addi $a0, $t0, 0 # Gán Giá Trị Ở Thanh Ghi $t0 vào Thanh Ghi $a0 
# 		syscall # Gọi Hệ Thống
# 	
# 		addi $v0, $0, 4 # Khởi Tạo Giá Trị 4 Cho Thanh Ghi $v0 
# 		lui  $at, 4097
# 		ori  $a0, $at, 18
# 		# LỆNH GIẢ la   $a0, input2 # Gán Địa Chỉ Của input2 vào Thanh Ghi $a0 
# 		syscall # Gọi Hệ Thống
# 	
# 		# Input Số Thực
# 		addi $t0, $t0, 1 # Tăng Giá Trị Ở Thanh Ghi $t0 lên 1 
# 		addi $v0, $0, 5  # Khởi Tạo Giá Trị 5 Cho Thanh Ghi $v0 
# 		syscall # Gọi Hệ Thống
# 	
# 		sw   $v0, 0($a1) # Lưu Trữ Giá Trị Ở Thanh Ghi $v0 Vào Địa Chỉ Được Lưu Ở Thanh Ghi $a1 
# 		addi $a1, $a1, 4 # Tăng Giá Trị Ở Thanh Ghi $a1 lên 4
# 	
# 		j    For_input # Nhảy Đến Nhãn For_input 
# 	End_For_input: # Nhãn Kết Thúc Vòng Lặp For_input 
	j Solve # Nhảy Đến Nhãn Solve 
	
Solve: # Nhãn Solve Dùng Cho Việc Gọi Hàm Merge_Sort 
	addi $t5, $0, 50 # Khởi Tạo Giá trị 10 Là Kích Thước Của Mảng Cho Thanh Ghi $t5 
	j  QUICK_SORT # # Nhảy Đến Nhãn Merge_Sort 
	j END_SOLVE

Print_Array: # Nhãn Print_Array Dùng Cho Việc Gọi Hàm Xuất Mảng 
	addi $k0, $0, 0 # Khởi Tạo Giá Trị 0 Cho Thanh Ghi $k0 
	addi $t5, $0, 50 # Khởi Tạo Giá Trị 10 Cho Thanh Ghi $t5 
	addi $a1, $a3, 0 # Gán Thanh Ghi $a1 bằng địa chỉ nền của mảng
	For_Print_Array: # Nhãn For_Print_Array Dùng Làm Vòng Lặp Để Xuất Phần Tử Của Mảng 
		slt  $k1, $k0, $t5 # So Sánh Nếu Giá Trị Ở Thanh Ghi $k0 nhỏ hơn Giá Trị Ở Thanh Ghi $t5
		beq  $k1, $zero, End_For_Print_Array # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp và Đi Xuống Nhãn End_For_Print_Array
		lw   $a0, 0($a1) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $a1 đưa vào Thanh Ghi $a0 
		addi $a1, $a1, 4 # Tăng Giá Trị Ở Thanh Ghi $a1 lên 4
		addi $k0, $k0, 1 # Tăng Giá Trị Ở Thanh Ghi $k0 lên 1
		
		# Print Integer Number
		addi $v0, $0, 1 # Khởi Tạo Giá Trị 1 Cho Thanh Ghi $v0 
		syscall # Gọi Hệ Thống
		
		# Print Dau Cach 
		addi $v0, $0, 4 # Khởi Tạo Giá Trị 4 Cho Thanh Ghi $v0 
		#lui  $at, 4097
		#ori  $a0, $at, 230
		# LỆNH GIẢ 
		la   $a0, space_character # Gán Địa Chỉ Của space_character vào Thanh Ghi $a0 
		syscall # Gọi Hệ Thống
		j For_Print_Array # Nhảy Đến Nhãn For_Print_Array 
	End_For_Print_Array: # Nhãn End_For_Print_Array Dùng Để Kết Thúc Vòng Lặp
	
	# Print Endline 
	addi $v0, $0, 4 # Khởi Tạo Giá Trị 4 Cho Thanh Ghi $v0 
	lui  $at, 4097
	ori  $a0, $at, 21
	# LỆNH GIẢ la   $a0, endl # Gán Địa Chỉ Của endl vào Thanh Ghi $a0 
	syscall # Gọi Hệ Thống
	jr   $ra # Trả Về Địa Chỉ 

# Ham Parition De Tim Pivot
PARTITION:
	# Address Of Array is in $a3, $s1 = l, $s0 = h
	# x = array[h]
	sll $at, $s0, 2
	add $a1, $a3, $at
	lw  $s2, 0($a1)
	
	# i = (l - 1)
	add $s3, $s1, $t9
	# $s4 = j = l
	add $s4, $s1, $0
	
	# for (int j = l; j <= h - 1; j++)
	FOR_PARTITION:
		# if (j <= h - 1) then $at = 1 else $at = 0
		slt  $at, $s4, $s0
		# if $at = 0 then exit FOR_PARTITION
		beq  $at, $0, END_FOR_PARTITION
		# $t4 = x + 1
		addi $t4, $s2, 1
		# $t6 = arr[j]
		sll  $at, $s4, 2
		add  $a1, $a3, $at
		lw   $t6, 0($a1)
		# if arr[j] < x + 1 then $at = 1 else $at = 0
		slt  $at, $t6, $t4
		# j = j + 1
		addi $s4, $s4, 1
		# if arr[j] >= x + 1 then continue
		beq  $at, $0, FOR_PARTITION
		# j = j - 1
		add  $s4, $s4, $t9
		# i = i + 1
		addi $s3, $s3, 1
		# swap(arr[i], arr[j])
		sll  $at, $s3, 2
		add  $a1, $a3, $at
		lw   $t7, 0($a1)
		sw   $t6, 0($a1)
		sll  $at, $s4, 2
		add  $a1, $at, $a3
		sw   $t7, 0($a1)
		addi $s4, $s4, 1
		# Quay lại vòng lặp 
		j    FOR_PARTITION
	END_FOR_PARTITION:
	# End Of For loop
	
	# swap(arr[i], arr[j])
	addi $s3, $s3, 1
	sll  $at, $s3, 2
	add  $a1, $at, $a3
	lw   $t6, 0($a1)
	sll  $at, $s0, 2
	add  $a1, $at, $a3
	lw   $t7, 0($a1)
	sw   $t6, 0($a1)
	sll  $at, $s3, 2
	add  $a1, $at, $a3
	sw   $t7, 0($a1)
	# return i + 1
	add  $v0, $s3, $0
	# return back to QUICK_SORT function
	jr   $ra
END_PARTITION:
# End Of Partition function
	
# Ham Quick Sort
QUICK_SORT:	
	# $t0 = top = 0
	add  $t0, $0, $0
	# new_stack[0] = 0
	sw   $0, 0($a2)	
	# $t0 = $t0 + 1 = top + 1
	addi $t0, $t0, 1
	# new_stack[1] = array_size - 1
	addi $t9, $0, -1
	add  $at, $t5, $t9
	sw   $at, 4($a2)
	# While(top >= 0)
	WHILE_PARTITION:
		# if(top >= 0) then $at = 1 else $at = 0
		slt $at, $t9, $t0
		# if($at = 0) then exit while loop
		beq $at, $0, END_WHILE_PARTITION
		# h = new_stack[top - 1]
		sll $at, $t0, 2
		add $at, $a2, $at
		lw  $s0, 0($at)
		# top = top - 1
		add $t0, $t0, $t9
		# l = new_stack[top - 1]
		sll $at, $t0, 2
		add $at, $a2, $at
		lw  $s1, 0($at)
		# top = top - 1
		add $t0, $t0, $t9
		# $v1 = p = partition(l, h)
		jal PARTITION
		add $v1, $v0, $0
		# Print Array 
		jal Print_Array
		# $v0 = p - 1
		add $v0, $v1, $t9
		# if p - 1 > l then $at = 1 else $at = 0
		slt $at, $s1, $v0
		# if $at = 0 then jump to IF_2 else execute IF_1
		beq $at, $0, IF_2
		IF_1:	
			# top = top + 1
			addi $t0, $t0, 1
			# new_stack[top] = l
			sll  $at, $t0, 2
			add  $at, $at, $a2
			sw   $s1, 0($at)
			# top = top + 1
			addi $t0, $t0, 1
			# new_stack[top] = p - 1
			sll  $at, $t0, 2
			add  $at, $at, $a2
			sw   $v0, 0($at)
		IF_2:
		# $v0 = p + 1
		addi $v0, $v1, 1
		# if p + 1 < h then $at = 1 else $at = 0
		slt  $at, $v0, $s0
		# if $at = 0 then continue
		beq  $at, $0, WHILE_PARTITION
		# top = top + 1
		addi $t0, $t0, 1
		# stack[top] = p + 1
		sll  $at, $t0, 2
		add  $at, $at, $a2
		sw   $v0, 0($at)
		# top = top + 1
		addi $t0, $t0, 1
		# stack[top] = h		
		sll  $at, $t0, 2
		add  $at, $at, $a2
		sw   $s0, 0($at)
		# Quay Lại Vòng Lặp
		j   WHILE_PARTITION
	END_WHILE_PARTITION:
END_QUICK_SORT:
# End Of Quick Sort function

END_SOLVE: # Kết Thúc Chương Trình 
