.data
str1: .asciiz"The Right Shift is: "
str2: .asciiz"\nThe left Shift is: "
.text
main: #---------------------
addi $t0, $0, 60
li $v0,4
la $a0,str1
syscall
srl $a0, $t0, 2        # a0 = t0 shifted right once
li $v0,1
syscall

li $v0,4
la $a0,str2
syscall
sll $a0, $t0, 2        # a0 = t0 shifted left once
li $v0,1
syscall
#---------------------
fini: jr $ra
