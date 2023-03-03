.data
str1: .asciiz"The Quotient is: "
str2: .asciiz"\nThe Remender is: "
str3: .asciiz"\nMultiplication is: "

.text
main: #---------------------
addi $t0, $0, 60
addi $t1, $0, 7
mult $t0, $t1       #multiplication
mflo $t6
div $t0, $t1         #division
li $v0,4
la $a0,str1
syscall
li $v0,1
mflo $a0
syscall
li $v0,4
la $a0,str2
syscall
li $v0,1
mfhi $a0
syscall

li $v0,4
la $a0,str3
syscall
li $v0,1
move $a0,$t6
syscall

li $v0,10
syscall
