module FSM_Mealy(out,in,clk,reset);
input in,clk,reset; 
output reg[1:0] out;
parameter s0=2'd0,s1=2'd1,s2=2'd2;
reg [1:0] present_state,next_state;

always @(posedge clk,posedge reset)
        if(~reset)
        begin
             present_state=s0;
             out=0;        //this initialization give error in xilinix "multiple driver"...
        end
        else
             present_state=next_state;
always @(*)
       case(present_state)
       s0:
            if(~in)
            begin
               out=2'b00;
               next_state=s0;
            end
            else if(in)
            begin
               out=2'b01;
               next_state=s1;
            end
       s1:
            if(~in)
            begin
               out=2'b00;
               next_state=s2;
            end
            else if(in)
            begin
               out=2'b01;
               next_state=s0;
            end
       s2:
            if(~in)
            begin
               out=2'b10;
               next_state=s2;
            end
            else if(in)
            begin
               out=2'b11;
               next_state=s1;
            end
       default:
       begin
            next_state=2'bxx;
            out=2'bxx;
       end
       endcase
endmodule 
    


