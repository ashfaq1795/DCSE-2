module digital_lock(openlock,alarm,code,reset,clk);   //non-overlapping 010 pattern detector
input code,clk,reset;
output reg openlock,alarm;
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg[1:0] p_state,n_state;
always @(posedge clk,reset)
if(reset)
        p_state=s0;
else
       p_state=n_state;
always @(*)                   //we can also use one always block then no need of n_state register (see rehmat sir solution). 
         case(p_state)
         s0:
            begin
                 openlock=0;
                 alarm=1;
                 n_state=code?s0:s1;                
            end
         s1:
            begin
                 openlock=0;
                 alarm=0;
                 n_state=code?s2:s0;                
            end
         s2:
            begin
                 openlock=0;
                 alarm=0;
                 n_state=code?s0:s3;                 
            end 
         s3:
            begin
                 openlock=1;
                 alarm=0;
                 n_state=code?s0:s1;
            end
         default:
           begin
                 openlock=0;
                 alarm=0;
                 n_state=s0;
           end
        endcase

endmodule      

