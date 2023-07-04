library IEEE;
use IEEE.std_logic_1164.all;

entity Elevador is
    port (
        clock : in std_logic;
        reset : in std_logic;
        chamada : in std_logic_vector(3 downto 0);
        sensor : in std_logic_vector(3 downto 0);
        subindo : out std_logic;
        descendo : out std_logic;
        andarAtual : out std_logic_vector(1 downto 0)
    );
end entity;

architecture bhv_Elevador of Elevador is
    type estadoElevador is (parado, subindo, descendo, movendo);
    signal estadoAtual : estadoElevador;
    signal proxEstado : estadoElevador;
    signal proxAndar : std_logic_vector(1 downto 0);
begin
    process (clock, reset)
    begin
        if reset = '1' then
            estadoAtual <= parado;
            proxEstado <= parado;
            proxAndar <= "00";
        elsif rising_edge(clock) then
            estadoAtual <= proxEstado;
        end if;
    end process;

    process (estadoAtual, chamada, sensor)
    begin
        case estadoAtual is
            when parado =>
                if chamada /= "0000" then
                    if (sensor = chamada) then
                        proxEstado <= parado;
                    elsif sensor < chamada then
                        proxEstado <= subindo;
                    elsif sensor > chamada then
                        proxEstado <= descendo;
                    end if;
                else
                    proxEstado <= parado;
                    proxAndar <= sensor;
                end if;
            when subindo =>
                if proxAndar = sensor then
                    proxEstado <= parado;
                else
                    proxEstado <= movendo;
                end if;
            when descendo =>
                if proxAndar = sensor then
                    proxEstado <= parado;
                else
                    proxEstado <= movendo;
                end if;
            when movendo =>
                if proxAndar < sensor then
                    proxEstado <= subindo;
                else
                    proxEstado <= descendo;
                end if;

           if estadoAtual = movendo then
                if estadoAtual = subindo then
                    proxAndar <= andarAtual + 1;
                else
                    proxAndar <= andarAtual - 1;
                end if;
            
            andarAtual <= proxAndar;
             
          end if;     
        end case;
    end process;

    process (estadoAtual, proxEstado, sensor)
    begin
        case estadoAtual is
            when parado =>
                subindo <= '0';
                descendo <= '0';
            when subindo =>
                subindo <= '1';
                descendo <= '0';
            when descendo =>
                subindo <= '0';
                descendo <= '1';
            when movendo =>
                subindo <= '0';
                descendo <= '0';
        end case;

        if estadoAtual = parado then
            andarAtual <= sensor;
        else
            andarAtual <= proxAndar;
        end if;
    end process;
end architecture;
