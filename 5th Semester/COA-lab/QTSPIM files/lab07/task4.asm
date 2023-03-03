.data
str:  .asciiz "Name: Ashfaq Ahmad\n Reg No: 19pwcse1795\n"
str1: .asciiz "please! Enter first No:"
str2: .asciiz "Please! Enter 2nd No:"
str3: .asciiz "All prime Numbers between first and 2nd input excluding these two inputs: "
str4: .asciiz "  "

.text
main:

li $v0,4     #name reg no
la $a0,str
syscall

li $v0,4       #first input string
la $a0,str1
syscall

li $v0,5     #first input
syscall
move $t0,$v0

li $v0,4     #2nd input string
la $a0,str2
syscall

li $v0,5      #first input
syscall
move $t1,$v0
addi $t0,$t0,1   #increment lower bond by 1. 

li $v0,4      #output string
la $a0,str3
syscall


li $s4,1  #for comperison of counter s3.
li $s5,0  # for checking reminder.

exit6:  #this loop continue until t0 reached t1.
bgt $t1,$t0  greater
j exit1

greater:
li $s0,1  #diviser start from 1
li $s3,0  #counting veriable
        exit4:     #this loop will divide a number t0 on s0 from 1 to upto t0 and will count the 0 remender.
                   #it also incriment s0 upto t0.         
        bgt $t0,$s0 greater1 #if condition true then go and perform division
	j exit2              #if not then jump out from division.
	greater1:
		div $t0,$s0
		mfhi $s1     #move reminder to s1 for comperison.
		beq $s1,$s5  equal  #if reminder equal to 0 then incriment count and then diviser s0.
		j exit3      #else incriment diviser only.
		equal:
	        addi $s3,$s3,1
	        exit3:
		addi $s0,$s0,1
	j exit4                  
        exit2:
               beq $s3,$s4  prime
               j exit5       #if this condition not true its mean its not a prime so no need to display and jump to exit5.
               prime:
               li $v0,1      #display prime no.
               move $a0,$t0
               syscall
               li $v0,4      #display space between prime numbers.
               la $a0,str4
               syscall
               exit5:						  
addi $t0,$t0,1  #incriment t0
j exit6
								
exit1:

li $v0,10
syscall
				
				
				