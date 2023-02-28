`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:33 05/21/2022 
// Design Name: 
// Module Name:    Ring_counter_8bits 
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
module Ring_counter_8bits(count,clk_100Mhz,reset);
input clk_100Mhz,reset;
output [7:0]count;
reg [7:0]count;
clk_divider cd(clk_1Mhz,clk_100Mhz,reset);
always @(posedge clk_1Mhz or negedge reset) //we can also keep clk for sensitivity only.
begin
        if(~reset)
		           count<=8'b10000000;
		  else
		  begin
		           count<=count<<1;  //unblocking assignments. in blocking case counter print 0 continusly.
					  count[0]<=count[7];
        end
end
endmodule


module clk_divider(clk_1Mhz,clk_100Mhz,reset);
input clk_100Mhz,reset;
output reg clk_1Mhz;
reg [26:0]c;  //10Mhz=27 bits..
always @(negedge clk_100Mhz)
begin
     if(~reset)
	  begin
	       c=0;
			 clk_1Mhz=1'b1;
//we equate clk_1Mhz to 1 in reset so to run always block of counter also to become reset.
     end
	  else
	      begin
	      c=c+1'b1;
	      if(c==50000000)
	          begin
	          clk_1Mhz=~clk_1Mhz;
			    c=0;
	          end
	      end
end
endmodule






