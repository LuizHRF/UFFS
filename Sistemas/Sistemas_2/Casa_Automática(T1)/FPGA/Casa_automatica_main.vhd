
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
        ALT1: out std_logic
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
        ALT1 => ledr(0)
    );

    caixas: Caixas_de_Agua
    port map(
        SA => sw(4 downto 3), 
        SB => sw(5),
        CAB => ledr(9),
        EVA => ledr(8),
        ER => ledr(7)
    );

end main;



