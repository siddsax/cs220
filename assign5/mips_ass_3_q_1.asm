.data
	array: .space 500
	newline: .asciiz "\n"
	
.text
	main:
		li $v0, 5
		syscall
		
		move $s0, $v0
		
		addi $s0, $s0, 1
		
		li $t0, 0
				
		li $t6, 1
		li $t7, 2
		
		beq $s0, $t6, if0
		beq $s0, $t7, if1
		
		li $t3, 0
		sw $t3, array($t0)
		addi $t0, $t0, 1
		
		li $t4, 1
		sll $t1, $t0, 2
		sw $t4, array($t1)
		addi $t0, $t0, 1
							
		j loop
		
	#assign something 2
	#add 8 to sp
	loop:
		beq $t0, $s0, print
		
		add $t5, $t3, $t4
		move $t3, $t4
		move $t4, $t5
		
		sll $t1, $t0, 2
		sw $t5, array($t1)
		addi $t0, $t0, 1
				
		j loop		
		
	if0:
		sw $zero, array($zero)
	
		j print
		
	if1:
		
		beq $t0, $s0, print
		
		sll $t1, $t0, 2
		sw $t0, array($t1)
		addi $t0, $t0, 1
		
		j if1
		
		
	print:
		beq $s0, $zero, exit
		
		subi $t0, $t6, 1
		sll $t0, $t0, 2
		
		lw $t1, array($t0)
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		la $a0, newline
		li $v0, 4
		syscall
		
		addi $t6, $t6, 1
		subi $s0, $s0, 1
		
		j print
		
		
	exit:
		li $v0, 10
		syscall
