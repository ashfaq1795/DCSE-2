module test_HA;
reg a,b;
wire carry,sum;

HA hd1(carry,sum,a,b);  //positionl association
initial begin
#10 a=0; b=0;   //upto 10 unit the output graph will show red line indecating x as default value stored in registers A,B,sum and carry.
#15 a=0; b=1;
#20 a=1; b=0;
#05 a=1; b=1;
end
initial
$monitor($time,"   A=%b, B=%b, Carry=%b, Sum=%b",a,b,carry,sum);
endmodule