	.text
	.globl main

main:

#== part 1 ====================================================	

	li		$t6, 3
	li		$t7, 2
	add		$t8, $t6, $t7

	li		$v0, 1 				
	add 	$a0, $t8, $zero
	syscall

#== part 2 ====================================================
	
	ori		$8, $0, 0x3
	ori		$9, $8, 0x10

	li		$v0 1
	add		$a0, $9, $zero
	syscall

end:
	li $v0, 10
	syscall
	