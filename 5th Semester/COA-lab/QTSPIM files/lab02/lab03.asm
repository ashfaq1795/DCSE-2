.text
main:
li $v0,5     # when v0 contain 5 its mean it ask something from user
syscall
move $t0,$v0

li $v0,5
syscall
move $t1,$v0

add $t2,$t0,$t1
li $v0,10
syscall