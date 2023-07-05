library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Elevador is
    port (
        clock : in std_logic;
        reset : in std_logic;
        chamada : in std_logic_vector(3 downto 0);
        sensor : in std_logic_vector(1 downto 0);
        subindo : out std_logic;
        descendo : out std_logic;
        andarAtual : out std_logic_vector(1 downto 0)
    );
end entity;

architecture bhv_Elevador of Elevador is
    type estadoElevador is (P, S, D);
    signal estadoAtual : estadoElevador := P;
    signal proxEstado : estadoElevador := P;
    signal proxAndar : std_logic_vector(1 downto 0) := "00";
    signal v1: std_logic_vector(1 downto 0) := "01";
begin
    process (clock, reset)
    begin
        if reset = '1' then
            estadoAtual <= P;
            proxEstado <= P;
            proxAndar <= "00";
        elsif clock'event and clock = '1' then
            estadoAtual <= proxEstado;
        end if;
    end process;

    process (estadoAtual, chamada, sensor)
    begin
        case estadoAtual is
            when P =>
                if chamada /= "0000" then
                    if (sensor = chamada) then
                        proxEstado <= P;
                    elsif sensor < chamada then
                        proxEstado <= S;
                    elsif sensor > chamada then
                        proxEstado <= D;
                    end if;
                else
                    proxEstado <= P;
                    proxAndar <= sensor;
                end if;
            when S =>
                proxAndar <= std_logic_vector(unsigned(andarAtual) + unsigned(v1));
                if proxAndar = sensor then
                    proxEstado <= P;
                else
                    proxEstado <= S;
                end if;
            when D =>
                proxAndar <= std_logic_vector(unsigned(andarAtual) - unsigned(v1));
                if proxAndar = sensor then
                    proxEstado <= P;
                else
                    proxEstado <= D;
                end if;   
        end case;
    end process;

    process (estadoAtual, proxEstado, sensor)
    begin
        case estadoAtual is
            when P =>
                subindo <= '0';
                descendo <= '0';
            when S =>
                subindo <= '1';
                descendo <= '0';
            when D =>
                subindo <= '0';
                descendo <= '1';
        end case;

        if estadoAtual = P then
            andarAtual <= sensor;
        else
            andarAtual <= proxAndar;
        end if;
    end process;
end architecture;
