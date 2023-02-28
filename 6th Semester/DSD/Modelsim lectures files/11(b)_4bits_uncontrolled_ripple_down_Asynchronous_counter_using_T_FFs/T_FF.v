module T_FF(Q,En,T,reset);  
input En,T,reset;           //for ripple counter T input permenently equal to 1.
output Q;
reg Q; 
always @(negedge En or posedge reset) //en is a clock. circuit is Asynchronous.
begin  
    if(reset)
    	Q=1'b0;
    begin
    if(T)
    	Q=~Q; 
    else
    	Q=Q;
    end
end
endmodule 

//if we equate T=0 it will pause counting. but don't loss previous counting. if again we equate T=1 then count will start from that point where it
//stopped rather than start from 0.

