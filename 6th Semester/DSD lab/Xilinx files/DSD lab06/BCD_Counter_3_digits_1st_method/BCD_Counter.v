`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:39:14 05/20/2022 
// Design Name: 
// Module Name:    BCD_Counter 
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
module BCD_Counter(seg,en,reset,clk);  //BCD 4 bit counter (0 to 9);
input reset,clk;  //these are declare as input becuase it take values from circuit
output [6:0]seg;
wire clk_1MHz;
output [2:0] en;  //seg and en declare as output because we assign value to it.
reg [3:0] U,T,H; //inside always block values assigned to these veriables so defined as reg.

clk_divider cd(clk_1MHz,clk,reset);
seven_seg_Dec s1(seg,clk,U,T,H,en,reset);
always @(posedge clk_1MHz)
       if(reset)
		 begin
			 U=0; 
			 T=0;
			 H=0;
		 end
		 else
		 begin
			 U=U+1'b1;
			 if(U==10)
			 begin
				U=0;
				T=T+1'b1;
				if(T==10)
				begin 
					T=0;
					H=H+1'b1;
					if(H==10)
					begin
						U=0;
						T=0;
						H=0;
					end
				end
			end
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
	
module  seven_seg_Dec(seg,clk,U,T,H,en,reset); //decoder and Multiplexing module. 
input [3:0]U,T,H;
output wire [6:0]seg;
input reset,clk;
output reg [2:0] en;
reg [3:0]in;  //it is used in always block and values assign to it so it's a reg
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
			  
reg [12:0] delay;

always @(posedge clk)
begin  //this Multiplexing occure so fast that we can't detect any led off. 
	if(reset)
	begin
		en=3'b000;
		in=0;  //in this case all LEDs set to 0. here inputs are common to all leds. 
		delay = 0;
	end
	else
	begin
		if(delay<6000)
		delay = delay + 1'b1;
		else
		begin  //multiplexing starts from here.
			delay = 0;
			if(en==3'b000 || en==3'b011)
			begin
				en=3'b110;
				in=U;
			end
			else if(en==3'b110)
			begin
				en=3'b101;
				in=T;
			end
			else if(en==3'b101)
			begin
				en=3'b011;
				in=H;
			end
		end
	end
end	  		 
endmodule









		 
		            
