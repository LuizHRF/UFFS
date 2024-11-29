library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity blackJack is
    Port (
        ledr: out std_logic_vector(9 downto 0);
        ledg: out std_logic_vector(6 downto 0);
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        hex0: out std_logic_vector(6 downto 0);
        hex1: out std_logic_vector(6 downto 0);
        hex2: out std_logic_vector(6 downto 0);
        hex3: out std_logic_vector(6 downto 0)

    );
end blackJack;

architecture Behavioral of blackJack is

    component cards is
        Port (
            clk     : in  std_logic;                      
            reset   : in  std_logic;                      
            enable  : in  std_logic;                      
            random_number : out std_logic_vector(3 downto 0)
        );
    end component;

    component dealer is
        Port (
            start       : in  STD_LOGIC;
            clock       : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            nextCard    : in  STD_LOGIC_VECTOR(3 downto 0);

            getCard     : out STD_LOGIC;
            currentV: out STD_LOGIC_VECTOR(4 downto 0);
            over        : out STD_LOGIC
        );
    end component;

    component player is
        Port (
            Hit         : in  STD_LOGIC;
            start       : in  STD_LOGIC;
            clock       : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            stay        : in  STD_LOGIC;
            nextCard    : in  STD_LOGIC_VECTOR(3 downto 0);

            getCard     : out STD_LOGIC;
            currentV: out STD_LOGIC_VECTOR(4 downto 0);
            over        : out STD_LOGIC
        );
    end component;

    component pontuacao is
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
    end component;

    component saida is
        Port (
            last_card       : in  STD_LOGIC_VECTOR(3 downto 0);
            result          : in STD_LOGIC_VECTOR(1 downto 0);  -- 00 = nada, 01 = vitória, 10 = derrota, 11 = empate
            pointsShown     : in STD_LOGIC_VECTOR(4 downto 0);
            cardRequest     : in STD_LOGIC;

            HEX0            : out STD_LOGIC_VECTOR(6 downto 0);
            HEX1            : out STD_LOGIC_VECTOR(6 downto 0);
            HEX2            : out STD_LOGIC_VECTOR(6 downto 0);
            HEX3            : out STD_LOGIC_VECTOR(6 downto 0);

            r1              : out STD_LOGIC;
            r2              : out STD_LOGIC
        );
    end component;
    
    SIGNAL cartas_aleatorias, reset, clock, hit, stay, start, start_dealer : STD_LOGIC;
    SIGNAL card_input : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL random_card : STD_LOGIC_VECTOR(3 downto 0);

    SIGNAL next_card : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL result : STD_LOGIC_VECTOR(1 downto 0);

    SIGNAL current_value_player, current_value_dealer, points_to_show : STD_LOGIC_VECTOR(4 downto 0);
    SIGNAL over_player, over_dealer : STD_LOGIC;

    SIGNAL card_request, cr1, cr2 : STD_LOGIC;
    
begin

    reset <= key(0);
    clock <= key(1);

    cartas_aleatorias <= sw(0);
    start <= sw(1);

    hit <= sw(2);
    stay <= sw(3);

    card_input(0) <= sw(6);
    card_input(1) <= sw(7);
    card_input(2) <= sw(8);
    card_input(3) <= sw(9);

    next_card <= card_input WHEN cartas_aleatorias = '0' ELSE random_card;
    card_request <= cr1 OR cr2;

    cards1: cards PORT MAP (
        clk => card_request,
        reset => '0',
        enable => '1',
        random_number => random_card
    );

    player1: player PORT MAP (
        Hit => hit,
        start => start,
        clock => clock,
        reset => reset,
        stay => stay,
        nextCard => next_card,

        getCard => cr1,
        currentV => current_value_player,
        over => over_player
    );

    pontuacao1: pontuacao PORT MAP (
        Stay_Player => over_player,
        points_player => current_value_player,
        stay_dealer => over_dealer,
        points_dealer => current_value_dealer,
        reset => reset,
        clock => clock,

        startDealer => start_dealer,
        result => result,
        pointsShown => points_to_show
    );

    dealer1: dealer PORT MAP (
        start => start_dealer,
        clock => clock,
        reset => reset,
        nextCard => next_card,

        getCard => cr2,
        currentV => current_value_dealer,
        over => over_dealer
    );

    saida1: saida PORT MAP (
        last_card => next_card,
        result => result,
        pointsShown => points_to_show,

        cardRequest => card_request,

        HEX0 => hex0,
        HEX1 => hex1,
        HEX2 => hex2,
        HEX3 => hex3,

        r1 => ledg(6),
        r2 => ledr(0)
    );

end Behavioral;

