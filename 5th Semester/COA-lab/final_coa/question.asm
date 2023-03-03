.data
str: .asciiz"*"
str1: .asciiz"\t"

.text
main:
li $t0,5
li $t1,0
exit3:
bgt $t0,$t1 equal1
j exit
equal1:
exit2:
li $t2,0
bgt $t0,$t2 equal2
j exit1
li $v0,4
la $a0,str
syscall
li $v0,4
la $a0,str1
syscall
j exit2
exit1:
sub $t0,$t0,1
j exit3
exit:
li $v0,10
syscall
