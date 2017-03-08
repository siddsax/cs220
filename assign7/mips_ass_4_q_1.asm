.data
	arr: .space 400
	newline: .asciiz "\n"
	
.text
main:	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	#li $v0, 1
	#move $a0, $s0
	#syscall
	
	move $t0, $zero
	
	j input
	
	input:
		beq $t0, $s0, takelement
		
		sll $t1, $t0, 2
		
		li $v0, 5
		syscall
		
		sw $v0, arr($t1)
		
		addi $t0, $t0, 1
		
		j input
		
		
	takelement:
		li $v0, 5
		syscall
		
		move $a0, $v0
		
		move $a1, $zero
		
		sub $a2, $s0, 1
		move $s1, $a2
		
		move $v0, $zero
		
		j search
		
		
	
	search:
		
		
		add $t0, $a1, $a2
		
		srl $t0, $t0, 1
		sll $t2, $t0, 2
		

		lw $t1, arr($t2)
		
		beq $t1, $a0, found
		
		beq $t0, $zero, notFound
		beq $t0, $s1, notFound
		
		blt $a0, $t1, goLeft
		
		#goRight
		move $a1, $t0
		addi $a1, $a1, 1
		
		j search

	goLeft:
		move $a2, $t0
		sub $a2, $a2, 1
		
		j search		
	
	#indexing from 1 to n
	found:
		beq $t0, $zero, print
		
		sub $t1, $t0, 1
		
		sll $t1, $t1, 2
		sll $t2, $t0, 2
		
		lw $t3, arr($t2)
		lw $t4, arr($t1)
		
		bne $t3, $t4, print
		
		sub $t0, $t0, 1
		
		j found
		
	notFound:
		li $a0, -1
		li $v0, 1
		syscall
		
		j exit
		
	print:
		move $a0, $t0
		addi $a0, $a0, 1
		li $v0, 1
		syscall
		
		j exit
		
	exit:
		li $v0, 10
		syscall
	
