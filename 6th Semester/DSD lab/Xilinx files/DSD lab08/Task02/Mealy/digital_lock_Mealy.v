`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:23 06/26/2022 
// Design Name: 
// Module Name:    digital_lock 
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


//****************************sequence detector 11011*************************
module digital_lock_Mealy(seg7,out,zero,one,clk_100Mhz,reset,enable);
input zero,one,clk_100Mhz,reset;
output [2:0]enable;
output reg out;
output [7:0]seg7;
wire syn_out1,syn_out2,L2P_out0,L2P_out1,clk_1hz;
reg [2:0]state;
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4,s5=3'd5;

//if i use s0=0 and s1=1 etc. then it give warning becuase these decimal are by default 32 bits and
// state register is 3 bits the warning will be "32-bits truncated to 3  bits".

clk_divider cd(clk_1hz,clk_100Mhz,reset);
synchronizer syn1(syn_out1,zero,clk_1hz,reset);
synchronizer syn2(syn_out2,one,clk_1hz,reset);
L2P_Converter l2p1(L2P_out0,syn_out1,clk_1hz,reset);
L2P_Converter l2p2(L2P_out1,syn_out2,clk_1hz,reset);
seven_seg ss(seg7,state);

assign enable=3'b110;

always@(posedge clk_1hz,posedge reset)   //Mealy Machine
begin
     if(reset)    //initial state...
	  begin
		       state=s0;
				 out=0;
	  end
	  else
     case(state)
				s0:
				  if(L2P_out0)
				  begin
						 out=0;
						 state=s0;  //both input not possible at  a time also we don't need.even if we entered both input at a time it will considered L2p_out1 input.						 
				  end
				  else if(L2P_out1)
				  begin
						 out=0;
						 state=s1;  				 
				  end
				s1:
				  if(L2P_out0)
				  begin
						 out=0;
						 state=s0;  			 
				  end
				  else if(L2P_out1)
				  begin
						 out=0;
						 state=s2;  				 
				  end
				s2:
				  if(L2P_out0)
				  begin
						 out=0;
						 state=s3;  			 
				  end
				  else if(L2P_out1)
				  begin
						 out=0;
						 state=s1;  				 
				  end
				s3:
				 if(L2P_out0)
				  begin
						 out=0;
						 state=s0;  			 
				  end
				  else if(L2P_out1)
				  begin
						 out=0;
						 state=s4;  				 
				  end
				s4:
				  if(L2P_out0)
				  begin
						 out=0;
						 state=s0;  			 
				  end
				  else if(L2P_out1)
				  begin
						 out=1;
						 state=s0;  				 
				  end
				default:    //if initially not reset then default state execute. if there is no reset and no default state then random state execute.
				  begin
				       state=s0;
						 out=0;
				  end
		endcase
end
endmodule

module clk_divider(clk_1hz,clk_100Mhz,reset);  //clock divider
input clk_100Mhz,reset;
output reg clk_1hz;
integer c;    //we can also delacre c as a reg.
always @(posedge clk_100Mhz)
		if(reset)
		begin
				c=0;
				clk_1hz=1;
		end
		else
		begin
				c=c+1'b1;
				if(c==50000000)
				begin
						clk_1hz=~clk_1hz;
						c=0;
				end
		end
endmodule


module D_FF(Q,D,clk_1hz,reset);  //D_FF.  
input D,clk_1hz,reset;
output reg Q;

always @(posedge clk_1hz)
       if(reset)
                 Q=0;
         else
                 Q=D;
endmodule

module synchronizer(syn_out,in,clk_1hz,reset);   //synchronizer
input in,clk_1hz,reset;
output syn_out;
wire FF1_out;
//we can also design synchronizer without using D_FFs.
D_FF ff1(FF1_out,in,clk_1hz,reset);
D_FF ff2(syn_out,FF1_out,clk_1hz,reset);

endmodule



module L2P_Converter(L2P_out,syn_out,clk_1hz,reset); //level to pulse converter.
input syn_out,clk_1hz,reset;      
output reg L2P_out;    
  
parameter s0=0,s1=1;  //posiible stats . signal level either 1 or 0.
reg state,next_state; //by default reg size is 32 bits also by default integer size taken as 32 bit so s0 and s1 can store in state and next_state without giving any warning.

always @(*)           //star '*' means this block is sensitive to all inputs used inside it. 
begin
       case(state)    //stats diagram code of L2P.
       s0:            //this is mealy machine. 
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
//we can also use single always block then no need of next_register. as i used one alwyas block in main module.    
always @(posedge clk_1hz)  //reset block
begin
       if(reset)
               state=s0;
       else
                 state=next_state;
end
endmodule

module seven_seg(seg7,state);   //7_segment display
input [2:0]state;
output [7:0] seg7;     // as we have 0 to 5 states only. so only these six states will be used.
assign seg7=(state==3'b000)? 8'b01000000:  //the last 8th bit for dit.
           (state==3'b001)? 8'b01111001:
           (state==3'b010)? 8'b00100100:
           (state==3'b011)? 8'b00110000:
           (state==3'b100)? 8'b00011001:
           (state==3'b101)? 8'b00010010:
           (state==3'b110)? 8'b00000010:
           (state==3'b111)? 8'b01111000:8'b01111111;      
endmodule  

