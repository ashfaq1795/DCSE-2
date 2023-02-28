module vanding_machine_Mealy(open,D,N,clk,reset);
input N,D,clk,reset; 
output reg open;
parameter zero=0,five=1,ten=2,fifteen=3;
reg [1:0] present_state,next_state;

always @(posedge clk,posedge reset)
        if(reset)
        begin
             present_state=zero;
             open=0;        //this initialization give error in xilinix "multiple driver"...
        end
        else
             present_state=next_state;
always @(*)
       case(present_state)
       zero:
            if(~D && ~N)
            begin
               open=0;
               next_state=zero;
            end
            else if(~D && N)
            begin
               open=0;
               next_state=five;
            end
            else if(D && ~N)
            begin
               open=0;
               next_state=ten;
            end
            else
            begin
               next_state=present_state;
               open=open;
            end
       five:
            if(~D && ~N)
            begin
               open=0;
               next_state=five;
            end
            else if(~D && N)
            begin
               open=0;
               next_state=ten;
            end
            else if(D && ~N)
            begin
               open=0;
               next_state=fifteen;
            end
            else
            begin
               next_state=present_state;
               open=open;
            end
       ten:
            if(~D && ~N)
            begin
               open=0;
               next_state=ten;
            end
            else if(~D && N)
            begin
               open=0;
               next_state=fifteen;
            end
            else if(D && ~N)
            begin
               open=0;
               next_state=fifteen;
            end
            else
            begin
               next_state=present_state;
               open=open;
            end
       fifteen:
            if(~D && ~N)
            begin
               open=1;
               next_state=fifteen;
            end
            else if(~D && N)
            begin
               open=1;
               next_state=fifteen;
            end
            else if(D && ~N)
            begin
               open=1;
               next_state=fifteen;
            end
            else
            begin
               next_state=present_state;
               open=open;
            end
       default:
       begin
            next_state=zero;
            open=0;
       end
       endcase
endmodule 
    

