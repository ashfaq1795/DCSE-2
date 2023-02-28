;generate a square wave at P1.5 having pulse time period 200 us using timer mode 1. the oscillator clock frequency is 12Mhz.



;external oscillator=12Mhz,   clock frequency=1Mhz, clock Time period=1us
;so for 200us=200us/1us=200 clock cycle require for 200us delay.

 org 0
 mov TMOD,#01    ;mode 1 timer 0
 setb TR0
 start:
 mov TH0,#0FFh         ;2 machine cycle
 mov TL0,#40h          ;2 machine cycle
 loop: jnb TF0,loop    ;192 machine cycle  (191 clock cycle + 1 roll over cycle).
 cpl P1.5              ;1 machine cycle
 clr TF0               ;1 Machine cycle
 sjmp start            ;2 machine cycle
 end
  
 ;we will put FFFF-191=FF40 so that total clock cycle equal to 200 and it will give 200 us delay.
 ;this is not whole program execution time. it is just delay duration of wave.