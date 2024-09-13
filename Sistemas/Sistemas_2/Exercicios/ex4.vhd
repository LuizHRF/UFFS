library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux is
    port (
        I0 : in std_logic_vector (3 downto 0); -- Input
        I1 : in std_logic_vector (3 downto 0); -- Input
        I2 : in std_logic_vector (3 downto 0); -- Input
        I3 : in std_logic_vector (3 downto 0); -- Input
        SEL : in std_logic_vector (1 downto 0) := "00"; -- Select
        Y : out std_logic_vector (3 downto 0) -- Output
    );
end entity mux;

architecture behavior of mux is
begin
    process(SEL) begin
        case SEL is
            when "00" => Y <= I0;
            when "01" => Y <= I1;
            when "10" => Y <= I2;
            when "11" => Y <= I3;
            when others => Y <= "0000";
        end case;
    end process;
end architecture;