----------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity cards is
    port (
        clk     : in  std_logic;                      
        reset   : in  std_logic;                      
        enable  : in  std_logic;                      
        random_number : out std_logic_vector(3 downto 0)
    );
end cards;

architecture Behavioral of cards is
    signal lfsr : std_logic_vector(15 downto 0) := "1010110010100000";  -- SEED
    signal rnd_int : integer range 1 to 52;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            lfsr <= "1110110010101110";
        elsif rising_edge(clk) then
            if enable = '1' then
                -- Implementação do LFSR com feedback polinomial
                -- Polinômio: x^16 + x^14 + x^13 + x^11 + 1
                lfsr <= lfsr(14 downto 0) & 
                        (lfsr(15) xor lfsr(13) xor lfsr(12) xor lfsr(10));
            end if;
        end if;
    end process;

    -- Converte o LFSR para número no intervalo de 1 a 13
    rnd_int <= (to_integer(unsigned(lfsr)) mod 13) + 1;

    random_number <= std_logic_vector(to_unsigned(rnd_int, 4));
end Behavioral;

----------------------------------------------------------------------------------------------------------

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
        currentV: out STD_LOGIC_VECTOR(4 downto 0);
        over        : out STD_LOGIC
    );
end dealer;

architecture Behavioral of dealer is

    TYPE state IS (X, X2, Y, Y2, Z, Z2, A, A2, C);
    SIGNAL current_state: state := X;
    signal hasA: std_logic;
    SIGNAL currentValue: std_logic_vector(4 downto 0) := "00000";

    function novoValor(antigo: std_logic_vector(4 downto 0); novo: std_logic_vector(3 downto 0); hA: std_logic) return std_logic_vector is  --- ha = HasA
        variable resultado: std_logic_vector(4 downto 0);  -- Saída de 5 bits
    begin
        IF novo = "0001" THEN
            IF hA = '1' THEN
                resultado := antigo + "00001";  -- Ás valendo 1
            ELSE
                resultado := antigo + "01011"; -- Ás valendo 11
            END IF;
        ELSIF novo > "01010" THEN
            resultado := antigo + "01010";  -- Cartas de 10 a 13
        ELSE
            resultado := antigo + ("0" & novo);
        END IF;
        
        return resultado;

    end function;

begin

    currentV <= currentValue;

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

                    IF currentValue >= "10001" THEN
                        current_state <= C;
                    ELSE
                        current_state <= Z2;
                    END IF;
                
                WHEN Z2 =>
                    current_state <= A;
                
                WHEN A =>

                    IF currentValue >= "10001" THEN
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
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN Y2 =>
                getCard <= '1';

            WHEN Z =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;
            
            WHEN Z2 =>
                getCard <= '1';

            WHEN A =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN A2 =>
                getCard <= '1';
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN C =>
                getCard <= '0';
                over <= '1';

        END CASE;
    END process;

end Behavioral;

----------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity player is
    Port (
        Hit         : in  STD_LOGIC;
        start       : in  STD_LOGIC;
        clock       : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        stay        : in  STD_LOGIC;
        nextCard    : in  STD_LOGIC_VECTOR(3 downto 0);

        getCard     : out STD_LOGIC;
        currentV: out STD_LOGIC_VECTOR(4 downto 0);
        over        : out STD_LOGIC
    );
end player;

architecture Behavioral of player is

    TYPE state IS (X, X2, Y, Y2, Z, Z2, A, A2, C);
    SIGNAL current_state: state := X;
    signal hasA: std_logic;
    SIGNAL currentValue: std_logic_vector(4 downto 0) := "00000";

    function novoValor(antigo: std_logic_vector(4 downto 0); novo: std_logic_vector(3 downto 0); hA: std_logic) return std_logic_vector is  --- ha = HasA
        variable resultado: std_logic_vector(4 downto 0);  -- Saída de 5 bits
    begin
        IF novo = "0001" THEN
            IF hA = '1' THEN
                resultado := antigo + "00001";  -- Ás valendo 1
            ELSE
                resultado := antigo + "01011"; -- Ás valendo 11
            END IF;
        ELSIF novo > "01010" THEN
            resultado := antigo + "01010";  -- Cartas de 10 a 13
        ELSE
            resultado := antigo + ("0" & novo);
        END IF;
        
        return resultado;

    end function;

