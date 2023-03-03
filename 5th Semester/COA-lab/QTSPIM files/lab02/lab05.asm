.text
main:
li $v0,5     #when we input data it store in v0.
syscall
move $t0,$v0 #we move data from a0 to register for the next input.

li $v0,5
syscall
move $t2,$v0

li $v0,5
syscall
move $t5,$v0

li $v0,5
syscall
move $t4,$v0

li $v0,5
syscall
move $t6,$v0

add $s1,$t6,$t4
add $s2,$s1,$t2
add $s3,$t5,$t0

sub $s7,$s2,$s3
#move $a0,$s7  # this movement is for displaying data on console window. if we donot move data to ao then data such data will not display on console window.

li $v0,1   # if v0 contain 1 it will display the data in register a0.if a0 is empty then by default 1 is assigned to a0 during runtime and displayed on console window. 
syscall
li $v0,10
syscall
