.data 0x10000110
X: .word 20 110 17 5 3 12 18 8 99 25
.text
printint:
    li $v0, 1
    syscall
    li $v0, 11
    li $a0, 32
    syscall
    jr $ra
printarray:
    sw $fp, 0($sp)
    addi $fp, $sp, 0
    sw $ra, 4($fp)
    addi $sp, $sp, 8
    la $t0, X
    li $t2, 10
    li $t1, 0
loop:
    beq $t1, $t2, done
    sll $t3, $t1, 2
    addu $t4, $t0, $t3
    lw $a0, 0($t4)
    jal printint
    addi $t1, $t1, 1
    j loop
done:
    lw $ra, 4($fp)
    addi $sp, $fp, 0
    lw $fp, 0($fp)
    jr $ra
main:
    jal printarray
    li $v0, 10
    syscall
