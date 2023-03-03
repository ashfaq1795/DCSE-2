.data
str1: .asciiz"Enter first NO:"
str2: .asciiz"Enter second NO:"
str3: .asciiz"AND:"
str4: .asciiz"\nOR:"
str5: .asciiz"\nNOR:"
str6: .asciiz"\nXOR:"
str7: .asciiz"\nAndi:"
str8: .asciiz"\nXori:"
str9: .asciiz"\nOri:"
str10: .asciiz"\nShift left:"
str11: .asciiz"\nShift Right:"
str12: .asciiz"\nShift Right arithm:"
str13: .asciiz"\nShift left by var:"
str14: .asciiz"\nShift Right by var:"
str15: .asciiz"\nShift Right arithm by var:"
.text
main:
li $v0,4        #system call for string print
la $a0,str1     #load address of string to a0 for print
syscall         #print string
li $v0,5        #system call for user input.
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

and $t2,$t1,$t0
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str4
syscall

or $t2,$t1,$t0
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str5
syscall

nor $t2,$t1,$t0
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str6
syscall

xor $t2,$t1,$t0
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str7
syscall

andi $t2,$t0,7
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str8
syscall

xori $t2,$t0,7
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str9
syscall

ori $t2,$t0,7
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str10
syscall

sll $t2,$t0,2
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str11
syscall

srl $t2,$t0,2
move $a0,$t2
li $v0,1
syscall


li $v0,4
la $a0,str12
syscall

sra $t2,$t0,2
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str13
syscall

sllv $t2,$t0,$t1
move $a0,$t2
li $v0,1
syscall


li $v0,4
la $a0,str14
syscall

srlv $t2,$t0,$t1
move $a0,$t2
li $v0,1
syscall

li $v0,4
la $a0,str15
syscall

srav $t2,$t0,$t1
move $a0,$t2
li $v0,1
syscall

li $v0,10   #program termination
syscall