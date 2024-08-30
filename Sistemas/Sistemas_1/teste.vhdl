library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BatNaval is
    port (
        input: in std_logic_vector(3 downto 0);
        action: in std_logic;
        reset: in std_logic;
        acerto: out std_logic;
        vitória: out std_logic
    );
end entity;

architecture bhv_BatNaval of BatNaval is
    
    type estadoJogo is (Conf, Atirando);
    signal estadoTiro : std_logic := '0';
    signal board: std_logic_vector(3 downto 0);
    signal cod: std_logic_vector(3 downto 0);

begin

    
end architecture;
