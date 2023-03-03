.data
str: .asciiz"Name: Ashfaq Ahmad\nReg No: 19pwcse1795"
str1: .asciiz"\nPlease! Ener Temperature in  Centigrate: "
str2: .asciiz"The Temprature in Fehranheit is: "

#in case of doubble precision all even register is used from 2 to 30 for storing data.

.text
main:

li $v0,4    #string display
la $a0,str
syscall

repeat:

li $v0,4    #string display
la $a0,str1
syscall

li $v0,7   # 7 for inputing doubble precision floating number
syscall
mov.d $f2,$f0

li.d $f4,9.0
li.d $f6,5.0
li.d $f8,32.0

div.d $f10,$f4,$f6
mul.d $f14,$f2,$f10
add.d $f16,$f14,$f8

li $v0,4    #string display
la $a0,str2
syscall

li $v0,3         # 3 is used to display doubble precision floating number on moniter screen.
mov.d $f12,$f16
syscall

j repeat

li $v0,10
syscall

