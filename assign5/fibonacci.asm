.data
  	spc: .asciiz " "

.text


.globl main



main:

	#read the value of n : no of fibonacci numbers
	li $v0,5
	syscall
	move $a1,$v0
	move $a2,$a1
	li $s1,0
	li $s2,1
		
	#Error  handling for boundary cases
	beqz $a1,exit_loop_for_fib
	#li $v0,1
	#move $a0,$s1
	#syscall
	sub $sp, $sp, 4
	sw $s1, 0($sp)			#storing in memory
	beq $a1,1,exit_loop_for_fib

	
	# t1 and t2 are 
	loop_for_fib_computing:
		#li $v0,1
		#move $a0,$s2					#printing
		#syscall
		sub $sp, $sp, 4
		sw $s2, 0($sp)
	
		move $t0,$s1
		move $s1,$s2
		add $s2, $s2, $t0				
		beq $a1,2,exit_loop_for_fib
		sub $a1, $a1, 1
		
		j loop_for_fib_computing
	exit_loop_for_fib:

	#printing the stack
	mul $t5,$a2,4
	add $sp, $sp, $t5
	loop_for_printing_stack:
		beqz $a2,exit_program
		li $v0,1
		sub $sp, $sp, 4
		lw $t1, 0($sp)
		move $a0,$t1					#printing
		syscall
		li $v0,4
		la $a0,spc
		syscall
		sub $a2, $a2, 1
		j loop_for_printing_stack		
exit_program: