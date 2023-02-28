
module parking_sys(bulb,gate,v,enable,seg7,zero,one,clk_100Mhz,reset);  
input zero,one,clk_100Mhz,reset,v;
output [2:0]enable;
output reg bulb,gate;
output [6:0]seg7;
wire L2P_zero,L2P_one,clk_5hz;
reg [2:0]state;
reg [1:0] PS;
parameter v0=2'd0,v1=2'd1,v2=2'd2;
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4='d4,s5=3'd5,s6=3'd6;

clk_divider cd(clk_5hz,clk_100Mhz,reset);
L2P_Converter l2p0(L2P_zero,zero,clk_5hz,reset);
L2P_Converter l2p1(L2P_one,one,clk_5hz,reset);
seven_seg ss(seg7,state);

assign enable=3'b110;

always@(posedge clk_5hz,posedge reset)    //car detection module
        if(reset)  
                  PS=v0;
         else
			case(PS)
		   v0:  
				  begin
					   bulb=1'b0;
                  PS=v?v1:v0;						
				  end
			v1:    
				  begin
					  bulb=1'b1;
					  if(v && gate)
							PS=v2;
					  else if(v && ~gate)
					        PS=v1;
                 else if(~v)
                     PS=v0;					  
				  end
			v2:
				  begin
						 bulb=1'b0;
						 if(v)
						    PS=v1;
						 else
						   PS=v0;   						
				  end
			
				 default:  
				 begin
						  PS=v0;
							bulb=1'b0;
				 end
			  endcase



always@(posedge clk_5hz,posedge reset)   //password module
        if(reset)  
                  state=s0;
         else
			case(state)
		   s0:  
				  begin
					   gate=1'b0;
                  if(L2P_zero && v)
                        state=s1;
                  else if(L2P_one && v)
                        state=s0;
                   //else
                       //state=s0;						 
				  end
		   s1:  
				  begin
					   gate=1'b0;
                  if(L2P_zero && v)
                        state=s2;
                  else if(L2P_one && v)
                        state=s0;
                   //else
                       //state=s0;						 
				  end
			s2:  
				  begin
					   gate=1'b0;
                  if(L2P_zero && v)
                        state=s1;
                  else if(L2P_one && v)
                        state=s3;
                   //else
                      // state=s0;						 
				  end
			s3:  
				  begin
					   gate=1'b0;
                  if(L2P_zero && v)
                        state=s1;
                  else if(L2P_one && v)
                        state=s4;
                  // else
                       //state=s0;						 
				  end
			s4:  
				  begin
					   gate=1'b0;
                  if(L2P_zero && v)
                        state=s5;
                  else if(L2P_one && v)
                        state=s0;
                   //else
                       //state=s0;						 
				  end
			s5:  
				  begin
					   gate=1'b0;
                  if(L2P_zero && v)
                        state=s2;
                  else if(L2P_one && v)
                        state=s6;
                   //else
                       //state=s0;						 
				  end	
         s6:  
				  begin
					   gate=1'b1;
                  if(L2P_zero && v)
                        state=s1;
                  else if(L2P_one && v)
                        state=s0;
                   //else
                      // state=s0;						 
				  end					  
		   default:  
				 begin
						  state=s0;
						  gate=1'b0;
				 end
		endcase
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
output [6:0] seg7;     
assign seg7=(state==3'b000)? 7'b1000000:
           (state==3'b001)? 7'b1111001:
           (state==3'b010)? 7'b0100100:
           (state==3'b011)? 7'b0110000:
           (state==3'b100)? 7'b0011001:
           (state==3'b101)? 7'b0010010:
           (state==3'b110)? 7'b0000010:
           (state==3'b111)? 7'b1111000:7'b1111111;      
endmodule
