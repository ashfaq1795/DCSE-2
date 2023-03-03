.text
main:
    li $t0,1   #li stand for load immediate. $ sign represent register
    li $t1,3
    li $t7,7
    li $v0,10  #v0 will contain any value.when it contain 10 its mean program terminate.
    syscall