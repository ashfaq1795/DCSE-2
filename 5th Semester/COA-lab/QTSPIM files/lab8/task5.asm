.data
str:  .asciiz"***************** GPA CALCULATOR *******************\n\n"
str1:  .asciiz"Name: Ashfaq Ahmad \nReg No: 19pwcse1795\n\n"
str2: .asciiz"Please! Enter GPA in Subject 1: "
str3: .asciiz"\nPlease! Enter GPA in Subject 2: "
str4: .asciiz"\nPlease! Enter GPA in Subject 3: "
str5: .asciiz"\nPlease! Enter GPA in Subject 4: "
str6: .asciiz"Please! Enter Credit Hours: "
str7: .asciiz"\n\nYour GPA in 4 subjects is: "

.text
main:
li $v0,4    #string display
la $a0,str
syscall

li $v0,4    #string display
la $a0,str1
syscall

li $v0,4    #string display
la $a0,str2
syscall

li $v0,6    #for putting gpa subject 1
syscall
mov.s $f1,$f0

li $v0,4    #string display
la $a0,str6
syscall

li $v0,6    #for putting credit hour subject 1
syscall
mov.s $f2,$f0

li $v0,4    #string display
la $a0,str3
syscall

li $v0,6    #for putting gpa subject 2
syscall
mov.s $f3,$f0

li $v0,4    #string display
la $a0,str6
syscall

li $v0,6    #for putting credit hour subjec 2
syscall
mov.s $f4,$f0

li $v0,4    #string display
la $a0,str4
syscall

li $v0,6    #for putting gpa  subject 3
syscall
mov.s $f5,$f0

li $v0,4    #string display
la $a0,str6
syscall

li $v0,6    #for putting credit hour subject 3
syscall
mov.s $f6,$f0

li $v0,4    #string display
la $a0,str5
syscall

li $v0,6    #for putting gpa  subject 4
syscall
mov.s $f7,$f0

li $v0,4    #string display
la $a0,str6
syscall

li $v0,6    #for putting credit hour subject 4
syscall
mov.s $f8,$f0

mul.s $f9,$f1,$f2   #credit hours * subject gpa
mul.s $f10,$f3,$f4
mul.s $f11,$f5,$f6
mul.s $f13,$f7,$f8

add.s $f14,$f9,$f10
add.s $f15,$f11,$f13
add.s $f16,$f14,$f15  # f16=sum of all CH*SGPA

add.s $f17,$f2,$f4
add.s $f18,$f6,$f8
add.s $f19,$f17,$f18    # f19=sum of all credit hour

div.s $f12,$f16,$f19  # sum of all CH*SGPA divided by sum of all credit hour.

li $v0,4    #string display
la $a0,str7
syscall

li $v0,2  #single precision number display on moniter screen.
syscall

li $v0,10
syscall





