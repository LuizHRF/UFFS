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

    TYPE Tipo_estado IS (U, D);
    TYPE Tipo_andar IS (A, B, C, D, M);
    SIGNAL y: Tipo_estado;
    SIGNAL x, andarAtual: Tipo_andar;

    BEGIN 


        process(reset, clock) begin

            if reset = '1' then 
            y <= A;

            elsif(clock'event and clock = '1') then

                case y is   

                    when A =>

                        if(andarIn > andarAtual) then
                            y <= B;
                        elsif(andarIn < andarAtual) then
                            y <= C;
                        end if;

                    when B =>

                        andarAtual <= std_logic_vector(unsigned(andarAtual) + unsigned(v1)); 
                        if(andarIn = andarAtual) then
                            y <= A;
                        end if;

                    when C =>

                        andarAtual <= std_logic_vector(unsigned(andarAtual) - unsigned(v1)); 
                        if(andarIn = andarAtual) then
                            y <= A;
                        end if;

                end case;

            end if;

        end process;

        process(x)

            case x is

                when A => andarOut <= "00";
                when B => andarOut <= "01";
                when C => andarOut <= "10";
                when D => andarOut <= "11";
                when M =>

            end case;

        end process;               

    END bhv_elevador;

