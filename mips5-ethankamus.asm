# MIPS 5
# Ethan Kamus
    .data
    string: .asciiz "ABCDEFG"
    ans: .asciiz "to lowercase: "
    endl: .asciiz "\n"

    .globl main
    .text

main:
    la      $a0, string
    li      $v0, 4
    syscall

    la      $a0, endl
    li      $v0, 4
    syscall

    la      $t1, string                 # load string

loop: 
    lb      $t2, ($t1)                  # get next char in string
    beqz    $t2, end                    # if at end of string
    addi    $t4, $zero, 0x61
    sub     $t3, $t2, $t4
    bgez    $t3, l1
    add     $t2, $t2, 32
    sb      $t2, ($t1)
l1: 
    add     $t1, $t1, 1
    j       loop

end: 
    la      $a0, ans
    li      $v0, 4
    syscall

    la      $a0, string
    li      $v0, 4
    syscall

    la      $a0, endl
    li      $v0, 4
    syscall

    li      $v0, 10
    syscall
