;generate a square wave (duty cycle 50%) of 10kHz at P1.5. use timer mode 2. the oscillator clock frequency is 18Mhz.


;oscillator clock frequency=18Mhz so timer's clock frequency=1.5MHz,   timer clock's time period=667ns.
;we will change oscialltor frequency menually.
;we need a signal of frequency 10khz   time period=1/10k=100us.
;so it will on for 50us and off for 50us.
;for 50us=50us/667ns=75 cycle required  to give 50 ms delay if oscillator frequency= 18Mhz.

org 0
mov TMOD,#02h   ;mode 2 timer 0
mov TH0,#0B9h   ;in timer mode 2 value loaded to THx register only at once. then it give a 
                ; copy to TLx register after each roll over
setb TR0        ;TR0 Started only at once.

delay: jnb TF0, delay         ;71 machine cycle (70 timer cycle (B9) + 1 roll over=71)     
clr TF0                       ;1 machine cycle
cpl P1.5                      ;1 machine cycle
sjmp delay                    ;2 machine cycle
end
;so we will put FF-B9=70 in regiter so tha total machine cycle=75 and it give 50 us delay if oscialltor F=18Mhz.
;for bigger delay we generate loop by putting value in register.