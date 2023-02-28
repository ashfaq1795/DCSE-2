module testbench1();
reg x1,x2,x3,x4,x5;
wire z;
equation tb(x1,x2,x3,x4,x5,z);
initial
begin
$display("x1,x2,x3,x4,x5,z");
x1=0;x2=0;x3=0;x4=0;x5=0;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
x1=0;x2=0;x3=0;x4=0;x5=1;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
x1=0;x2=0;x3=0;x4=1;x5=0;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
x1=0;x2=0;x3=3;x4=0;x5=0;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
x1=0;x2=2;x3=0;x4=0;x5=0;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
x1=1;x2=0;x3=0;x4=0;x5=0;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
x1=1;x2=1;x3=1;x4=1;x5=1;
#20 $display("%b,%b,%b,%b,%b,%b",x1,x2,x3,x4,x5,z);
end
endmodule
