.data
input1: .asciiz "Nhap Phan Tu Thu "
input2: .asciiz ": "
endl: .asciiz "\n"
merge_i: .asciiz "Merge "
array: .word 0:201 
space_character: .asciiz " "

.text
main:	
	lui  $at, 4097
	ori  $a3, $at, 32
	# LỆNH GIẢ la   $a3, array # Thanh Ghi $s3 chứa địa chỉ nền của mảng
	# Nhập Mảng Gồm 50 Số Nguyên 
	addi $t0, $0, 0 # Khởi Tạo Giá trị 0 Cho Thanh Ghi $t0
	addi $t5, $0, 10 # Khởi Tạo Giá trị 10 Là Kích Thước Của Mảng Cho Thanh Ghi $t5 
	addi $a1, $a3, 0 # Gán Thanh Ghi $a1 bằng địa chỉ nền của mảng
	
	For_input: # Vòng For sử dụng cho việc input các phần tử của mảng 
		slt  $t1, $t0, $t5 # So Sánh Nếu Thanh Ghi $t0 nhỏ hơn $t5
		beq  $t1, $zero, End_For_input # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp 
		addi $v0, $0, 4 # Khởi tạo Giá Trị 4 cho Thanh Ghi $v0
		lui  $at, 4097
		ori  $a0, $at, 0
		# LỆNH GIẢ la   $a0, input1 # Gán Địa Chỉ Của input1 vào Thanh Ghi $a0 
		syscall # Gọi Hệ Thống
	
		addi $v0, $0, 1 # Khởi Tạo Giá Trị 1 Cho Thanh Ghi $v0 
		addi $a0, $t0, 0 # Gán Giá Trị Ở Thanh Ghi $t0 vào Thanh Ghi $a0 
		syscall # Gọi Hệ Thống
	
		addi $v0, $0, 4 # Khởi Tạo Giá Trị 4 Cho Thanh Ghi $v0 
		lui  $at, 4097
		ori  $a0, $at, 18
		# LỆNH GIẢ la   $a0, input2 # Gán Địa Chỉ Của input2 vào Thanh Ghi $a0 
		syscall # Gọi Hệ Thống
	
		addi $t0, $t0, 1 # Tăng Giá Trị Ở Thanh Ghi $t0 lên 1 
		addi $v0, $0, 5  # Khởi Tạo Giá Trị 5 Cho Thanh Ghi $v0 
		syscall # Gọi Hệ Thống
	
		sw   $v0, 0($a1) # Lưu Trữ Giá Trị Ở Thanh Ghi $v0 Vào Địa Chỉ Được Lưu Ở Thanh Ghi $a1 
		addi $a1, $a1, 4 # Tăng Giá Trị Ở Thanh Ghi $a1 lên 4
	
		j    For_input # Nhảy Đến Nhãn For_input 
	End_For_input: # Nhãn Kết Thúc Vòng Lặp For_input 
	j Solve # Nhảy Đến Nhãn Solve 
	
Solve: # Nhãn Solve Dùng Cho Việc Gọi Hàm Merge_Sort 
	addi $t5, $0, 10 # Khởi Tạo Giá trị 10 Là Kích Thước Của Mảng Cho Thanh Ghi $t5 
	j    Merge_Sort # # Nhảy Đến Nhãn Merge_Sort 

Print_Array: # Nhãn Print_Array Dùng Cho Việc Gọi Hàm Xuất Mảng 
	addi $k0, $0, 0 # Khởi Tạo Giá Trị 0 Cho Thanh Ghi $k0 
	addi $t5, $0, 10 # Khởi Tạo Giá Trị 5 Cho Thanh Ghi $v0 
	addi $a1, $a3, 0 # Gán Thanh Ghi $a1 bằng địa chỉ nền của mảng
	For_Print_Array: # Nhãn For_Print_Array Dùng Làm Vòng Lặp Để Xuất Phần Tử Của Mảng 
		slt  $k1, $k0, $t5 # So Sánh Nếu Giá Trị Ở Thanh Ghi $k0 nhỏ hơn Giá Trị Ở Thanh Ghi $t5
		beq  $k1, $zero, End_For_Print_Array # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp và Đi Xuống Nhãn End_For_Print_Array
		lw   $a0, 0($a1) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $a1 đưa vào Thanh Ghi $a0 
		addi $a1, $a1, 4 # Tăng Giá Trị Ở Thanh Ghi $a1 lên 4
		addi $k0, $k0, 1 # Tăng Giá Trị Ở Thanh Ghi $k0 lên 1
		
		addi $v0, $0, 1 # Khởi Tạo Giá Trị 1 Cho Thanh Ghi $v0 
		syscall # Gọi Hệ Thống
		
		addi $v0, $0, 4 # Khởi Tạo Giá Trị 4 Cho Thanh Ghi $v0 
		lui  $at, 4097
		ori  $a0, $at, 836
		# LỆNH GIẢ la   $a0, space_character # Gán Địa Chỉ Của space_character vào Thanh Ghi $a0 
		syscall # Gọi Hệ Thống
		j For_Print_Array # Nhảy Đến Nhãn For_Print_Array 
	End_For_Print_Array: # Nhãn End_For_Print_Array Dùng Để Kết Thúc Vòng Lặp
	addi $v0, $0, 4 # Khởi Tạo Giá Trị 4 Cho Thanh Ghi $v0 
	lui  $at, 4097
	ori  $a0, $at, 21
	# LỆNH GIẢ la   $a0, endl # Gán Địa Chỉ Của endl vào Thanh Ghi $a0 
	syscall # Gọi Hệ Thống
	jr   $ra # Trả Về Địa Chỉ 
	
