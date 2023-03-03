.data
str:  .asciiz"Name: Ashfaq Ahmad\nReg No: 19pwcse1795"
str1: .asciiz"\nPlease Enter the size of febuccani Series:"
str2: .asciiz"The Series is:"
str3: .asciiz" "

.text
main:

li $v0,4
la $a0,str
syscall

li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,str2
syscall

li $t1,0
li $t2,1
li $t3,0


exit2:
bgt $t0,$t3 febuc
j exit1
febuc:
     li $v0,1
     move $a0,$t1
     syscall
     li $v0,4
     la $a0,str3
     syscall
     add $t4,$t1,$t2
     add $t1,$t2,$0
     add $t2,$t4,$0
     addi $t3,$t3,1
j exit2
exit1:

li $v0,10
syscall

