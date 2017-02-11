.data
	frst_inpt_num: .asciiz "Enter the numerator of first number: "
	frst_inpt_den: .asciiz "Enter the denominator of first number: "
	sec_inpt_num: .asciiz "Enter the numerator of second number: "
	sec_inpt_den: .asciiz "Enter the denominator of second number: "
	exp: .asciiz "E"
	dec: .asciiz "."
.text


.globl main


main:
#scan the numbers
	li $v0,4
	la $a0,frst_inpt_num
	syscall
	li $v0,6
	syscall
	li.s $f9,0.0
	add.s $f1, $f0,$f9
	
	li $v0,4
	la $a0,frst_inpt_den
	syscall
	li $v0,6
	syscall
	add.s $f2, $f0,$f9
#	move.s $f2,$f0
	
	li $v0,4
	la $a0,sec_inpt_num
	syscall
	li $v0,6
	syscall
	add.s $f3, $f0,$f9
#	move.s $f3,$f0
	
	li $v0,4
	la $a0,sec_inpt_den
	syscall
	li $v0,6
	syscall
	add.s $f4, $f0,$f9
#	move.s $f4,$f0
#
#do the necessary computations
	div.s $f10,$f1,$f2
	div.s $f11,$f3,$f4
	add.s $f12, $f10, $f11
	#add $d, $s, $t
	li.s $f5, 10.0
	c.lt.s $f5,$f12
	bc1t divide_by_10
	li $t0 , 0
	j next
	divide_by_10:
		div.s $f12,$f12,$f5
		add $t0, $t0, 1
	#	bge.s $f12,$f5,divide_by_10
		c.lt.s $f5,$f12
		bc1t divide_by_10
	next:
	 #Note: The number you want to truncate is in $f12

##### Load 100 #####
	li $t5,100                              # t5 = 100 (word),       t5 (word)
	mtc1 $t5,$f5                            # f5 = t5  (word),       f5 (word)
	cvt.s.w $f5,$f5                         # f5 = wordToSingle(f5), f5 (single)

	##### Multiply f12(single) by 100 (single) #####    
	mul.s $f12,$f12,$f5                     # f12 = f12 (single) * f5 (single), f12 (single)

##### Truncate single to word #####
	trunc.w.s $f12,$f12                     # f12 = truncWordToSingle(f12 (single)), f12 (word)

##### Convert from word to single #####
	#cvt.s.w $f12,$f12                       # f12 = convertWordToSingle(f12 (word)), f12 (single)
	mfc1 $a0,$f12
##### Divide by 100 #####
	rem $a1,$a0,100        
	div $a0	,$a0,100
	li $v0,1
	syscall
	li $v0,4
	la $a0,dec
	syscall
	li $v0,1
	move $a0,$a1
	syscall
	
	li $v0,4
	la $a0,exp
	syscall
	li $v0,1
	move $a0,$t0
	syscall
