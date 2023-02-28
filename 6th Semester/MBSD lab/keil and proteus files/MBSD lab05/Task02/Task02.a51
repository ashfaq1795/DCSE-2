org 000h
start:
	MOV A,#0
	mov R1,#10
TEN:
	mov R2,#10
UNIT1:
	MOV P2,A
	ADD A,#1
	acall DELAY
	DJNZ R2,UNIT1
	ADD A,#6     ;After each 10 digit add 6 to converthex to decimal
	DJNZ R1,TEN
LJMP start

DELAY:
 MOV R4,#255
AGAIN:
 MOV R5,#255
HERE:
 NOP
 NOP
 DJNZ R5,HERE
 DJNZ R4,AGAIN
 RET
 
END