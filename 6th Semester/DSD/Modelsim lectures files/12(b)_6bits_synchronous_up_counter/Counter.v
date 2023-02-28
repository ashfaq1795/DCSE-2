module counter(count,reset,clk);
input reset,clk;
output [5:0]count;
reg [5:0] count;
always @(posedge clk) //6 bits Synchronus Counter.
begin
       if(~reset)
               count=6'd0;
       else
               count=count+1;
end
endmodule
