.data
str1: .asciiz"please enter num x: "
str2: .asciiz"the result in the form 18x: "
.text
main:
li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0

sll $t1,$t0,4 		#its mean we multiply t0 by 2^4=16
sll $t2,$t0,1 		#its mean we multiply t0 by 2^1=2
add $t3,$t1,$t2         #we will add t0 t1 it will be equal to 18*x
li $v0,4
la $a0,str2
syscall

li $v0,1
move $a0,$t3
syscall

li $v0,10
syscall