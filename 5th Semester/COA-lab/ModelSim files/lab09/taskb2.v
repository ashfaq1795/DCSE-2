module stimdec3x8();
reg A,B,C;
wire y0,y1,y2,y3,y4,y5,y6,y7;
decoder3x8 td(A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
initial
begin 
$display ("A,B,C,y0,y1,y2,y3,y4,y5,y6,y7");
A=0;B=0;C=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=0;B=0;C=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=0;B=1;C=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=0;B=1;C=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=1;B=0;C=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=1;B=0;C=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=1;B=1;C=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
A=1;B=1;C=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
end
endmodule