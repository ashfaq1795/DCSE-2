.data
str: .asciiz"Name: Ashfaq Ahmad\nReg No: 19pwcse1795"
str1: .asciiz"\n\nPlease Enter num1:"
str2: .asciiz"Please Enter num2:"
str3: .asciiz"Please enter any operator:"
str4: .asciiz"\nThe Sum is: "
str5: .asciiz"\nThe Subtraction is: "
str6: .asciiz"\nThe Product is: "
str7: .asciiz"\nThe Quotient is: "
str8: .asciiz"\nThe Remender is: "

.text
main:
li $v0,4     #introduction display
la $a0,str
syscall

z:

li $v0,4     #system call for string display
la $a0,str1
syscall

li $v0,5     #first input
syscall
move $t0,$v0

li $v0,4
la $a0,str2
syscall

li $v0,5     #2nd input
syscall
move $t1,$v0


li $v0,4
la $a0,str3
syscall

li $v0,12    #when v0 contain 12 then it will take ascii code.
syscall
move $t2,$v0

li $s0,43    #addition operator code in decimal
li $s1,45    #Subtraction operator code in decimal
li $s2,42    #Multiplication operator code in decimal
li $s3,47    #Division operator code in decimal

beq $s0,$t2 addlabel
j exit
addlabel: 
      li $v0,4
      la $a0,str4
      syscall
      add $t3,$t0,$t1
      
      li $v0,1
      move $a0,$t3
      syscall 
exit:

beq $s1,$t2 sublabel
j exit1 
sublabel: 
      li $v0,4
      la $a0,str5
      syscall
      sub $t3,$t0,$t1

      li $v0,1
      move $a0,$t3
      syscall
exit1:


beq $s2,$t2 mullabel 
j exit2
mullabel:
      li $v0,4
      la $a0,str6
      syscall
      mul $t3,$t0,$t1

      li $v0,1
      move $a0,$t3
      syscall
exit2:
 
beq $s3,$t2 divlabel
j exit3
divlabel:
      div $t0,$t1
      li $v0,4
      la $a0,str7
      syscall
      li $v0,1
      mflo $a0
      syscall
  
      li $v0,4
      la $a0,str8
      syscall
      li $v0,1
      mfhi $a0
      syscall
exit3:

b z

li $v0,10
syscall



