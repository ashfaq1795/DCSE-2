library verilog;
use verilog.vl_types.all;
entity \buffer\ is
    generic(
        n               : integer := 7
    );
    port(
        \out\           : out    vl_logic_vector;
        \in\            : in     vl_logic_vector
    );
end \buffer\;
