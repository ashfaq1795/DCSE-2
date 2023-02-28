library verilog;
use verilog.vl_types.all;
entity rca is
    port(
        sum             : out    vl_logic_vector(3 downto 0);
        cout            : out    vl_logic;
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0)
    );
end rca;
