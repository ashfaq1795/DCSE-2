module stimdecode();
reg a,b,c;
wire f;
circuit td(a,b,c,f);
initial
begin
$display("a,b,c,f");
a=0;b=0;c=0;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=0;b=0;c=1;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=0;b=1;c=0;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=0;b=1;c=1;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=1;b=0;c=0;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=1;b=0;c=1;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=1;b=1;c=0;
#10 $display("%b,%b,%b,%b",a,b,c,f);
a=1;b=1;c=1;
#10 $display("%b,%b,%b,%b",a,b,c,f);
end
endmodule
