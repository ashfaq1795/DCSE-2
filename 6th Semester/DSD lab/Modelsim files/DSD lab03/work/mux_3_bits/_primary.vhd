library verilog;
use verilog.vl_types.all;
entity mux_3_bits is
    generic(
        n               : integer := 2
    );
    port(
        \out\           : out    vl_logic_vector;
        i1              : in     vl_logic_vector;
        i0              : in     vl_logic_vector;
        sel             : in     vl_logic
    );
end mux_3_bits;
