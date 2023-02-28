module johnson_counter(out,clock,reset);    //clear=reset
input clock,reset;
output [3:0] out;
reg [3:0]out;
always @(posedge clock)
       if(~reset)
       out=4'd0;
       else
       case (out)
       4'd0  : out=4'd8;
       4'd8  : out=4'd12;
       4'd12 : out=4'd14;
       4'd14 : out=4'd15;
       4'd15 : out=4'd7;
       4'd7  : out=4'd3;
       4'd3  : out=4'd1;
       4'b1  : out=4'd0;
       default : out=4'd0;
       endcase
endmodule 

//according to problem we should Designed it using D FF behavior then instantiate it. but we designed it using johson's behavior.