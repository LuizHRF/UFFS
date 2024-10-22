library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sensores is
    Port (
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        Fecha, Abre, Sout : out STD_LOGIC;
        SA, SF, r: in STD_LOGIC
    );
end sensores;

architecture Behavioral of sensores is

    TYPE state IS (A, B, C, D);
    SIGNAL current_state: state := A;
    SIGNAL Bot, Sin, clock: STD_LOGIC;


begin

    Sin <= sw(0);
    Sout <= Sin;

    Bot <= key(0);
    clock <= key(3);


    process(clock, r) begin  

        IF rising_edge(r) THEN
            current_state <= A;

        ELSIF rising_edge(clock) THEN
                
                CASE current_state IS
                    WHEN A =>
                        IF SA = '1' AND Bot = '1' THEN
                            current_state <= B;
                        elsif SF = '1' AND Bot = '1' THEN
                            current_state <= C;
                        elsif Sin = '1' THEN
                            current_state <= D;
                        END IF;
                    WHEN B =>
                        IF Sin = '1' THEN
                            current_state <= D;
                        ELSE 
                            current_state <= A;
                        END IF;
                    WHEN C =>
                        IF Sin = '1' THEN
                            current_state <= D;
                        ELSE 
                            current_state <= A;    
                        END IF;
                    WHEN D =>
                        IF Sin = '1' THEN
                            current_state <= D;
                        ELSE 
                            current_state <= A;
                        END IF;
                END CASE;
            
        END IF;
            
    end process;

    process(current_state) begin  

        case current_state is
            when A =>
                Abre <= '0';
                Fecha <= '0';
                Sout <= '0';
            when B =>
                Abre <= '0';
                Fecha <= '1';
                Sout <= '0';
            when C =>
                Abre <= '1';
                Fecha <= '0';
                Sout <= '0';
            when D =>
            
                Abre <= '0';
                Fecha <= '0';
                Sout <= '1';
        end case;
    end process;
               
end Behavioral;