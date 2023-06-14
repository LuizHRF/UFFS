library ieee;
use ieee.std_logic_1164.all;

entity Caixas_de_Agua is port(
    SA20, SA15, SB: in std_logic;
    CAB, EVA: out std_logic
); 
end Caixas_de_Agua;

architecture Bombas of Caixas_de_Agua is
    begin
        process(SA20, SA15, SB) begin
            if SA20 or SB or SA15 then
                CAB<= '0';
            else CAB<= '1';
            end if;
        end process;

        process(SA15) begin
            if SA15 then
                EVA<='1';
            else EVA<='0';
            end if;
        end process;
    end Bombas;