Merge: # Nhãn Cho Hàm Merge
	sw   $ra, 12($sp) # Lưu Trữ Giá Trị Ở Thanh Ghi $ra Vào Địa Chỉ Được Lưu Ở Thanh Ghi $sp + 12 
	lw   $s0, 0($sp) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $sp đưa vào Thanh Ghi $s0 
	lw   $s1, 4($sp) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $sp + 4 đưa vào Thanh Ghi $s1 
	lw   $s2, 8($sp) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $sp + 8 đưa vào Thanh Ghi $s2 
	addi $sp, $sp, 12 # Pop 3 Phần Tử Trên Cùng Của Stack 
	add  $s3, $s2, $0 # $s3 = $s2 - $s0 
	addi $s3, $s3, 1 # $s3 = $s3 + 1
	addi $t8, $s0, 0 # Khởi Tạo Giá Trị 0 Cho Thanh Ghi $t8 
	For_Merge_1: # Nhãn For_Merge_1 Dùng Làm Vòng Lặp Để Duyệt Phần Tử Của Mảng 
		slt  $a2, $t8, $s3 # So Sánh Nếu Giá Trị Ở Thanh Ghi $t8 nhỏ hơn Giá Trị Ở Thanh Ghi $s3
		beq  $a2, $0, End_For_Merge_1 # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp For_Merge_1 và Đi Xuống Nhãn End_For_Merge_1
		addi $t9, $t8, 1 # $t9 = $t8 + 1
		For_Merge_2: # Nhãn For_Merge_2 Dùng Làm Vòng Lặp Để Duyệt Phần Tử Của Mảng 
			slt  $a2, $t9, $s3 # So Sánh Nếu Giá Trị Ở Thanh Ghi $t9 nhỏ hơn Giá Trị Ở Thanh Ghi $s3
			beq  $a2, $0, End_For_Merge_2 # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp For_Merge_2 và Đi Xuống Nhãn End_For_Merge_2
			sll  $s4, $t8, 2 # $s4 = $t8 * 4
			add  $s4, $s4, $a3 # s4 = $s4 + $a3 
			lw   $s6, 0($s4) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $s4 đưa vào Thanh Ghi $s6
			sll  $s5, $t9, 2 # $s5 = $t9 * 4
			add  $s5, $s5, $a3 # $s5 = $s5 + $a3 
			lw   $s7, 0($s5) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $s5 đưa vào Thanh Ghi $s7
			
			slt  $t6, $s7, $s6 # So Sánh Nếu Giá Trị Ở Thanh Ghi $s7 nhỏ hơn Giá Trị Ở Thanh Ghi $s6
			addi $t9, $t9, 1 # $t9 = $t9 + 1 
			beq  $t6, $0, For_Merge_2 # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Quay Lại Vòng Lặp For_Merge_2
			
			sw   $s7, 0($s4) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $s4 đưa vào Thanh Ghi $s7
			sw   $s6, 0($s5) # Lấy Giá Trị Ở Địa Chỉ có Giá Trị Ở $s5 đưa vào Thanh Ghi $s6
			j    For_Merge_2 # Nhảy Đến Nhãn For_Merge_2 
		End_For_Merge_2: # Nhãn End_For_Merge_2 Dùng Để Kết Thúc Vòng Lặp For_Merge_2
		addi $t8, $t8, 1 # $t8 = $t8 + 1 
		j    For_Merge_1 # Nhảy Đến Nhãn For_Merge_1
	End_For_Merge_1: # Nhãn End_For_Merge_1 Dùng Để Kết Thúc Vòng Lặp For_Merge_1
	jal  Print_Array # Gán Địa Chỉ Của Câu Lệnh Tiếp Theo Vào Thanh Ghi $ra và Nhảy Lên Nhãn Print_Array 
	lw   $ra, 0($sp) # Lấy Giá Trị Ở Đầu Stack Và đưa vào Thanh Ghi $ra
	addi $sp, $sp, 4 # Pop 1 Phần Tử Ra Khỏi Stack 
	jr   $ra # Trả Về Địa Chỉ 

