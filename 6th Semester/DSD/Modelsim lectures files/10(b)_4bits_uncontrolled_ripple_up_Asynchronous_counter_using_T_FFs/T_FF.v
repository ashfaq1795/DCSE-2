module T_FF(Q,En,T,reset);  //we can also make this T FF from JK and D_FF.  
input En,T,reset;           //for ripple counter T input permenently equal to 1.
output Q;
reg Q; 
always @(negedge En or posedge reset) //en is aclock. circuit is Asynchronous.
begin  //as always block contain two if statement so we use begin and end. otherwise it give error.
    if(reset)
    Q=1'b0;
    if(T)
    Q=~Q; 
    else
    Q=Q;
end
endmodule 

//if always block contain if-else statement then no need of begin and end.
//if T=0 then it pause the count and don't loss previous count. when it become 1 again it start count from that position where it stopped.
//rather than start from 0.