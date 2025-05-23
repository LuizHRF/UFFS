library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dealer is
    Port (
        start       : in  STD_LOGIC;
        clock       : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        nextCard    : in  STD_LOGIC_VECTOR(3 downto 0);

        getCard     : out STD_LOGIC;
        currentV    : out STD_LOGIC_VECTOR(4 downto 0);
        over        : out STD_LOGIC
    );
end dealer;

architecture Behavioral of dealer is

    TYPE state IS (X, X2, Y, Y2, Z, Z2, A, A2, C);
    SIGNAL current_state: state := X;
    signal hasA: std_logic;
    SIGNAL currentValue: unsigned(4 downto 0) := "00000";

    function novoValor(antigo: unsigned(4 downto 0); novo: unsigned(3 downto 0); hA: std_logic) return unsigned is  --- ha = HasA
        variable resultado: unsigned(4 downto 0);  -- Saída de 5 bits
    begin
        IF novo = 1 THEN
            IF hA = '1' THEN
                resultado := antigo + 1;  -- Ás valendo 1
            ELSE
                resultado := antigo + 11; -- Ás valendo 11
            END IF;
        ELSIF novo > 10 THEN
            resultado := antigo + 10;  -- Cartas de 10 a 13
        ELSE
            resultado := antigo + novo;
        END IF;
        
        return resultado;

    end function;

begin

    currentV <= STD_LOGIC_VECTOR(currentValue);

    process(clock, reset) begin

        IF reset = '1' THEN
            current_state <= X;


        ELSIF rising_edge(clock) THEN

            CASE current_state IS

                WHEN X => 
                    IF start = '1' THEN
                        current_state <= X2;
                    END IF;

                WHEN X2 =>
                    current_state <= Y;

                WHEN Y =>
                    current_state <= Y2;

                WHEN Y2 =>
                    current_state <= Z;
                
                WHEN Z =>

                    IF currentValue >= 17 THEN
                        current_state <= C;
                    ELSE
                        current_state <= Z2;
                    END IF;
                
                WHEN Z2 =>
                    current_state <= A;
                
                WHEN A =>

                    IF currentValue >= 17 THEN
                        current_state <= C;
                    ELSE
                        current_state <= A2;
                    END IF;

                WHEN A2 =>
                    current_state <= C;

                WHEN C =>
                    current_state <= C;

            END CASE;
        END IF;
    END process;
    
    process(current_state) begin

        CASE current_state IS

            WHEN X =>
                getCard <= '0';
                currentValue <= "00000";
                over <= '0';
                hasA <= '0';

            WHEN X2 =>
                getCard <='1';

            WHEN Y =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, unsigned(nextCard), hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN Y2 =>
                getCard <= '1';

            WHEN Z =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, unsigned(nextCard), hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;
            
            WHEN Z2 =>
                getCard <= '1';

            WHEN A =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, unsigned(nextCard), hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN A2 =>
                getCard <= '1';
                currentValue <= novovalor(currentValue, unsigned(nextCard), hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN C =>
                getCard <= '0';
                over <= '1';

        END CASE;
    END process;

end Behavioral;