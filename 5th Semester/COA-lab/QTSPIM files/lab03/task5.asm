.data
str1: .asciiz "Please! Enter Num1: "     
str2: .asciiz "Please! Enter Num2: "
str3: .asciiz "Qoutient is: "
str4: .asciiz "\nRemender is: "
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

div $t0,$t1   #it will multiply t0 and t1 and store remender in high regester and Quotient in low register.
              #we can also write it like div $t2,$t1,$t0. but in this cse only Quotient stored in $t2.
li $v0,4      
la $a0,str3
syscall
li $v0,1      #request for displaying data in a0 register
mflo $a0      #it move output of mult to a0 register        
syscall
li $v0,4
la $a0,str4
syscall
li $v0,1     
mfhi $a0           
syscall
li $v0,10
syscall