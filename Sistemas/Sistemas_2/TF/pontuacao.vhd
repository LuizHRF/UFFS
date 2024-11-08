library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pontuacao is
    Port (
        Stay_Player     : in  STD_LOGIC;
        points_player    : in  STD_LOGIC_VECTOR(4 downto 0);
        stay_dealer     : in  STD_LOGIC;
        points_dealer   : in  STD_LOGIC_VECTOR(4 downto 0);
        reset           : in  STD_LOGIC;
        clock           : in  STD_LOGIC;

        startDealer     : out STD_LOGIC;
        result          : out STD_LOGIC_VECTOR(1 downto 0);  -- 00 = nada, 01 = vitória, 10 = derrota, 11 = empate

        pointsShown     : out STD_LOGIC_VECTOR(4 downto 0)
    );
end pontuacao;

architecture Behavioral of pontuacao is

    TYPE state IS (A, C, D, E, F, G, H, I);
    SIGNAL current_state: state := A;
    SIGNAL dealer_playing: std_logic := '0';

begin   

    startDealer <= dealer_playing;
    pointsShown <= points_player WHEN dealer_playing = '0' ELSE points_dealer;

    process(clock, reset) begin

        IF reset = '1' THEN
            current_state <= A;

        ELSIF rising_edge(clock) THEN

            CASE current_state IS

                WHEN A => 
                    IF Stay_Player = '1' AND points_player > "10101" THEN
                        current_state <= C;
                    ELSIF Stay_Player = '1' AND points_player <= "10101" THEN
                        current_state <= D;
                    END IF;

                WHEN C =>
                    current_state <= C;

                WHEN D =>
                    IF stay_dealer = '0' THEN
                        current_state <= D;
                    ELSIF stay_dealer = '1' THEN
                        current_state <= E;
                    END IF;

                WHEN E =>
                    IF points_dealer > "10101" THEN
                        current_state <= F;
                    ELSIF points_dealer = points_player THEN
                        current_state <= G;
                    ELSIF points_dealer < points_player THEN
                        current_state <= H;
                    ELSIF points_dealer > points_player THEN
                        current_state <= I;
                    END IF;

                WHEN F =>
                    current_state <= F;
                
                WHEN G =>
                    current_state <= G;

                WHEN H =>
                    current_state <= H;

                WHEN I =>
                    current_state <= I;

                END CASE;
            END IF;
        END process;
    
    process(current_state) begin

        CASE current_state IS

            WHEN A =>
                dealer_playing <= '0';
                result <= "00";

            WHEN C =>
                result <= "10";

            WHEN D =>
                dealer_playing <= '1';

            WHEN E =>
                result <= "00";

            WHEN F =>
                result <= "01";

            WHEN G =>
                result <= "11";

            WHEN H =>
                result <= "01";

            WHEN I =>
                result <= "10";

        END CASE;
    END process;
end Behavioral;