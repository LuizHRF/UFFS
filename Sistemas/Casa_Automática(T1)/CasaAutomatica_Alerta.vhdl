library ieee;
use ieee.std_logic_1164.all;

entity alerta is port(
    MS, J1, J2, J3, P, PT, SC, SCh, T: in std_logic;
    ALT: out std_logic_vector(4 downto 0)
); 
end alerta;

architecture alrt of alerta is
    signal tmp: STD_LOGIC;
    begin
        process(MS, J1, J2, J3, P, PT, SC, SCh, T) begin
            if (MS and (J1 or J2 or J3)) then ALT(0)<='1'; else ALT(0) <= '0'; -- Modo seguro e janelas abertas
            end if;
            if (P and not PT) then ALT(1)<='1'; else ALT(1) <='0'; --Porta aberta mas trancada
            end if;
            if (SCh and (J1 or J2 or J3 or P)) then ALT(2)<='1'; else ALT(2)<='0'; --Chovendo e porta ou janelas abertas
            end if;
            if (SC and (J1 or J2 or J3)) then ALT(3)<='1'; else ALT(3)<= '0'; --Noite e janelas abertas
            end if;
            if (T and (J1 or J2 or J3)) then ALT(4)<='1'; else ALT(4) <= '0'; --Temperatura e janelas abertas
            end if;
        end process;
    end alrt;