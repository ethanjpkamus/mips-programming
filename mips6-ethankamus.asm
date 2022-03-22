# mips 6
# create a fahrenheit / celcius converter 

	.data
	newl: 		.asciiz "\n"
	input: 		.asciiz "Enter Scale: "
	tempinput: 	.asciiz "Enter Temperature: "
	cout: 		.asciiz "The temperature in Celcius is: "
	fout: 		.asciiz "The temperature in Fahrenheit is:"
	bye:		.asciiz "bye!"
	buffer:		.space 20
	f1:			.byte 'f'
	f2:			.byte 'F'
	c1:			.byte 'c'
	c2:			.byte 'C'
	
	q1:			.byte 'q'
	q2:			.byte 'Q'
	
	.globl main
	
	.text
main:
	# GET TEMP INPUT
	li		$v0, 4
	la		$a0, tempinput
	syscall
	
	li		$v0, 5	# input syscall
	syscall
	
	add		$t0, $v0, $zero		# store value
	
	
	# GET SCALE INPUT
	li		$v0, 4
	la		$a0, input
	syscall
	
	la		$a0, buffer
	li		$a1, 20
	li		$v0, 8
	syscall
	
	# JUMP TO CELCIUS
	lb		$t3, ($a0)
	lb		$t4, f1
	beq		$t3, $t4, celcius
	
	lb		$t3, ($a0)
	lb		$t4, f2
	beq		$t3, $t4, celcius

	
	# JUMP TO FAHRENHEIT
	lb		$t3, ($a0)
	lb		$t4, c1
	beq		$t3, $t4, fahrenheit
	
	lb		$t3, ($a0)
	lb		$t4, c2
	beq		$t3, $t4, fahrenheit

	# JUMP TO END
	lb		$t3, ($a0)
	lb		$t4, q1
	beq		$t3, $t4, end
	
	lb		$t3, ($a0)
	lb		$t4, q2
	beq		$t3, $t4, end
	
	j 		end
	
celcius:
	# DO CONVERSION
	li		$t5, 32
	sub		$t0, $t0, $t5
	li		$t7, 9
	li		$t6, 5
	div 	$t6, $t7
	mflo	$t5
	mult	$t5, $t0
	mflo	$t0
	
	# PRINT CONVERSION
	li		$v0, 4
	la		$a0, cout
	syscall
	
	li		$v0, 1
	add		$a0, $t0, $zero
	syscall
	
	li		$v0, 4
	la		$a0, newl
	syscall
	
	# JUMP TO MAIN
	j		main
	
fahrenheit:
	# DO CONVERISON
	li		$t5, 9
	mult	$t0, $t5
	mflo	$t0
	li		$t5, 5
	div		$t0, $t5
	mflo	$t0
	add		$t0, $t0, 32
	
	# PRINT CONVERSION
	li		$v0, 4
	la		$a0, cout
	syscall
	
	li		$v0, 1
	add		$a0, $t0, $zero
	syscall
	
	li		$v0, 4
	la		$a0, newl
	syscall
	
	# JUMP TO MAIN
	j		main
	
end:
	li		$v0, 4
	la		$a0, bye
	syscall
	
	li      $v0, 10
    syscall