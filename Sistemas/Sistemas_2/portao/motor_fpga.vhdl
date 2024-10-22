library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity motor is
    Port (
        ledr: out std_logic_vector(9 downto 0);
        Fecha, Abre, S, clock, r : in STD_LOGIC;
        hex0: out std_logic_vector(6 downto 0)
    );
end motor;

architecture Behavioral of motor is

    TYPE state IS (E, A1, A2, A3, A4, F1, F2, F3, F4, ER1, ER2);
    SIGNAL current_state: state := E;
    SIGNAL Porta_aberta, Porta_fechada, procs: STD_LOGIC;
    SIGNAL pos, res: STD_LOGIC := '0';


begin

    ledr(0) <= pos AND NOT procs;     -- Porta aberta
    ledr(1) <= NOT pos AND NOT procs; -- Porta fechada
    ledr(2) <= procs;   -- Processando


    process(clock, r) begin  

        IF rising_edge(r) THEN
            current_state <= E;
            res <= '1';

        ELSIF rising_edge(clock) THEN
                
                CASE current_state IS
                    WHEN E =>
                        IF S = '1' THEN
                            current_state <= E;
                        elsif Abre = '1' THEN
                            current_state <= A1;
                        elsif Fecha = '1' THEN
                            current_state <= F1;
                        END IF;
                    WHEN A1 =>
                        IF S = '1' THEN
                            current_state <= ER2;
                        ELSE 
                            current_state <= A2;
                        END IF;
                    WHEN A2 =>
                        IF S = '1' THEN
                            current_state <= ER2;
                        ELSE 
                            current_state <= A3;
                        END IF;
                    WHEN A3 =>
                        IF S = '1' THEN
                            current_state <= A2;
                        ELSE 
                            current_state <= A4;
                        END IF;
                    WHEN A4 =>
                        IF S = '1' THEN
                            current_state <= A3;
                        ELSE 
                            current_state <= E;
                        END IF;
                    WHEN F1 =>
                        IF S = '1' THEN
                            current_state <= ER1;
                        ELSE 
                            current_state <= F2;
                        END IF;
                    WHEN F2 =>
                        IF S = '1' THEN
                            current_state <= ER1;
                        ELSE 
                            current_state <= F3;
                        END IF;
                    WHEN F3 =>
                        IF S = '1' THEN
                            current_state <= F2;
                        ELSE 
                            current_state <= F4;
                        END IF;
                    WHEN F4 =>
                        IF S = '1' THEN
                            current_state <= F3;
                        ELSE 
                            current_state <= E;
                        END IF;
                    WHEN ER1 =>
                        IF S = '0' THEN
                            current_state <= E;
                        END IF;
                    WHEN ER2 =>
                        IF S = '0' THEN
                            current_state <= E;
                        END IF;
                END CASE;
            
        END IF;
            
    end process;

    process(current_state) begin  
        CASE current_state IS
            WHEN E =>
                procs <= '0';
                --estado <= "0000";
                hex0 <= "1000000";

                IF res = '1' THEN
                    pos <= '0';
                    res <= '0';
                END IF;

            WHEN A1 =>
                procs <= '1';
                --estado <= "0001";
                hex0 <= "1111001";
            WHEN A2 =>
                procs <= '1';
                --estado <= "0010";
                hex0 <= "0100100";
            WHEN A3 =>
                procs <= '1';
                --estado <= "0011";
                hex0 <= "0110000";
            WHEN A4 =>
                procs <= '1';
                pos <= NOT pos;
                --estado <= "0100";
                hex0 <= "0011001";
            WHEN F1 =>
                procs <= '1';
                --estado <= "0101";
                hex0 <= "1111001";
            WHEN F2 =>
                procs <= '1';
                --estado <= "0110";
                hex0 <= "0100100";
            WHEN F3 =>
                procs <= '1';
                --estado <= "0111";
                hex0 <= "0110000";
            WHEN F4 =>
                procs <= '1';
                pos <= NOT pos;
                --estado <= "1000";
                hex0 <= "0011001";
            WHEN ER1 =>
                procs <= '0';
                pos <= '1';
                --estado <= "1001";
                hex0 <= "0000110";
            WHEN ER2 =>
                pos <= '0';
                procs <= '0';
                --estado <= "1010";
                hex0 <= "0000110";
        END CASE;
    end process;
               
end Behavioral;