.data
str1: .asciiz"\nPlease! Enter a number you want to flip its 10th bit: "
str2: .asciiz"After flipping the 10th bit become the number become: "

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

li $t1,512            #appropirate mask that we will XOR with input number and it will flip 10th bit only of input number.

xor $t2,$t0,$t1

bgt $t2,$t0 tranfer 
move $t3,$t2
j exit
transfer: 
sll $t6,$t1,21
xor $t3,$t0,$t6
exit:               

li $v0,1
move $a0,$t3
syscall

j main               #for jumping.

li $v0,10
syscall
