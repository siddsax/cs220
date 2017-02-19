.data
	array_1: .space 200
	array_2: .space 200
	array_3: .space 200
	R_num_1: .asciiz "Enter the row number first matrix number:\n "
	C_num_1: .asciiz "Enter the column number first matrix number:\n"
	R_num_2: .asciiz "Enter the row number second matrix number:\n "
	C_num_2: .asciiz "Enter the column number second matrix number:\n"
	newline: .asciiz "\n"
.text
	main:

    # enter the mat 1 details
	  li $v0,4
	  la $a0,R_num_1
	  syscall
		li $v0, 5
		syscall
		move $s0, $v0		

	  li $v0,4
	  la $a0,C_num_1
	  syscall
		li $v0, 5
		syscall		
		move $s1, $v0		

    mult $s1,$s0
    mflo $t0 # 32 least significant bits of multiplication t

    # enter the mat 2 details
	  li $v0,4
	  la $a0,R_num_2
	  syscall
		li $v0, 5
		syscall
		move $s2, $v0		

	  li $v0,4
	  la $a0,C_num_2
	  syscall
		li $v0, 5
		syscall		
		move $s3, $v0		

    mult $s2,$s3
    mflo $t1 # 32 least significant bits of multiplication t

    # counter
    li $t4 0
    li $t6 0
    li $t7 0
		j input_1
      
				

	input_1:
		beq $t4, $t0, input_2
		
		li $v0, 7
		syscall
		
		sll $t5, $t4, 3
		sdc1 $f0, array_1($t5)		
		
		addi $t4, $t4, 1
		j input_1

	input_2:
		beq $t6, $t1, intermediate
		
		li $v0, 7
		syscall

		sll $t5, $t6, 3
		sdc1 $f0, array_2($t5)		

		addi $t6, $t6, 1
		j input_2	
 
    intermediate:

    mult $s0, $s3
		mflo $s4
		
		move $a1, $zero
		move $a2, $zero
		move $a3, $zero
		
		la $a0, array_3
		
		jal multiply		

	multiply:	
		j loop1
		
	loop1:
		beq $a1, $s0, print
		move $a2, $zero
		j loop2
		
	loop2:
		beq $a2, $s3, change1
		move $a3, $zero
		mtc1 $zero, $f6
		j loop
	
	loop:
		beq $a3, $s2, change
		mult $a1, $s1
		mflo $t0
		add $t0, $t0, $a3
		sll $t1, $t0, 3
		ldc1 $f2, array_1($t1)
		mult $a3, $s3
		mflo $t0
		add $t0, $t0, $a2
		sll $t1, $t0, 3
		ldc1 $f4, array_2($t1)

		mul.d $f0, $f2, $f4
		
		add.d $f6, $f6, $f0
		
		addi $a3, $a3, 1
		
		j loop
		
		
	change:
	
		mult $a1, $s3
		mflo $t0
		add $t0, $t0, $a2
		sll $t1, $t0, 3
		sdc1 $f6, array_3($t1)
		
		mtc1 $zero, $f6
		
		addi $a2, $a2, 1
		j loop2
		
	change1:
		addi $a1, $a1, 1
		j loop1
		
	print:
		li $t0, 0
		j loop_p
		
	loop_p:
		beq $t0, $s4, exit
		sll $t1, $t0, 3
		l.d $f12, array_3($t1)
		li $v0, 3
		syscall
		
		la $a0, newline
		li $v0, 4
		syscall
		
		addi $t0, $t0, 1
		
		j loop_p
		
		
	exit:
		li $v0, 10
		syscall

#	print:
		beq $t7, $t1, exit
		
		sll $t6, $t7, 3
		
		l.d $f12, array_2($t6)
		
		li $v0, 3
		syscall
		
		li $v0, 4
		la $a0, newline				
		syscall
		
		addi $t7, $t7, 1
		
		j print
		
#	exit:
		li $v0, 10
		syscall