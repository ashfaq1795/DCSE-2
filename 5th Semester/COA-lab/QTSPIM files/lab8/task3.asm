.data
str: .asciiz"Name: Ashfaq Ahmad\nReg No: 19pwcse1795"
str1: .asciiz"\nPlease! Ener num1: "
str2: .asciiz"Please! Ener num2: "
str3: .asciiz"The Result is: "

.text
main:

li $v0,4    #string display
la $a0,str
syscall

li $v0,4
la $a0,str1
syscall

li $v0,6
syscall
mov.s $f1,$f0

li $v0,4
la $a0,str2
syscall

li $v0,6
syscall
mov.s $f2,$f0

mul.s $f3,$f1,$f2

li $v0,4    #string display
la $a0,str3
syscall

li $v0,2
mov.s $f12,$f3
syscall

li $v0,10
syscall