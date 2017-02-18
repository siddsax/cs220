.data
	arr1: .space 500
	arr2: .space 500
	arr3: .space 500
	newline: .asciiz "\n"
	
.text
	main:
		li $v0, 5
		syscall
		move $s0, $v0
		li $v0, 5
		syscall
		move $s1, $v0
		
		li $a0, 0
		mult $s0, $s1
		mflo $a1
		
		jal input1
		
		li $v0, 5
		syscall
		move $s2, $v0
		li $v0, 5
		syscall
		move $s3, $v0
		
		li $a0, 0
		mult $s2, $s3
		mflo $a1
		
		jal input2
	
		mult $s0, $s3
		mflo $s4
		
		move $a1, $zero
		move $a2, $zero
		move $a3, $zero
		
		la $a0, arr3
		
		jal multiply		
		
	input1:
		
		li $v0, 7
		syscall
		
		mov.d $f2, $f0
		sll $t0, $a0, 3
		sdc1 $f2, arr1($a0)
		
		addi $a0, $a0, 1
		sub $sp, $sp, 4
		sw $ra, 0($sp)
		
		sub $a1, $a1, 1
		
		beq $a1, $zero, continue
		
		jal input1
		
		lw $ra, 0($sp)
		
		addi $sp, $sp, 4
		
		jr $ra
input2:
		
		li $v0, 7
		syscall
		
		mov.d $f2, $f0
		sll $t0, $a0, 3
		sdc1 $f2, arr2($a0)
		
		addi $a0, $a0, 1
		sub $sp, $sp, 4
		sw $ra, 0($sp)
		
		sub $a1, $a1, 1
		
		beq $a1, $zero, continue
		
		jal input2
		
		lw $ra, 0($sp)
		
		addi $sp, $sp, 4
		
		jr $ra		
	continue:
		lw $ra, 0($sp)
		
		addi $sp, $sp, 4
		
		jr $ra
		
	multiply:
		
		j loop1
		
		
	loop1:
	
		beq $a1, $s0, print
		
		move $a2, $zero
		
		j loop2
		
		
	loop2:
		
		beq $a2, $s3, change1
		
		move $a3, $zero
		
		j loop
		
	loop:
		beq $a3, $s2, change
		
		mult $a1, $s1
		mflo $t0
		add $t0, $t0, $a3
		sll $t1, $t0, 3
		ldc1 $f2, arr1($t1)
		
		mult $a3, $s3
		mflo $t0
		add $t0, $t0, $a2
		sll $t1, $t0, 3
		ldc1 $f4, arr2($t1)
		
		mul.d $f0, $f2, $f4
		
		mult $a1, $s3
		mflo $t0
		add $t0, $t0, $a2
		sll $t1, $t0, 3
		sdc1 $f0, arr3($t1)
		
		addi $s3, $s3, 1
		
		j loop
		
		
	change:
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
		
		ldc1 $f12, arr3($t1)
		
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
