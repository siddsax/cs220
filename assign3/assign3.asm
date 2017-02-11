.data

	#bin_string: .space 20
.text
.globl main

main:
	li $v0, 5
	syscall	
	add $a1, $v0, $zero
	add $a2, $v0, $zero
	
	#j loop
	li  $t0, 0
	blt $a1,$zero,convert_to_pos
	j loop
	
	convert_to_pos:
		li $t5,1
		sub $a1, $t5, $a1
		j loop	
	loop:

		rem $t1,$a1, 2
		#la $t2,bin_string
		sub $sp,$sp, 4
		sw $t1, 0($sp)
		#sb $t1, 0($t2)
		div $a1,$a1,2
		add $t0, $t0, 1
		#add $t2, $t2, 1
		beqz $a1, exit
		j loop
	exit:
		#la $t2,bin_string
		sub $sp, $sp, 4
		sw $zero, 0($sp)
		add $t0, $t0, 1
	complete_32_bits:
		sub $sp, $sp, 4
		sw $zero, 0($sp)
		add $t0, $t0, 1
		bne $t0, 16, complete_32_bits
		
		blt $a2,0,flip

		print_loop:
			beqz $t0,final_exit
			sub $t0,$t0,1
			lw $a0, 0($sp)
			li $v0,1
			syscall
			add $sp, $sp, 4	
			j print_loop
		final_exit:
			#Goodbye
#flip the bits
flip:
	print_loop2:
			beqz $t0,final_exit
			
			lw $a0, 0($sp)
			beq $a0, 1, flip_bit_one
			beq $a0, 0, flip_bit_zero
			flip_bit_one:
			li $a0,0
			j exit_to_print
			
			flip_bit_zero:
			li $a0,1
			j exit_to_print
			exit_to_print:
			li $v0,1
			syscall
			add $sp, $sp, 4
			sub $t0,$t0,1	
			j print_loop2
