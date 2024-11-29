library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity cards is
    port (
        clk     : in  std_logic;                      
        reset   : in  std_logic;                      
        enable  : in  std_logic;                      
        random_number : out std_logic_vector(3 downto 0)
    );
end cards;

architecture Behavioral of cards is
    signal lfsr : std_logic_vector(15 downto 0) := "1010110010100000";  -- SEED
    signal rnd_int : integer range 1 to 52;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            lfsr <= "1110110010101110";
        elsif rising_edge(clk) then
            if enable = '1' then
                lfsr <= lfsr(14 downto 0) & 
                        (lfsr(15) xor lfsr(13) xor lfsr(12) xor lfsr(10));
            end if;
        end if;
    end process;

    rnd_int <= (to_integer(unsigned(lfsr)) mod 13) + 1;

    random_number <= std_logic_vector(to_unsigned(rnd_int, 4));
end Behavioral;
