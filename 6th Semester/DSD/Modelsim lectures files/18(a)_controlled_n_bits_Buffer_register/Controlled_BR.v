module CBR_8bits(out,Din,clk,load);
input clk,load;
input [7:0]Din;
output reg[7:0]out;
always @(negedge clk)
   if(load)                //it is controlled by load input.
   out=Din;
endmodule

//in case of Uncontrolled Buffer register there is no load input to controll in/out.
//the rest part of code is correct for UBR also.