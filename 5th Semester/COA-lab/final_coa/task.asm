.data
str: .asciiz"please enter num1:"
str1: .asciiz"please enter num2:"
str2: .asciiz"Result is: "
.text
main:
li $v0,4
la $a0,str
syscall

li $v0,7
syscall
mov.d $f2,$f0

li $v0,4
la $a0,str1
syscall

li $v0,7
syscall
mov.d $f4,$f0

add.d $f6,$f2,$f4

li $v0,3
mov.d $f12,$f6
syscall

li $v0,10
syscall


