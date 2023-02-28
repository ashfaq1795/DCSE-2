`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:44 05/28/2022 
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
module Top_Level(seg,clk_100Mhz,reset,enable); //these are the only I/O which we connect with circuit.
input clk_100Mhz,reset;  //as for these inputs values are given from circuit so they are define as input.
output [6:0]seg;    //to seg and enable we assign values so they are define as output.
output [2:0] enable;
wire [3:0] out,U,T,H;
wire clk_5Mhz;

clk_divider cd(clk_5Mhz,clk_100Mhz,reset);
U_T_H_counting UTH(U,T,H,reset,clk_5Mhz);
Led_multiplexing LM(out,enable,clk_100Mhz,reset,U,T,H);
led_segment ls(seg,out);

endmodule

module clk_divider(clk_5Mhz,clk_100Mhz,reset);
input clk_100Mhz,reset;
output clk_5Mhz;  //here we assign value
reg clk_5Mhz;
reg [23:0]c;    //24 bits is the size of 10Mhz.
always @(posedge clk_100Mhz)
       if(reset)
		 begin
				c=0;
				clk_5Mhz=0;
		 end
		 else
		 begin
				c=c+1'b1;
				if(c==10000000)
				begin
					  clk_5Mhz=~clk_5Mhz;
					  c=0;
				end 
		 end
endmodule


module U_T_H_counting(U,T,H,reset,clk_5Mhz);
input reset,clk_5Mhz; 
output reg [3:0] U,T,H;


always @(posedge clk_5Mhz)
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

module Led_multiplexing(out,enable,clk_100Mhz,reset,U,T,H);
input clk_100Mhz,reset;
input [3:0] U,T,H;
output reg [2:0] enable;
output reg [3:0] out;
reg [13:0] delay;
always @(posedge clk_100Mhz)
 if(reset)
 begin
	 enable=3'b000;
	 out=0;
	 delay=0;
 end
 else
 begin
	 if(delay<10000)
	 delay=delay+1'b1;
	 else
	 begin
		 delay=0;
		 if(enable==3'b000 || enable==3'b011)
		 begin
			 enable=3'b110;
			 out=U;
		 end
		 else if(enable==3'b110)
		 begin
			 enable=3'b101;
			 out=T;
		 end
		 else if(enable==3'b101)
		 begin
			 enable=3'b011;
			 out=H;
		 end
	 end
 end
endmodule


module led_segment(seg,out);
input [3:0]out;
output [6:0] seg;
parameter [6:0] zero=7'b1000000,one=7'b1111001,two=7'b0100100,
three=7'b0110000,four=7'b0011001,five=7'b0010010,six=7'b0000010,
seven=7'b1111000,eight=7'b0000000,nine=7'b0010000;
assign seg=(out==4'd0)? zero   :
			  (out==4'd1)? one    :
			  (out==4'd2)? two    :
			  (out==4'd3)? three  :
			  (out==4'd4)? four   :
			  (out==4'd5)? five   :
			  (out==4'd6)? six    :
			  (out==4'd7)? seven  :
			  (out==4'd8)? eight  : 	
			  (out==4'd9)? nine   : 7'b1111111;     
endmodule

//sensitivity of reset and clock should be same in each module.     	  
		 
		 
		 
			  
		 
