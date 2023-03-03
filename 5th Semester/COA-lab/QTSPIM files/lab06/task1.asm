.data
str: .asciiz"Name: Ashfaq Ahmad\nReg No: 19pwcse1795"
str1: .asciiz"\n\nplease enter any alphabit:"
str2: .asciiz"\nNow The capaital form of input Alphabit is: "

.text
main:
li $v0,4
la $a0,str
syscall

kh:
li $v0,4
la $a0,str1
syscall

li $v0,12     #for ascii input
syscall
move $t0,$v0

li $v0,4
la $a0,str2
syscall

addi $t1,$t0,-32
move $a0,$t1

li $v0,11
syscall

b kh

li $v0,10
syscall
