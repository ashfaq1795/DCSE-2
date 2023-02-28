module UD_5bits(count,clk,reset,mode);
input clk,reset,mode;
output [4:0]count;
reg [4:0]count;

always@(posedge clk)
begin
      if(reset)
      count=5'b0000;
      else
          if(mode)   //up mode
                 count=count+1'b1;
          else  //down mode
                count=count-1'b1;
end
endmodule
