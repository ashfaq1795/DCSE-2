org 0     ;start at address 0
START:
    setb p1.1   ;p1.1=1
	acall DELAY1  ;call delay
	clr p1.1     ;p1.1=0
	acall DELAY2  ;call delay
	sjmp START   ;jump to start
DELAY1:           ;delay subroutine
    mov r1,#12   ; move 4 to r1
AGAIN:           
    mov r2,#250 
HERE:
    nop          ;no operation
	nop 
	djnz r2,HERE  ;if r2!=0 jump to HERE
	djnz r1,AGAIN  ;if r1!=0 jump to AGAIN
	ret
	;jb p1.1,RETURN  ;if p1.1=1 jump to return
	
DELAY2:	
	mov r1,#8
LOOP:
    mov r2,#250
GO: 
    nop
	nop
	djnz r2,GO
	djnz r1,LOOP
;RETURN:
    ret   ;return from delay subroutine

end      ;end of program
	