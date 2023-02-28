library verilog;
use verilog.vl_types.all;
entity binary_4_bits_adder is
    port(
        \out\           : out    vl_logic_vector(6 downto 0);
        en              : out    vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        cout            : out    vl_logic;
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0)
    );
end binary_4_bits_adder;
