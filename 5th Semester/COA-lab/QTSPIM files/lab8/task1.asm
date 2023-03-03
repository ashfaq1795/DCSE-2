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

repeat:   #loop

li $v0,4
la $a0,str1
syscall

li $v0,6   # 6 for input in single precision floating case. while 7 in double case.
syscall
mov.s $f1,$f0  #by default every input store in f0 like a0 in integer case.

li $v0,4
la $a0,str2
syscall

li $v0,6
syscall
mov.s $f2,$f0

add.s $f3,$f1,$f2

li $v0,4
la $a0,str3
syscall

li $v0,2   # for displaying single precision floating number on screen. while for double 3 is used.
mov.s $f12,$f3  #we will move our floating number to f12.
syscall

j repeat

li $v0,10
syscall

#here we can use all floating registers.