.data
str1: .asciiz"please! Enter a number: "
str2: .asciiz"The result is complement of 10th bit: "

.text
main:

li $v0,4
la $a0,str1
syscall

li,$v0,5
syscall
move $t0,$v0



li $v0,4
la $a0,str2
syscall

sll $a0,$t0,21        #Algorithem 1
srl $a0,$a0,31

andi $a0, $t0, 1024   #Algorithem 2  both algorithems have same function (give us same result)
srl $a0, $a0, 10



li $v0,1
syscall

li $v0,10
syscall
