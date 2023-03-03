library verilog;
use verilog.vl_types.all;
entity mux4x1 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        sel0            : in     vl_logic;
        sel1            : in     vl_logic;
        f               : out    vl_logic
    );
end mux4x1;