Merge_Sort: # Nhãn Cho Hàm Merge_Sort
	addi $at, $0, 1
	sub  $t4, $t5, $at
	# LỆNH GIẢ subi $t4, $t5, 1 # $t4 = $t5 - 1
	addi $t0, $0, 1 # $t0 = 1 
	For_Merge_Sort_1: # Nhãn For_Merge_Sort_1
		slt $t1, $t0, $t5 # So Sánh Nếu Giá Trị Ở Thanh Ghi $t0 nhỏ hơn Giá Trị Ở Thanh Ghi $t5
		beq $t1, $0, End_For_Merge_Sort_1 # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp For_Merge_Sort_1 và Đi Xuống Nhãn End_For_Merge_Sort_1
		add $t1, $0, $0 # $t1 = 0
		For_Merge_Sort_2: # Nhãn For_Merge_Sort_2
			slt  $v0, $t1, $t4 # So Sánh Nếu Giá Trị Ở Thanh Ghi $t1 nhỏ hơn Giá Trị Ở Thanh Ghi $t4
			beq  $v0, $0, End_For_Merge_Sort_2 # Nếu Phép So Sánh Trên Trả Là False Thì Sẽ Kết Thúc Vòng Lặp For_Merge_Sort_2 và Đi Xuống Nhãn End_For_Merge_Sort_2
			sll  $v1, $t0, 1 # v1 = $t0 * 2 
			add  $t3, $t0, $t1 # $t3 = $t0 + $t1 
			addi $at, $0, 1
			sub  $t3, $t3, $at
			# LỆNH GIẢ subi $t3, $t3, 1 # $t3 = $t3 - 1
			slt  $v0, $t3, $t4 # So Sánh Nếu Giá Trị Ở Thanh Ghi $t3 nhỏ hơn Giá Trị Ở Thanh Ghi $t4
			addi $at, $0, 1
			beq  $at, $v0, Else_1
			# LỆNH GIẢ beq  $v0, 1, Else_1 # Nếu Phép So Sánh Trên Trả Là True Thì Sẽ Đi Xuống Nhãn Else_1 
			add  $t3, $t4, $0 # $t3 = $t4
			Else_1: # Nhãn Else_1
			add  $t2, $t1, $v1 # $t2 = $t1 + $v1 
			addi $at, $0, 1
			sub  $t2, $t2, $at
			# LỆNH GIẢ subi $t2, $t2, 1 # $t2 = $t2 + 1 
			slt  $v0, $t2, $t4 # So Sánh Nếu Giá Trị Ở Thanh Ghi $t2 nhỏ hơn Giá Trị Ở Thanh Ghi $t4
			addi $at, $0, 1
			beq  $at, $v0, Else_2
			# LỆNH GIẢ beq  $v0, 1, Else_2 # Nếu Phép So Sánh Trên Trả Là True Thì Sẽ Đi Xuống Nhãn Else_2
			add  $t2, $t4, $0 # $t2 = $t4
			Else_2: # Nhãn Else_2 
			addi $sp, $sp, -16 # Cấp Phát 4 Ô Trong Stack 
			sw   $t2, 8($sp) # Lưu Trữ Giá Trị Ở Thanh Ghi $t2 Vào Địa Chỉ Được Lưu Ở Thanh Ghi $sp + 8 			
			sw   $t3, 4($sp) # Lưu Trữ Giá Trị Ở Thanh Ghi $t3 Vào Địa Chỉ Được Lưu Ở Thanh Ghi $sp + 4			
			sw   $t1, 0($sp) # Lưu Trữ Giá Trị Ở Thanh Ghi $t1 Vào Địa Chỉ Được Lưu Ở Thanh Ghi $sp 
			jal  Merge # Gán Địa Chỉ Của Câu Lệnh Tiếp Theo Vào Thanh Ghi $ra và Nhảy Lên Nhãn Merge 
			add  $t1, $t1, $v1 # $t1 = $t1 + $v1 
			j    For_Merge_Sort_2 # Nhảy Đến Nhãn For_Merge_Sort_2
		End_For_Merge_Sort_2: # Nhãn End_For_Merge_Sort_2
		sll $t0, $t0, 1 # $t0 = $t0 * 2 
		j   For_Merge_Sort_1 # Nhảy Đến Nhãn For_Merge_Sort_1
	End_For_Merge_Sort_1: # Nhãn End_For_Merge_Sort_1
END_SOLVE: # Nhãn END_SOLVE
