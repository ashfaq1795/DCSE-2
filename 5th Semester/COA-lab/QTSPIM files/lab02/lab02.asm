.text
main:
    li $t6,4
    li $t5,3
    li $t4,2
    li $t3,1
    add $t8,$t6,$t5
    add $t1,$t4,$t3
    add $t7,$t8,$t3
    li  $v0,10
    syscall 