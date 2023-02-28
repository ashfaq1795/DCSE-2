
module parity_detector(led_even,led_odd,in,clk_100Mhz,reset);  //one input
input in,clk_100Mhz,reset;
output reg led_even,led_odd;
wire clk_1hz,sync_out,l2p_out;

parameter even=1'b0,odd=1'b1;
reg state;

clk_divider cd(clk_1hz,clk_100Mhz,reset);
synchronizer sync(in,sync_out,clk_1hz,reset);
l2p lp(l2p_out,sync_out,clk_1hz,reset);

always @(posedge clk_1hz,posedge reset)  //one always block .....Mealy Machine
        if(reset)
		  begin
		          state=even;
					 led_even=1'b1;
					 led_odd=1'b0;
		  end
		  else
        case(state) 
		  even:
		  begin
		       led_even=l2p_out?1'b0:1'b1;   //as one input so ternary operator.
				 led_odd=l2p_out?1'b1:1'b0;
				 state=l2p_out?odd:even;
		  end
		  odd:
		  begin
		       led_even=l2p_out?1'b1:1'b0;
				 led_odd=l2p_out?1'b0:1'b1;
				 state=l2p_out?even:odd;
		  end	
		  default:
		  begin
		       state=even;
				 led_even=1'b1;
				 led_odd=1'b0;
		  end
        endcase		  
endmodule

module clk_divider(clk_1hz,clk_100Mhz,reset);  //clock divider
input clk_100Mhz,reset;
output reg clk_1hz;
integer c;
always @(posedge clk_100Mhz)
       if(reset)
		 begin
		         clk_1hz=1;
					c=0;
		 end
		 else
		 begin
		     c=c+1'b1;
			  if(c==10000000)
			  begin
			  clk_1hz=~clk_1hz;
			  c=0;
			  end
		 end
endmodule

module D_FF(in,out,clk_1hz,reset);   //D_FF
input in,clk_1hz,reset;
output reg out;
always @(posedge clk_1hz)
        if(reset)
                out=0;
        else
            out=in;
endmodule
				
module synchronizer(in,sync_out,clk_1hz,reset);   //synchronizer 
input in,clk_1hz,reset;
output sync_out;
wire FF1_out;

D_FF dff1(in,FF1_out,clk_1hz,reset);
D_FF dff2(FF1_out,sync_out,clk_1hz,reset);
endmodule
		
module l2p(l2p_out,sync_in,clk_1hz,reset);    //l2p
input sync_in,clk_1hz,reset;
output reg l2p_out;

parameter s0=1'b0,s1=1'b1;
reg state,next_state;

always @(posedge clk_1hz)
        if(reset)
          state=s0;
          else
          state=next_state;
always @(*)          //Mealy machine.
        case(state)
          s0:
          begin   
             l2p_out=sync_in?1'b1:1'b0;   //as there is only one input so we can use ternary operator.
              next_state=sync_in?s1:s0;
          end
          s1:
          begin
             l2p_out=sync_in?0:0;
              next_state=sync_in?s1:s0;
          end
       default:
         begin
                l2p_out=0;
                next_state=s0;
         end
       endcase
endmodule
		 
					
					
					
					
					
					
					
					