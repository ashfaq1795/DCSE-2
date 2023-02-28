module T_FF(Q,En,T,reset);  //note: all sequential circuit we design in behaviour level.
input En,T,reset;
output Q;
reg Q;
always @(negedge En or posedge reset)  //Asynchronous circuit. becuase depend on clcok and reset. En is clock.
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