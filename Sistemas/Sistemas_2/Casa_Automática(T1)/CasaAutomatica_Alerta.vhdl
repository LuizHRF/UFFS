library ieee;
use ieee.std_logic_1164.all;

entity alerta is port(
    MSE, J1, P :in std_logic;
    ALT1: out std_logic;
    ALT2: out std_logic
); 
end alerta;

architecture alrt of alerta is

    begin
        process(MSE) begin

            if MSE and (J1 or P) then ALT1<='1'; else ALT1 <= '0'; -- Modo seguro ativado quando algo estava aberto
            end if;

        end process;

        ALT2 <= (MSE and (J1 or P));

end alrt;