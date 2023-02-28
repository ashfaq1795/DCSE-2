org 000h

start:
 
Mov P2,#3FH
acall delay

Mov P2,#06H
acall delay

Mov P2,#5BH
acall delay

Mov P2,#4FH
acall delay

Mov P2,#66H
acall delay

Mov P2,#6DH
acall delay

Mov P2,#7DH
acall delay

Mov P2,#07H
acall delay

Mov P2,#7FH
acall delay

Mov P2,#6FH
acall delay

sjmp start


delay:
Mov R1,#250
loop1:
Mov R2,#250
loop2:
    NOP
	NOP
	DJNZ R2,loop2
	DJNZ R1,loop1
ret
end