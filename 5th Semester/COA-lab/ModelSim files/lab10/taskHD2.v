module stim_adder();
reg X,Y;
wire sum,carry;
halfadder td(X,Y,sum,carry);
initial
begin
$display("X,Y,sum,carry");
X=0;Y=0;
#20 $display("%b,%b,%b,%b",X,Y,sum,carry);
X=0;Y=1;
#20 $display("%b,%b,%b,%b",X,Y,sum,carry);
X=1;Y=0;
#20 $display("%b,%b,%b,%b",X,Y,sum,carry);
X=1;Y=1;
#20 $display("%b,%b,%b,%b",X,Y,sum,carry);
end
endmodule
