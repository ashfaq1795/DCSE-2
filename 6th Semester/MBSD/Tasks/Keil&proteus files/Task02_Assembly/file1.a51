org 0
	
start:
setb p1.2
setb p1.1
acall DELAY1
clr p1.2
acall DELAY1
jnb p1.1,AAA
sjmp start
DELAY1:	
	mov r1,#2
loop1:
     MOV r2,#250
loop2:
     nop 
	 nop
	 djnz r2,loop2
	 djnz r1,loop1
	 jb p1.2,return
	 mov r1,#1
loop3:
     MOV r2,#250
loop4:
     nop 
	 nop
	 djnz r2,loop4
	 djnz r1,loop3
return:
     ret 

AAA:
DELAY2:
mov r1,#4
loop5:
     MOV r2,#250
loop6:
     nop 
	 nop
	 djnz r2,loop6
	 djnz r1,loop5
	 jnb p1.2,return1
	 mov r1,#2
loop7:
     MOV r2,#250
loop8:
     nop 
	 nop
	 djnz r2,loop8
	 djnz r1,loop7
return1:
     ret
end
	