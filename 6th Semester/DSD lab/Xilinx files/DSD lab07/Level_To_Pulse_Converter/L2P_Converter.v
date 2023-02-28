`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:54:50 06/11/2022 
// Design Name: 
// Module Name:    L2P_Converter 
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
	module L2P_Converter(out,in,clk_100Mhz,reset);
	input in,clk_100Mhz,reset;
	output reg out;
	wire clk_1Mhz,syn_out;

	parameter s0=0,s1=1;  //posiible stats . signal level either 1 or 0.
	reg state,next_state;

	clk_divider cd(clk_1Mhz,clk_100Mhz,reset);
	synchronizer syn(syn_out,in,clk_1Mhz,reset);

	always @(*)           //star '*' means this block is sensitive to all inputs used in it. 
	begin
		 case(state)    //stats diagram code
		 s0:
				if(syn_out)
				begin
					  out=1;
					  next_state=s1;
				end
				else
				begin
					  out=0;
					  next_state=s0;
				end
		 s1:
				if(syn_out)
				begin
					  out=0;
					  next_state=s1;
				end
				else
				begin
					  out=0;
					  next_state=s0;
				end				
		endcase 
	end		
	always @(posedge clk_1Mhz)  //reset block
	begin
		 if(reset)
					state=s0;
		 else
					state=next_state;
	end
	endmodule

	module clk_divider(clk_1Mhz,clk_100Mhz,reset);  //clock divider
	input clk_100Mhz,reset;
	output reg clk_1Mhz;
	integer c;    //we can also delacre c as a reg.
	always @(posedge clk_100Mhz)
		  if(reset)
		  begin
					 c=0;
					 clk_1Mhz=1;
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
	endmodule

	module D_FF(Q,D,clk_1Mhz,reset);  //D_FF
	input D,clk_1Mhz,reset;
	output reg Q;

	always @(posedge clk_1Mhz)
		 if(reset)
					Q=0;
		 else
					Q=D;
	endmodule

	module synchronizer(syn_out,in,clk_1Mhz,reset);   //synchronizer
	input in,clk_1Mhz,reset;
	output syn_out;
	wire FF1_out;

	D_FF ff1(FF1_out,in,clk_1Mhz,reset);
	D_FF ff2(syn_out,FF1_out,clk_1Mhz,reset);

	endmodule









