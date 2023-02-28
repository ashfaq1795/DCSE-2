module JC_4bits(count,clk,clear);          //we can also make it using D_FFs.
input clk,clear;
output [3:0]count;
reg [3:0] count; 


//as in behaviour modeling the veriable to which we assign value will declare as reg while in data flow level value assign to wire.
//the veriable to which we assign value either in data flow or  in behavior will declare is output and the veriable
//to which we don't assign value will declare as input. here we assign value to count so it is output and then reg.


parameter [3:0] A=4'b0000, B=4'b1000, C=4'b1100, D=4'b1110, E=4'b1111, F=4'b0111, G=4'b0011, H=4'b0001;
always @(posedge clk)       //sequential circuit.
if(~clear)
  count=A;
else
  case(count)
  A : count=B;
  B : count=C;
  C : count=D;
  D : count=E;
  E : count=F;
  F : count=G;
  G : count=H;
  H : count=A;
  default : count=C;
  endcase
endmodule

//as for 4 bits 16 different states possible but here only 8 are used. if a circuit contain initial state non of the above cases 
//in such case default statment will execute and onward there will be no issue. above pettern will be followed.
//initially we know count is register so it will contain xxxx. if clear!=0 in this case default case will be executed. 
