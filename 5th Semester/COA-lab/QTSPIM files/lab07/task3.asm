.data
str: .asciiz "Name:Ashfaq Ahmad\nReg No:19pwcse1795\n"
str1: .asciiz "Please enter a number: "
str2: .asciiz "The Factors of input no is: "
str3: .asciiz " "

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

li $t1,1

exit3: 
bgt $t0,$t1 check
j exit1
check: 
      div $t0,$t1
      mfhi $t2
      beq $t2,$0 factor
      j exit2
      factor:
             li $v0,1
             move $a0,$t1
             syscall
            
             li $v0,4
             la $a0,str3
             syscall
      exit2:
      addi $t1,$t1,1     
j exit3               	

exit1:
li $v0,1
move $a0,$t0
syscall

li $v0,10
syscall




