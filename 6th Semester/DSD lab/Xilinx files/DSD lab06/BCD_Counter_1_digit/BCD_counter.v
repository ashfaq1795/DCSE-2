`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:58 05/29/2022 
// Design Name: 
// Module Name:    BCD_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BCD_Counter(seg,en,reset,clk);  //BCD 1 digit counter 
input reset,clk;
output [6:0]seg;
reg [3:0] out;
wire clk_1MHz;
output [2:0] en;
assign en=3'b110; //we can also on remaining 2 LEDs. same digit will display on other two LEDsdue to common inputs.

clk_divider cd(clk_1MHz,clk,reset);
seven_seg_Dec s1(seg,out);
always @(posedge clk_1MHz)
       if(reset)
			out=4'd0;
		 else
		 begin
			 out=out+1'b1;
			 if(out==4'd10)
				out=4'd0;
		 end
endmodule


module clk_divider(clk_1MHz,clk_100MHz,reset);
input clk_100MHz;
output clk_1MHz;
input reset;
reg[26:0]c;
reg clk_1MHz;
always @(posedge clk_100MHz)
begin
     if(reset)
	  begin
	  c=0;
	  clk_1MHz=1;
	  end
	  else
	  begin
	  c=c+1'b1;   
	  if(c==10000000)
	  begin
	  clk_1MHz=~clk_1MHz;
	  c=0;
	  end
	 end
end
endmodule
	
module  seven_seg_Dec(seg,in);
input [3:0]in;
output [6:0]seg;
assign seg=(in==4'b0000)? 7'b1000000:
           (in==4'b0001)? 7'b1111001:
			  (in==4'b0010)? 7'b0100100:
			  (in==4'b0011)? 7'b0110000:
			  (in==4'b0100)? 7'b0011001:
			  (in==4'b0101)? 7'b0010010:
			  (in==4'b0110)? 7'b0000010:
			  (in==4'b0111)? 7'b1111000:
			  (in==4'b1000)? 7'b0000000:
			  (in==4'b1001)? 7'b0010000:7'b1111111;		 
endmodule  


