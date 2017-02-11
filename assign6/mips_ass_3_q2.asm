.data
	array: .space 200
	newline: .asciiz "\n"

.text

	main:
		li $v0, 5
		syscall
		
		move $s0, $v0
		subi $s1, $s0, 1
		
		li $t0, 0

		li $t1, 0
		
		j input
		
	input :
		beq $t0, $s0, sortinit
		
		li $v0, 5
		syscall
		
		sll $t2, $t0, 2
		
		sw $v0, array($t2)
		
		addi $t0, $t0, 1
		
		j input
		
		
	#substitute exit with print if you want to print the array
	sortinit:
		li $t0, 0
		beq $t1, $s1, exit
		
		addi $t1, $t1, 1
		
		j sort
		
	sort:
		beq $t0, $s1, sortinit
		
		sll $t3, $t0, 2
		addi $t4, $t3, 4
		
		lw $t2, array($t3)
		lw $t5, array($t4)	
		
		blt $t2, $t5, continue
		
		move $a0, $t3
		move $a1, $t4
		
		jal swap
		
		addi $t0, $t0, 1
		
		j sort
		
	continue:
		addi $t0, $t0, 1
		
		j sort
		
			
	
	#$a0 contanins the address of the first element
	#$a1 contains the address of the second element
	swap:
		lw $t3, array($a0)
		lw $t4, array($a1)
		sw $t3, array($a1)
		sw $t4, array($a0)
		
		jr $ra
		
	print:
		beq $t0, $s0, exit
		
		sll $t1, $t0, 2
		
		lw $a0, array($t1)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, newline				
		syscall
		
		addi $t0, $t0, 1
		
		j print
		
	exit:
		li $v0, 10
		syscall
		