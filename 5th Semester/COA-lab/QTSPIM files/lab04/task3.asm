.data
str1: .asciiz"Please! Enter an integer of 7 bit:"    #each register store integer in the form of 8 bit.i,e 3=00000011
str2: .asciiz"The 7th bit of input integer is: "

.text
main:
li $v0,4
la $a0,str1
syscall

li $v0,5
syscall
move $t0,$v0

li $t1,0             
li $t2,1            #if condition true we will display t1 otherwise we will display t2. 

li $t3,64           #we will "and" input number t0 with 7 bit integer 64.
and $t4,$t0,$t3     #we can't put 128 here directly.

beq $t4,$t1 label   #branch_if_equal i,e it compare t4 and t1 if they are equal then label statement will execute.
move $t5,$t2        #we can't move t2 to a0 here directly.  
j exit
label: move $t5,$t1 #we can also move t4 to t5 instead of t1 because if conditon of beq true t4 will contain 0.
exit:

li $v0,4
la $a0,str2
syscall

li $v0,1
move $a0,$t5
syscall

li $v0,10
syscall

