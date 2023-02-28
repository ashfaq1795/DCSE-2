module HS(B,D,a,b);
input a,b;
output D,B;

assign {B,D}=(a-b);
endmodule

//we can also make half subtractor using structrual(gate_level) and equation of borrow and differrence(behavioural level).
