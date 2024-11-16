library ieee;
use ieee.std_logic_1164.all;

entity alerta is port(
    MSE, J1, P :in std_logic;
    ALT1: out std_logic
); 
end alerta;

architecture alrt of alerta is

    begin
        process(MSE) begin

            if MSE = '1' and (J1 = '1' or P = '1') then ALT1<='1'; else ALT1 <= '0'; 

        end process;

end alrt;