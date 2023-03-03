library verilog;
use verilog.vl_types.all;
entity circuit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        f               : out    vl_logic
    );
end circuit;
