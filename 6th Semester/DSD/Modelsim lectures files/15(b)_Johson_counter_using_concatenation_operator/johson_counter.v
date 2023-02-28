module JC_6bits(count,clk,clear);          //we can also make it using D_FFs.
input clk,clear;
output [5:0]count;
reg [5:0] count;  

always @(posedge clk)       //sequential circuit.
if(clear)
  count=6'b000000;
else
   count={~count[0],count[5:1]};  //cancatenation operator.
  
endmodule


