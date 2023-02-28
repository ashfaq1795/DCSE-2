module test_counter; //we can also add top_level file;
reg clk,rst,T;
wire [3:0]q;

Ripple_counter_4bits rc(q,clk,rst,T);
always
#10 clk=~clk;
initial begin
clk=0; rst=1; T=1;
#15 rst=0;
#90 T=0;          //when T=0 it pause counting.
#50 T=1;          //resume counting.
#40 rst=1;
#20 rst=0;
end
initial
$monitor($time," reset=%b, T=%b, Q=%d",rst,T,q);
endmodule

//when T=0 it pause the counting and don't loss previous counting. i,e if T become 0 at 200 again T=1 then counting will start from 201.
//usually T=1 permenently for counting.