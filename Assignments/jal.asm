	.data 0x10000100
str1:	.asciiz "This is function 1"
str2:	.asciiz	"This is function 2"
str3:	.asciiz	"This is main"

	.text

#fun1: Prints "This is function 1", then calls fun2
fun1:
	sw $fp, 0($sp)
	addi $fp, $sp, 0
	sw $ra, 4($fp)
	addi $sp, $sp, 8
	li $v0, 4
	la $a0, str1
	syscall
	jal fun2
	lw $ra, 4($fp)
	addi $sp, $fp, 0
	lw $fp, 0($fp)
	jr $ra

#fun2: Prints "This is function 2"
fun2:	li $v0, 4
	la $a0, str2
	syscall
	jr $ra

#main: Calls fun1 then prints "This is main
main:	jal fun1
	li $v0, 4
	la $a0, str3
	syscall
	li $v0, 10
	syscall	