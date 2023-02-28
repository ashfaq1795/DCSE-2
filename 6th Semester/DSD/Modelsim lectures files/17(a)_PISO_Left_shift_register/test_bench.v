module test_bench;
reg load,shift,clock;
reg [3:0] in;
wire out;

PISO_LSHIFT tb(out,in,load,shift,clock);

always
#5 clock=~clock;

initial begin
load=1'b0;  
shift=1'b0; 
clock=1'b0;  
in=4'b1011;               //data
#25 load=1;               //load data first.
#30 load=0; shift=1;      //now display and shifting.
#70 load=1; shift=0;     //again same data will load; and shifting block will not execute.
#20 load=1; shift=1;     //nothing will happen previous state will retain.
#20 load=0; shift=0;     //nothing will happen previous state will retain.
end
initial 
$monitor($time,"  load=%b, shift=%b, in=%b,  out=%b",load,shift,in,out);
endmodule




//in case n-bits PISO left or right shift register we need 1 clock cycle for data input and n clock cycle for data dispaly.
