library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Elevador is
    port (

        KEY: IN std_logic_vector(3 downto 0);
        SW: IN std_logic_vector(9 downto 0);

        LEDG: out std_logic_vector(7 downto 0)
    );
end entity;

architecture bhv_Elevador of Elevador is
    
    type estadoElevador is (P, S, D);
    signal estadoAtual : estadoElevador := P;
    signal proxEstado : estadoElevador := P;
    signal proxAndar : std_logic_vector(1 downto 0) := "00";
    signal sensor: std_logic_vector(1 downto 0) := "00";
    signal temp: std_logic_vector(1 downto 0);
    signal chamada: std_logic_vector(1 downto 0);
    signal subindo, descendo: std_logic;
    signal andarAtual: std_logic_vector(1 downto 0);

begin


    process (KEY(0), KEY(1))
    begin

        chamada(0) <= SW(0); 
        chamada(1) <= SW(1);
        sensor <= temp;

        if KEY(1) = '1' then
            estadoAtual <= P;
            proxEstado <= P;
            proxAndar <= "00";

        elsif KEY(0)'event and KEY(0) = '1' then

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

        if (sensor = chamada) then
            proxEstado <= P;
            estadoAtual <= P;
        elsif sensor < chamada then
            proxEstado <= S;
            estadoAtual <= S;
        elsif sensor > chamada then
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
            temp <= sensor;
            andarAtual <= temp;
        else
            temp <= proxAndar;
            andarAtual <= temp;
        end if;
    end process;

    process(andarAtual, subindo, descendo) begin

        LEDG(7) <= subindo;
        LEDG(6) <= descendo;
        LEDG(0) <= andarAtual(0);
        LEDG(1) <= andarAtual(1);
    
    END PROCESS;

end architecture;
