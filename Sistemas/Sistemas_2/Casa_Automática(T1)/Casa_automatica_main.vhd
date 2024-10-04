
library ieee;
use ieee.std_logic_1164.all;

entity Casa is port(
    sw: in std_logic_vector(9 downto 0);
    ledr: out std_logic_vector(9 downto 0)
); 
end entity Casa;

architecture main of Casa is

    component alerta is port(
        MSE, J1, P :in std_logic;
        ALT1: out std_logic;
        ALT2: out std_logic
    ); 
    end component;

    component Caixas_de_Agua is port(
        SA: in std_logic_vector(1 downto 0);
        SB: in std_logic;
        CAB, EVA: out std_logic;
        ER: out std_logic
    ); 
    end component;

begin

    alrt: alerta
    port map(
        MSE => sw(0),
        J1 => sw(1),
        P => sw(2),
        ALT1 => ledr(0),
        ALT2 => ledr(1)
    );

    caixas: Caixas_de_Agua
    port map(
        SA => sw(3 downto 4), -- Corrected to map the vector correctly
        SB => sw(5), -- You need to provide the input for SB
        CAB => ledr(9),
        EVA => ledr(8),
        ER => ledr(7)
    );

end main;

------------------------------------------------------------------------------

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


------------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------

