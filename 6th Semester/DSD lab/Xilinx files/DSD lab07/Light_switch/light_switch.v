`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:29 06/12/2022 
// Design Name: 
// Module Name:    light_switch 
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
module light_switch(switch_out,in,clk_100Mhz,reset);  //light switch main module.
input in,clk_100Mhz,reset;      
output reg switch_out;  
wire clk_1Mhz,syn_out,L2P_out; 
reg state,next_state;
parameter s0=0,s1=1;

clk_divider cd(clk_1Mhz,clk_100Mhz,reset);
synchronizer syn(syn_out,in,clk_1Mhz,reset); //i can also instantiate synchronizer in L2p_converter block.
L2P_Converter l2p(L2P_out,syn_out,clk_1Mhz,reset);

always@(*)     //light switch state digram code
       case(state)
       s0: 
          if(L2P_out)
			 begin
                   switch_out=1;
                   next_state=s1;
			 end
	       else
			 begin
			          switch_out=0;
						 next_state=s0;
		    end
		s1:
		   if(L2P_out)
			begin
			          switch_out=0;
					    next_state=s0;
			end
			else
			begin
			          switch_out=1;
						 next_state=s1;
         end
     endcase
always@(posedge clk_1Mhz)
      if(reset)
              state=s0;
      else
              state=next_state;		
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
					if(c==20000000) //here i reduced value of c so the output clock is not 1_Mhz.
					begin
							clk_1Mhz=~clk_1Mhz;
							c=0;
					end
			end
endmodule


//I have designed synchronizer without using Flip flops. but funcationality same.
module synchronizer(syn_out,in,clk_1Mhz,reset);   //synchronizer
input in,clk_1Mhz,reset;
output reg syn_out;
reg FF1_out;

always @(posedge clk_1Mhz)
       if(reset)
		 syn_out=0;
		 else
		 begin
		     FF1_out=in;  //here also two FF will be generated. but coding method is different.
			  syn_out=FF1_out;
		 end
endmodule
		    



module L2P_Converter(L2P_out,syn_out,clk_1Mhz,reset); //level to pulse converter.
input syn_out,clk_1Mhz,reset;      
output reg L2P_out;    
  
parameter s0=0,s1=1;  //posiible stats . signal level either 1 or 0.
reg state,next_state;

always @(*)           //star '*' means this block is sensitive to all inputs used inside it. 
begin
       case(state)    //stats diagram code of L2P.
       s0:
            if(syn_out)
				begin   
				     L2P_out=1;   
					  next_state=s1;
				end
				else
				begin
				     L2P_out=0;
					  next_state=s0;
			   end
       s1:
            if(syn_out)
				begin
				     L2P_out=0;
					  next_state=s1;
				end
				else
				begin
				     L2P_out=0;
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