begin

    currentV <= currentValue;

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

                    IF stay = '1' OR currentValue >= "10101" THEN
                        current_state <= C;
                    ELSIF Hit = '1' THEN
                        current_state <= Z2;
                    END IF;
                
                WHEN Z2 =>
                    current_state <= A;
                
                WHEN A =>

                    IF stay = '1' OR currentValue >= "10101" THEN
                        current_state <= C;
                    ELSIF Hit = '1' THEN
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
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN Y2 =>
                getCard <= '1';

            WHEN Z =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;
            
            WHEN Z2 =>
                getCard <= '1';

            WHEN A =>
                getCard <= '0';
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN A2 =>
                getCard <= '1';
                currentValue <= novovalor(currentValue, nextCard, hasA);

                IF nextCard = "0001" THEN  -- Se a última carta foi o Ás
                    hasA <= '1';
                END IF;

            WHEN C =>
                getCard <= '0';
                over <= '1';

        END CASE;
    END process;

end Behavioral;

----------------------------------------------------------------------------------------------------------

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

    TYPE state IS (A, C, E, F, G, H, I);
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
                        current_state <= E;
                    END IF;

                WHEN C =>
                    current_state <= C;

                WHEN E =>
                    IF stay_dealer = '1' THEN
                        IF points_dealer > "10101" THEN
                            current_state <= F;
                        ELSIF points_dealer = points_player THEN
                            current_state <= G;
                        ELSIF points_dealer < points_player THEN
                            current_state <= H;
                        ELSIF points_dealer > points_player THEN
                            current_state <= I;
                        END IF;
                    ELSE 
                        current_state <= E;
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
                dealer_playing <= '0';

            WHEN E =>
                dealer_playing <= '1';

            WHEN F =>
                result <= "01";
                dealer_playing <= '0';

            WHEN G =>
                result <= "11";
                dealer_playing <= '0';

            WHEN H =>
                result <= "01";
                dealer_playing <= '0';

            WHEN I =>
                result <= "10";
                dealer_playing <= '0';

        END CASE;
    END process;
end Behavioral;

----------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity saida is
    Port (
        last_card       : in  STD_LOGIC_VECTOR(3 downto 0);
        result          : in STD_LOGIC_VECTOR(1 downto 0);  -- 00 = nada, 01 = vitória, 10 = derrota, 11 = empate
        pointsShown     : in STD_LOGIC_VECTOR(4 downto 0);

        cardRequest     : in STD_LOGIC;

        HEX0            : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1            : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2            : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3            : out STD_LOGIC_VECTOR(6 downto 0);

        r1              : out STD_LOGIC;
        r2              : out STD_LOGIC
    );
end saida;

architecture Behavioral of saida is

    function seven_segment_decoder(digit: std_logic_vector(3 downto 0)) return std_logic_vector is
            variable segments: std_logic_vector(6 downto 0);
        begin
            case digit is
                when "0000" => segments := "1000000"; -- 0
                when "0001" => segments := "1111001"; -- 1
                when "0010" => segments := "0100100"; -- 2
                when "0011" => segments := "0110000"; -- 3
                when "0100" => segments := "0011001"; -- 4
                when "0101" => segments := "0010010"; -- 5
                when "0110" => segments := "0000010"; -- 6
                when "0111" => segments := "1111000"; -- 7
                when "1000" => segments := "0000000"; -- 8
                when "1001" => segments := "0010000"; -- 9
                when others => segments := "1111111";
            end case;
            return segments;
    end function;

    signal un : std_logic_vector(3 downto 0);
    signal tens  : std_logic_vector(3 downto 0);

begin
    
    HEX2 <= "0111111";

    process(cardRequest) begin
        case last_card is
            when "0001" => HEX3 <= "1111001";
            when "0010" => HEX3 <= "0100100";
            when "0011" => HEX3 <= "0110000";
            when "0100" => HEX3 <= "0011001";
            when "0101" => HEX3 <= "0010010";
            when "0110" => HEX3 <= "0000010";
            when "0111" => HEX3 <= "1111000";
            when "1000" => HEX3 <= "0000000";
            when "1001" => HEX3 <= "0010000";
            when "1010" => HEX3 <= "0001000";
            when "1011" => HEX3 <= "0000011";
            when "1100" => HEX3 <= "1000110";
            when "1101" => HEX3 <= "0100001";
            when others => HEX3 <= "0000000";
        end case;
    end process;
    
    r1 <= result(0);
    r2 <= result(1);

    process(pointsShown)
    begin
        -- Dividir o valor em dezenas e unidades
        tens <= std_logic_vector(to_unsigned(to_integer(unsigned(pointsShown)) / 10, 4));
        un <= std_logic_vector(to_unsigned(to_integer(unsigned(pointsShown)) mod 10, 4));

    end process;

    HEX0 <= seven_segment_decoder(un);
    HEX1 <= seven_segment_decoder(tens);

end Behavioral;