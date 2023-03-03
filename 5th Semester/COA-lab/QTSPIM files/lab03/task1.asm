.data
str1: .asciiz "Enter First No: "
str2: .asciiz "Please! Enter Second No: "
str3: .asciiz "Sum of First and Second No is : "

.text
main:

li $v0,4      #when v0 contain it will system call for  string display
la $a0,str1   #la mean load address we load address of string 1
syscall       #system call for displaying string 1
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,str1
syscall
li $v0,5
syscall
move $t1,$v0

add $t2,$t0,$t1

li $v0,4
la $a0,str3
syscall
li $v0,1
move $a0,$t2
syscall
li $v0,10
syscall
