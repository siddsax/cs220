#itoa
#$t0 = initial integer
#$t1 = place where string is stored
#This program I'm attempting to by hand create a null ended string from an original integer 2.
.data
 number: .asciiz "000"
.text
.globl main
main:
	li $t3,1
	loop:
		la $t0,number
		sb $zero, 0($t0)
		beq $t3, 5, exit
		add $t3, $t3, 1
		add $t0, $t0, 1
		j loop
exit:
	la $a0,number
	#exit program
	loop2:
		
		#sb $zero, 0($t0)
		lb $a0, 0($t0)
		li $v0,11
		syscall
		beqz $t3, exit2
		sub $t3, $t3, 1
		sub $t0, $t0, 1
		j loop2
	exit2:
	li $v0, 10
	syscall

