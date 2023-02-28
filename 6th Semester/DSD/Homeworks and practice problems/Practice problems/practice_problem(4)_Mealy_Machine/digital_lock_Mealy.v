module digital_lock(openlock,alarm,code,reset,clk);   //non-overlapping 010 pattern detector     (Mealy Machine  non-overlapping)
input code,clk,reset;
output reg openlock,alarm;
parameter s0=2'b00,s1=2'b01,s2=2'b10;
reg[1:0] p_state,n_state;
always @(posedge clk,reset)
if(reset)
begin
        p_state<=s0;
        openlock<=0;  //if we don't assign both output openlock and alarm to zero, no problem
        alarm<=0;
end
else
       p_state=n_state;
always @(*)             //we can also use one always block then no need of n_state register (see rehmat sir solution).             
         case(p_state)
         s0:
            if(code)
            begin
                 openlock=0;
                 alarm=1;
                 n_state=s0;                 
            end
            else
            begin
                 openlock=0;
                 alarm=0;
                 n_state=s1;
            end
         s1:
            if(code)
            begin
                 openlock=0;
                 alarm=0;
                 n_state=s2;                 
            end
            else
            begin
                 openlock=0;
                 alarm=1;
                 n_state=s0;
            end
         s2:
            if(code)
            begin
                 openlock=0;
                 alarm=1;
                 n_state=s0;                 
            end
            else
            begin
                 openlock=1;
                 alarm=0;
                 n_state=s0;
            end
         default:
           begin
               n_state=s0;
               alarm=0;
               openlock=0;
           end
        endcase

endmodule  
