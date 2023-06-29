library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity elevador is
port(
    andarIn: in std_logic_vector(1 downto 0); --00: primeiro andar, 01: segundo andar, 10: terceiro andar e 11: quarto andar
    reset: in std_logic;
    clock: in std_logic;
    w: out std_logic_vector (1 downto 0); --00: parado, 01: subindo. 10:descendo
    andarOut: out std_logic_vector(1 downto 0)
);
end elevador;

architecture bhv_elevador of elevador is

    signal andarAtual, estado: std_logic_vector(1 downto 0);
    signal v1: std_logic_vector(1 downto 0):= "01";

    begin

        process(clock, reset) begin

            if reset'event and reset = '1' then
                andarAtual <= "00";
                estado <= "00";
            end if;

            if clock'event and clock = '1' then
            
                if(andarIn > andarAtual) then
                    estado <= "01";
                    --andarAtual <= std_logic_vector(unsigned(andarAtual) + unsigned(v1));
                    
                elsif(andarIn < andarAtual) then
                    estado <= "10";
                    --andarAtual <= std_logic_vector(unsigned(andarAtual) - unsigned(v1));
                else 
                    estado <= "00";
                end if;
                
            end if;

        end process;

        process(w) begin

            if w = "01" then

                andarAtual <= std_logic_vector(unsigned(andarAtual) + unsigned(v1));

            elsif w = "10" then

                andarAtual <= std_logic_vector(unsigned(andarAtual) - unsigned(v1));

            end if;

        end process;

            andarOut <= andarAtual;
            w <= estado;


    end bhv_elevador;

