module test_HS;
reg a,b;
wire borrow,diff;

HS hs1(borrow,diff,a,b);  //positionl association
initial begin
#10 a=0; b=0;   //upto 10 unit the output graph will show red line indecating x as default value stored in registers A,B,sum and carry.
#15 a=0; b=1;
#20 a=1; b=0;
#05 a=1; b=1;
end
initial
$monitor($time,"   A=%b, B=%b, borrow=%b, Diff=%b",a,b,borrow,diff);
endmodule
//we can also make half subtractor using structrual(gate_level) and equation of borrow and differrence(behavioural level).
//we can also make FS using half subtractor.