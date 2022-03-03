# MIPS 2 add 2 numbers
# add +146 and -82. store in register 10
# Ethan Kamus

	.text
	.globl main
	

main:
	li		$t0, 146 #0x00000092
	li 		$t1, -82 #0xFFFFFFAE
	add		$t2, $t0, $t1

end:
	li $v0, 10
	syscall