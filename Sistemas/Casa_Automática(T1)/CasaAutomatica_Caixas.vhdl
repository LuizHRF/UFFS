library ieee;
use ieee.std_logic_1164.all;

entity Caixas_de_Agua is port(
    SA: in std_logic_vector(3 downto 0);
    SB, Bomba_Ligada: in std_logic;
    CAB, EVA: out std_logic
); 
end Caixas_de_Agua;

architecture Bombas of Caixas_de_Agua is
    begin
        process(SA, SB) begin
            if SA(0)='1' and Bomba_Ligada = '1' and SB = '0' then CAB<= '1';
            else CAB <= '0';
            end if;
        end process;

        process(SA) begin
            if SA(1) = '0' then
                EVA <= '1';
                else EVA<='0';
            end if;
        end process;
    end Bombas;