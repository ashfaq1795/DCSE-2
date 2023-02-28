module D_FF(Q,clk,reset,D);  //note: all sequential circuit we design in behaviour level.
input D,clk,reset;
output Q;
reg Q;
always @(posedge clk)  //synchronous circuit. becuase depend only clcok. 
       if(reset)
       	    Q=1'b0;
       else
            Q=D; //inside always block we can't use "assign" keyword. so we must declare Q as a reg.
   
   //this FF is positive edge trigger D_FF. we can also make negedge.
endmodule
 
