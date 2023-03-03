.data
str1: .asciiz "Please! Enter Num1: "     #z for null character. if we remove z then it will print all strings till next z.
str2: .asciiz "Please! Enter Num2: "
str3: .asciiz "Answer is: "
.text
main:

li $v0,4
la $a0,str1
syscall
li $v0,5
syscall
move $t0,$v0


li $v0,4
la $a0,str2
syscall
li $v0,5
syscall
move $t1,$v0

bgt $t0,$t1 additionlabel
sub $t2,$t1,$t0
j exit
additionlabel: add $t2,$t1,$t0
exit:
li $v0,4
la $a0,str3
syscall
li $v0,1
move $a0,$t2
syscall
li $v0,10
syscall