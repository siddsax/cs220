.data


.text

.globl main

main:
	li $v0,5
	syscall
	move $a0,$v0
	move $a1,$v0
	loop:
		li $v0,5
		syscall
		move $t0,$v0
		sub $sp, $sp, 4
		sw $t0, 0($sp)
		beqz $a0, exit_from_loop
		sub $a0, $a0, 1
		j loop
	exit_from_loop:
		loop_print:
		li $v0,5
		syscall
		move $t0,$v0
		add $sp, $sp, 4
		sw $t0, 0($sp)
		beqz $a1, exit_from_loop
		sub $a1, $a0, 1
		j loop_print
	