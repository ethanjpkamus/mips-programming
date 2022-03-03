# MIPS 4
# Declare 12, 97, 133, 82, 236 in the .data section and find their average
# Ethan Kamus
	.data
	n1:		.byte 12
	n2: 	.byte 97	
	n3: 	.byte 133
	n4: 	.byte 82
	n5: 	.byte 236

	msg1:	.asciiz "12 + 97 + 133 + 82 + 236 = "
	msg2:	.asciiz " / 5 = "
	newl:	.asciiz "\n"
	
	.text
	.globl main
	
main:
	
	# load values into registers
	lbu 	$t0, n1
	lbu		$t1, n2
	lbu 	$t2, n3
	lbu		$t3, n4
	lbu		$t4, n5
	
	# sum
	add		$t5, $t0, $t1
	add		$t5, $t5, $t2
	add		$t5, $t5, $t3
	add		$t5, $t5, $t4
	
	# find average
	div		$t6, $t5, 5
	
	# print sum
	li		$v0, 4
	la		$a0, msg1
	syscall
	
	li		$v0, 1
	add		$a0, $t5, $zero
	syscall
	
	li		$v0, 4
	la		$a0, newl
	syscall
	
	# print division
	li		$v0, 1
	add		$a0, $t5, $zero
	syscall
	
	li		$v0, 4
	la		$a0, msg2
	syscall
	
	li		$v0, 1
	add		$a0, $t6, $zero
	syscall
	
	li		$v0, 4
	la		$a0, newl
	syscall

end:
	li $v0, 10
	syscall