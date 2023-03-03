.data
str1: .asciiz"please Enter the number:"
str2: .asciiz"The last digit of input number is:"

.text
main:

li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0

li $t1,10
div $t0,$t1  #if we divide by 10 last digit will alway reminder it will store in high register hi.

li $v0,4
la $a0,str2
syscall

li $v0,1
mfhi $a0     #we will move last digit or reminder to a0 register for display.
syscall

li $v0,10
syscall