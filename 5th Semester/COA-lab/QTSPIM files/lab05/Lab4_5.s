.data
str1: .asciiz"\nPlease! Enter a Number: "
str2: .asciiz"The Result is: "

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

li $t5,0xffff      #these three line for storing the mask no in t5 given in task 14 in binary form.  
sll $t5,$t5,16     #shifted left 16 times.
ori $t5,$t5,0xfbff

and $a0, $t0,$t5      

li $t6,1024        #2nd method for storing the mask no in t7 given in task 14 in binary form. 
nor $t7,$t6,$t6

and $a0, $t0,$t7                

li $v0,1
syscall

j main             #for jumping

li $v0,10
syscall