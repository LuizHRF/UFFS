library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Elevador is
    port (
        clock : in std_logic;
        reset : in std_logic;
        chamada : in std_logic_vector(1 downto 0);
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

        
        case estadoAtual is

            when P =>

                proxAndar <= sensor;
                --proxEstado <= P;

            when S =>

                if sensor = "00" then
                        proxAndar <= "01";
                    elsif sensor = "01" then   
                        proxAndar <= "10";
                    elsif sensor = "10" then    
                        proxAndar <= "11";
                    elsif sensor = "11" then
                        proxAndar <= sensor;
                    end if;

            when D =>

                if sensor = "00" then   
                    proxAndar <= sensor;
                elsif sensor = "01" then 
                    proxAndar <= "00";
                elsif sensor = "10" then    
                    proxAndar <= "01";
                elsif sensor = "11" then
                    proxAndar <= "10";
                end if; 

            end case;

        if (proxAndar = chamada) then
            proxEstado <= P;
            estadoAtual <= P;
        elsif proxAndar < chamada then
            proxEstado <= S;
            estadoAtual <= S;
        elsif proxAndar > chamada then
            proxEstado <= D;
            estadoAtual <= D;
        end if;

        end if;
    end process;

    process (proxAndar, proxEstado)
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
