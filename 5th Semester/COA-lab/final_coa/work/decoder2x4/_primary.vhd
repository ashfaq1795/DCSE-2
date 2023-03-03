library verilog;
use verilog.vl_types.all;
entity decoder2x4 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        d0              : out    vl_logic;
        d1              : out    vl_logic;
        d2              : out    vl_logic;
        d3              : out    vl_logic
    );
end decoder2x4;
