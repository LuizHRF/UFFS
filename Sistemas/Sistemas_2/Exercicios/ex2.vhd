library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder_2to4en is
    port (
        EN : in std_logic; -- Enable
        A : in std_logic_vector (1 downto 0); -- Decoder Input
        Y_L : out std_logic_vector (3 downto 0) -- Decoder Output (active low)
    );
end entity decoder_2to4en;

architecture behavior of decoder_2to4en is
begin
    process(A, EN) begin
        if EN = '0' then
            Y_L <= "1111";
        else
            case A is
                when "00" => Y_L <= "1110";
                when "01" => Y_L <= "1101";
                when "10" => Y_L <= "1011";
                when "11" => Y_L <= "0111";
                when others => Y_L <= "1111";
            end case;
        end if;
    end process;
end architecture;