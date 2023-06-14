library ieee;
use ieee.std_logic_1164.all;

entity alerta is port(
    MS, J1, J2, J3, P, PT, SC, SCh, T: in std_logic;
    ALT: out std_logic
); 
end alerta;

architecture alrt of alerta is
    begin
        process(MS, J1, J2, J3, P, PT, SC, SCh, T) begin
            if (MS and (J1 or J2 or J3)) or (P and not PT) or 
                (SCh and (J1 or J2 or J3 or P)) or (SC and (J1 or J2 or J3)) or (T and (J1 or J2 or J3))
                then ALT<= '1';
            else ALT<='0';
            end if;
        end process;
    end alrt;