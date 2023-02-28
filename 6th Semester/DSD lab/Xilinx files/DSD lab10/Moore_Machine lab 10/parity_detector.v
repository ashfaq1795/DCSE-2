
module parity_detector(led_even,led_odd,zero,one,clk_100Mhz,reset);
input zero,one,clk_100Mhz,reset;  //two inputs button
output reg led_even,led_odd;
wire clk_1hz,sync_zero,sync_one,l2p_zero,l2p_one;

parameter even=1'b0,odd=1'b1;
reg state,next_state;

clk_divider cd(clk_1hz,clk_100Mhz,reset);  //all module take clk_ihz.
synchronizer syn1(sync_zero,zero,clk_1hz,reset);
synchronizer syn2(sync_one,one,clk_1hz,reset);
l2p l2p1(l2p_zero,sync_zero,clk_1hz,reset);
l2p l2p2(l2p_one,sync_one,clk_1hz,reset);

always @(posedge clk_1hz,posedge reset)
        if(reset)
		          state=even;
		   else
			       state=next_state;
always @(*)          //moore machine.
        case(state) 
		  even:
		  begin
		       led_even=1;
				 led_odd=0;
				 if(l2p_zero) //if we have two inputs then we can't use ternaroy operator like (next_state=in?even:odd)
						next_state=even;
				 else if(l2p_one)
						next_state=odd;
				 else
						next_state = state;
		  end
		  odd:
		  begin
		       led_odd=1;
				 led_even=0;
				 if(l2p_zero)
					next_state=odd;
				 else if(l2p_one)
					next_state=even;
				 else
					next_state = state;
		  end
        default:  //if initially not reset then default statment will execute.
		  begin
             led_odd=0;
             led_even=0;
           	 next_state=even;
        end				 
        endcase		  
endmodule

module clk_divider(clk_1hz,clk_100Mhz,reset);
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

module synchronizer(out,in,clk_1hz,reset);  //we can also design synchronizer using D_FFs.
input in,clk_1hz,reset;
output reg out;
reg FF1_out;
always @(posedge clk_1hz)
        if(reset)
		          out=0;
		  else
		  begin
		          FF1_out=in;
					 out=FF1_out;
		  end
endmodule

module l2p(l2p_out,sync_in,clk_1hz,reset);
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
		     l2p_out=sync_in?1'b1:1'b0;   //as there is only one input so we use ternary operator.
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


			 


