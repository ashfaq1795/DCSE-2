.text
main:
li $v0,5
syscall
move $t0,$v0

li $v0,5
syscall
move $t1,$v0

sub $t2,$t1,$t0
li $v0,10
syscall