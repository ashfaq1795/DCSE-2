module TrafficLight(clk,rst,v,farm,highway);
input clk,rst,v;
output reg [2:0] farm, highway;
reg [1:0] PS,NS;
parameter [1:0] HG_FR = 0, HR_FY = 1, HR_FG = 2, HY_FR = 3;
wire oclk;
integer x=0;
Divider d1(clk,oclk,rst);
always @(posedge oclk)
			if(rst==0)
			begin
				PS = HG_FR;
			end
			else
				PS = NS;
always @(PS or v or rst)
			case(PS)
			HG_FR:         //when v=1 state will change.
			begin   
				NS = v?HR_FY: HG_FR;
				highway = v?3'b100:3'b001;
				farm = v?3'b010:3'b100;
			end
			HR_FY:      //after 3 sec this state will change.
			begin
				NS = HR_FG;
				highway = 3'b100;
				farm = 3'b001;
			end
			HR_FG:     //state will change after 10 sec
			begin
				x=x+1;
				if(x==3)    //3x3=9sec 
				begin
					NS = HY_FR;
					highway = 3'b010;
					farm = 3'b100;
					x=0;
				end
			end
			default:   //if 3 sec this state will change.
			begin
				NS = HG_FR;
				highway = 3'b001;
				farm = 3'b100;
			end	
			endcase
endmodule

module Divider(input iclk,output reg oclk, input rst);
reg [100:0] count;
always @(posedge iclk)
	if(rst==0)
	begin
		oclk = 0;
		count = 0;
	end
	else
	begin
		count = count+1;
		if(count==3*50000000)  //give time period 3 sec.
		begin
			oclk = ~oclk;
			count = 0;
		end
	end
endmodule
