.data
str1: .asciiz"Please! Enter First NO:"
str2: .asciiz"Please! Enter second NO:"
str3: .asciiz"Please! Enter 1 for addition or 2 for subtraction:" 
str4: .asciiz"The Result is: "
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

li $v0,5
syscall
move $t1,$v0

li $v0,4
la $a0,str3
syscall

li $v0,5
syscall
move $t3,$v0

li $t4,1
beq $t4,$t3 addationlabel  #(branch_if_equal_to) if t4 and t3 equal it will perform addition.
                           #we can also manage this task using bgt but beq is more suitable 
sub $t5,$t0,$t1
j exit
addationlabel: add $t5,$t0,$t1
exit:

li $v0,4
la $a0,str4
syscall
li $v0,1
move $a0,$t5
syscall

li  $v0,10
syscall

