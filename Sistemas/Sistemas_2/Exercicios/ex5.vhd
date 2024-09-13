library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY demux IS 
    PORT(
        I0 : in std_logic_vector(15 downto 0);
        I1 : in std_logic_vector(15 downto 0);
        I2 : in std_logic_vector(15 downto 0);
        I3 : in std_logic_vector(15 downto 0);
        I4 : in std_logic_vector(15 downto 0);
        I5 : in std_logic_vector(15 downto 0);
        I6 : in std_logic_vector(15 downto 0);
        I7 : in std_logic_vector(15 downto 0);
        SEL : in std_logic_vector(2 downto 0);
        NUM : out std_logic_vector (15 downto 0)
);
END ENTITY demux;

ARCHITECTURE behav OF demux IS
BEGIN
    process(SEL) BEGIN
        CASE SEL IS
            WHEN "000" => NUM <= I0;
            WHEN "001" => NUM <= I1;
            WHEN "010" => NUM <= I2;
            WHEN "011" => NUM <= I3;
            WHEN "100" => NUM <= I4;
            WHEN "101" => NUM <= I5;
            WHEN "110" => NUM <= I6;
            WHEN "111" => NUM <= I7;
            WHEN others => NUM <= "0000000000000000";
        END CASE;
    END PROCESS;
END ARCHITECTURE;