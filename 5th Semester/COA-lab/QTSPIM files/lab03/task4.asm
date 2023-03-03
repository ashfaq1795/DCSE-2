.data
str1: .asciiz "Please! Enter Num1: "     
str2: .asciiz "Please! Enter Num2: "
str3: .asciiz "Answer is: "
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

mult $t0,$t1  #it will multiply t0 and t1 and store it in high and low register
              #if we want to store result In any other register it will give us error.
li $v0,4      
la $a0,str3
syscall
li $v0,1      #request for displaying data in a0 register
mflo $a0     #it move output of mult to a0 register        
syscall
li $v0,10
syscall