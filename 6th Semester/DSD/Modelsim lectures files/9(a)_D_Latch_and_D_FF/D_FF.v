module D_FF(Q,En,D);  //note: all sequential circuit we design in behaviour level.
input En,D; //we can also take an reset input.
output Q;
reg Q;
always @(posedge En)  //synchronous circuit. becuase depend only clcok. En is clock.
   Q=D; //inside always block we can't use "assign" keyword. so we must declare Q as a reg.
   
   //this FF is positive edge trigger D_FF. we can also make negedge.
endmodule
