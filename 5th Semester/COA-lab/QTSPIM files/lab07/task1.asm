.data
str: .asciiz"Name: Ashfaq Ahmad\nReg No: 19pwcse1795" 
str1: .asciiz"\nPlease Enter a Number:"
str2: .asciiz"The Factorial of input Number is:"


.text
main:

li $v0,4
la $a0,str
syscall

again:

li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0

beq $t0,$0 abc   #this condition for zero input.
j exit1
abc:
    addi $t0,1  #we will add 1 with zero. it will give 1 factorial.
exit1: 

li $t2,1
add $t3,$t0,$0    #move input number to $t3.

li $v0,4
la $a0,str2
syscall

exit2:
sub $t0,$t0,$t2      #subtract 1 from input in each step.
bgt $t0,$t2   fact   #subtract 1 from input until it reach to 1 itself.
j exit3              #condition false jump out from loop.
fact: 
     mul $t3,$t3,$t0      #multiply result of iteration stored in $t3 with decrement of $t0 in each iteration.
     j exit2

exit3:

li $v0,1
move $a0,$t3
syscall

j again

li $v0,10
syscall
