module test_bench();
reg code,clk,reset;
wire openlock,alarm;

digital_lock dl(openlock,alarm,code,reset,clk);

always 
#5 clk=~clk;
initial
begin
clk=0;  reset=1;  code=1; //incorrect first input  code=1 stay in s0 state (initial state) alarm=1, openlock=0; 
#5 reset=0; code=0;     
#10 code=0;           
#10 code=0;           
#10 code=1;        
#10 code=0;        //correct first input code=0 go to s1 state  alarm=0, openlock=0 
#10 code=1;        //correct 2nd input   1 go to s2 state  alarm=0, openlock=0   
#10 code=0;        //correct 3rd input   0 go to s3 state  alarm=0, openlock=1 
#10 code=1;        //incorrect first input 1 go to s0 state  alarm=1, openlock=0
end
initial
$monitor( $time ,"code=%b, openlock=%b, alarm=%b, reset=%b",code,openlock,alarm,reset);
endmodule
 
 
