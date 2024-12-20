
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity portao is
    Port (
        ledr: out std_logic_vector(9 downto 0);
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        hex0: out std_logic_vector(6 downto 0)
    );
end portao;

architecture Behavioral of portao is

    component motor is port (
        ledr: out std_logic_vector(9 downto 0);
        Fecha, Abre, S, clock, r : in STD_LOGIC;
        hex0: out std_logic_vector(6 downto 0)
    );
    end component;

    component sensores is port (
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        Fecha, Abre, Sout : out STD_LOGIC;
        SA, SF, r: in STD_LOGIC
    );
    end component;

    SIGNAL Fecha_sig, Abre_sig, Sout, reset: STD_LOGIC;
    SIGNAL meanLedr: STD_LOGIC_VECTOR(9 downto 0);

begin
    
    reset <= key(1);
    ledr <= meanLedr;

    sensores_inst: sensores port map (
        sw => sw,
        key => key,
        Fecha => Fecha_sig,
        Abre => Abre_sig,
        Sout => Sout,
        SA => meanLedr(0),
        SF => meanLedr(1),
        r => reset
    );

    motor_inst: motor port map (
        ledr => meanLedr,
        Fecha => Fecha_sig,
        Abre => Abre_sig,
        S => Sout,
        clock => key(3),
        hex0 => hex0,
        r => reset
    );
    
    
end Behavioral;


--------------------------------------------------------------------------------

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
    SIGNAL procs: STD_LOGIC;
    SIGNAL pos, res: STD_LOGIC := '0';


begin

    ledr(0) <= pos AND NOT procs;     -- Porta aberta
    ledr(1) <= NOT pos AND NOT procs; -- Porta fechada
    ledr(2) <= procs;   -- Processando


    process(clock, r) begin  

        IF r = '1' THEN
            current_state <= E;

        ELSIF falling_edge(clock) THEN
                
                CASE current_state IS
                    WHEN E =>
                        IF S = '1' THEN
                            IF pos = '1' THEN
                                current_state <= ER1;
                            ELSIF pos = '0' THEN
                                current_state <= ER2;
                            END IF;
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

--------------------------------------------------------------------------------

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

        IF r = '1' THEN
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
                        ELSIF SF = '1' THEN 
                            current_state <= B;
                        ELSE
                            current_state <= A;
                        END IF;
                    WHEN C =>
                        IF Sin = '1' THEN
                            current_state <= D;
                        ELSIF SA = '1' THEN 
                            current_state <= C;
                        else
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