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
            clk     : in  std_logic;                      -- Sinal de clock
            reset   : in  std_logic;                      -- Sinal de reset
            enable  : in  std_logic;                      -- Habilitação do gerador
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