# MIPS 3
# store 0x1a and shift to the left by 2 bits
# Ethan Kamus

	.text
	.globl main
	

main:
	li		$t0, 0x1a
	li		$t1, 2
	sll		$t2, $t0, $t1
end:
	li $v0, 10
	syscall
