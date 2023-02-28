;2nd method of task1.........
org 0     ;start at address 0
START:
    clr p1.1   ;p1.1=0   clr command will store in address 0.
	acall DELAY  ;call delay
	setb p1.1     ;p1.1=1
	acall DELAY  ;call delay
	sjmp START   ;jump to start
DELAY:           ;delay subroutine
    mov r1,#8   ; move 4 to r1   here delay 8 millisecond.. for  LED off
AGAIN:           
    mov r2,#250 
HERE:
    nop          ;no operation
	nop 
	djnz r2,HERE  ;if r2!=0 jump to HERE
	djnz r1,AGAIN  ;if r1!=0 jump to AGAIN
	jnb p1.1,RETURN  ;if p1.1=0 jump to return	
	mov r1,#4      ;incase of LED on 4 millisecond more dely. total=12 ms
LOOP:
    mov r2,#250   
GO: 
    nop
	nop
	djnz r2,GO
	djnz r1,LOOP
RETURN:
    ret   ;return from delay subroutine

end      ;end of program
	