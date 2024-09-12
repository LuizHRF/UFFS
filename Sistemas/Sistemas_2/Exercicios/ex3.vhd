library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd7seg is
    port (
        EN : in std_logic; -- Enable
        D : in std_logic_vector (3 downto 0); -- Encoder Input
        S : out std_logic_vector (6 downto 0) -- Encoder Output
    );
end entity bcd7seg;

architecture Behavior of bcd7seg is
begin
    process(EN, D) begin
        if EN = '1' then
            case D is
                when "0000" => S <= "1111110"; -- 0
                when "0001" => S <= "0110000"; -- 1
                when "0010" => S <= "1101101"; -- 2
                when "0011" => S <= "1111001"; -- 3
                when "0100" => S <= "0110011"; -- 4
                when "0101" => S <= "1011011"; -- 5
                when "0110" => S <= "1011111"; -- 6
                when "0111" => S <= "1110000"; -- 7
                when "1000" => S <= "1111111"; -- 8
                when "1001" => S <= "1111011"; -- 9
                when others => S <= "0000000"; -- Error
            end case;
        else
            S <= "0000000"; -- Error
        end if;
    end process;
end architecture Behavior;