module fsm_counter(count,clk); //we can also insert reset input.
input clk;
output reg [2:0] count;
parameter [2:0] A=4'b000,B=4'b100,C=4'b111,D=4'b010,E=4'b011;
always @(negedge clk)  //sensitivity list always contain inputs not outputs.
       case(count)
       A : count=B;
       B : count=C;
       C : count=D;
       D : count=E;
       E : count=A;
       default : count=B;  //we can initialize default by any state A to E.
       endcase
endmodule
