library ieee;
use ieee.std_logic_1164.all;

entity Caixas_de_Agua is port(
    SA: in std_logic_vector(1 downto 0);
    SB: in std_logic;
    CAB, EVA: out std_logic;
    ER: out std_logic
); 
end Caixas_de_Agua;

architecture Bombas of Caixas_de_Agua is
    begin
        
        EVA <= NOT SA(1);

        CAB <= SA(0) AND NOT SB;

        ER <= SA(1) AND NOT SA(0);

end Bombas;