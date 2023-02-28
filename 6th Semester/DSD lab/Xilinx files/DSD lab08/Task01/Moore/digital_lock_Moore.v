`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:53 06/26/2022 
// Design Name: 
// Module Name:    digital_lock_Mealy 
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
module digital_Lock_Moore(out,enable,seg7,zero,one,clk_100Mhz,reset);  //sequence detector 01011
input zero,one,clk_100Mhz,reset;
output [2:0]enable;
output reg out;
output [6:0]seg7;
wire L2P_out0,L2P_out1,clk_5hz;
reg [2:0]state,next_state;
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4,s5=3'd5;

clk_divider cd(clk_5hz,clk_100Mhz,reset);
L2P_Converter l2p0(L2P_out0,zero,clk_5hz,reset);
L2P_Converter l2p1(L2P_out1,one,clk_5hz,reset);
seven_seg ss(seg7,state);

assign enable=3'b110;

always@(posedge clk_5hz,posedge reset)
begin
        if(reset)          //if reset initial state=s0.
		          state=s0;
		  else
		          state=next_state;
end
always @(*)               //Moore Machine...
begin
      case(state)
		s0:  
		   begin
						  out=0;
				  if(L2P_out0)
						  next_state=s1;	  
				  else if(L2P_out1)
						  next_state=s0;
				  else
						  next_state=state;
		   end
      s1:    
		   begin
						  out=0;
				  if(L2P_out0)
						  next_state=s1;	  
				  else if(L2P_out1)
						  next_state=s2;
				  else
						  next_state=state;
		   end
      s2:
		   begin
						  out=0;
				  if(L2P_out0)
						  next_state=s3;	  
				  else if(L2P_out1)
						  next_state=s0;
				  else
						  next_state=state;
		   end
      s3:
		   begin
						  out=0;
				  if(L2P_out0)
						  next_state=s1;	  
				  else if(L2P_out1)
						  next_state=s4;
				  else
						  next_state=state;
		   end
      s4:
		   begin
						  out=0;
				  if(L2P_out0)
						  next_state=s3;	  
				  else if(L2P_out1)
						  next_state=s5;
				  else
						  next_state=state;
		   end
		s5:
		  begin
						  out=1;
				  if(L2P_out0)
						  next_state=s1;	  
				  else if(L2P_out1)
						  next_state=s0;
				  else
						  next_state=state;
		   end
		  default:   //if initally no reset default case will execute. if there is no default case and reset then random case will be executing.
		  begin
		         next_state=s0;
					out=0;
		  end
		endcase
end
endmodule

module clk_divider(clk_5hz,clk_100Mhz,reset);  //clock divider
input clk_100Mhz,reset;
output reg clk_5hz;
integer c;    //we can also delacre c as a reg.
always @(posedge clk_100Mhz)
		if(reset)
		begin
				c=0;
				clk_5hz=1;
		end
		else
		begin
				c=c+1'b1;
				if(c==10000000)
				begin
						clk_5hz=~clk_5hz;
						c=0;
				end
		end
endmodule


module D_FF(Q,D,clk_5hz,reset);  //D_FF.  
input D,clk_5hz,reset;
output reg Q;

always @(posedge clk_5hz)
       if(reset)
                 Q=0;
         else
                 Q=D;
endmodule

module synchronizer(syn_out,in,clk_5hz,reset);   //synchronizer
input in,clk_5hz,reset;
output syn_out;
wire FF1_out;
//we can also design synchronizer without using D_FFs.
D_FF ff1(FF1_out,in,clk_5hz,reset);
D_FF ff2(syn_out,FF1_out,clk_5hz,reset);

endmodule



module L2P_Converter(L2P_out,in,clk_5hz,reset); //level to pulse converter.
input in,clk_5hz,reset;      
output reg L2P_out;
wire syn_out;
  
synchronizer ss1(syn_out,in,clk_5hz,reset);
  
  
parameter s0=0,s1=1;  //posiible stats . signal level either 1 or 0.
reg state,next_state;

always @(*)           //star '*' means this block is sensitive to all inputs used inside it. 
begin
       case(state)    //stats diagram code of L2P.
       s0:
            if(syn_out)      //Mealy Machine...
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
always @(posedge clk_5hz)  //reset block
begin
       if(reset)
               state=s0;
       else
                 state=next_state;
end
endmodule

module seven_seg(seg7,state);   //7_segment display
input [2:0]state;
output [6:0] seg7;     // as we have 0 to 4 states only. so only these five states will be used.
assign seg7=(state==3'b000)? 7'b1000000:
           (state==3'b001)? 7'b1111001:
           (state==3'b010)? 7'b0100100:
           (state==3'b011)? 7'b0110000:
           (state==3'b100)? 7'b0011001:
           (state==3'b101)? 7'b0010010:
           (state==3'b110)? 7'b0000010:
           (state==3'b111)? 7'b1111000:7'b1111111;      
endmodule  


