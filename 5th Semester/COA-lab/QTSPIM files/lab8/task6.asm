.data
str:  .asciiz"Name: Ashfaq Ahmad \nReg No: 19pwcse1795\n"
str1: .asciiz"\n\nPlease Enter Num1: "
str2: .asciiz"please Enter Num2: "
str3: .asciiz"Please Enter an operator:"
str4: .asciiz"\nThe sum is: "
str5: .asciiz"\nThe subtraction is: "
str6: .asciiz"\nThe multiplication is: "
str7: .asciiz"\nThe division is: "

.text
main:

li $v0,4     #print string
la $a0,str
syscall

loop:

li $v0,4      #print string
la $a0,str1
syscall

li $v0,7      #7 for input doubble precision
syscall
mov.d $f2,$f0

li $v0,4      #print string
la $a0,str2
syscall


li $v0,7      # 7 for input doubble precision
syscall
mov.d $f4,$f0

li $v0,4      #print string
la $a0,str3
syscall

li $v0,12    # 12 input ascci
syscall
move $t1,$v0

li $t2,43   #  + operator
li $t3,45   # - operator
li $t4,42   # * operator
li $t5,47   # / operator

beq $t1,$t2, addition
beq $t1,$t3, subtraction
beq $t1,$t4, multiplication
beq $t1,$t5, division

addition:
         add.d $f12,$f2,$f4
         li $v0,4	
         la $a0,str4
         syscall
         li $v0,3        # 3 for doubbble result display.
         syscall
j exit
subtraction:
         sub.d $f12,$f2,$f4
         li $v0,4	
         la $a0,str5
         syscall
         li $v0,3        # 3 for doubbble result display.
         #mov.d $f6,$f6
         syscall
j exit
multiplication:
         mul.d $f12,$f2,$f4
         li $v0,4	
         la $a0,str6
         syscall
         li $v0,3        # 3 for doubbble result display.
         #mov.d $f6,$f6
         syscall
j exit
division:
         div.d $f12,$f2,$f4
         li $v0,4	
         la $a0,str7
         syscall
         li $v0,3       # 3 for doubbble result display. 
         #mov.d $f12,$f6
         syscall
exit:

j loop

li $v0,10
syscall
