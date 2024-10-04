library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY counterr IS
    port(
        enable : in STD_LOGIC;
        clock  : in STD_LOGIC;
        reset  : in STD_LOGIC;
        count  : out STD_LOGIC_VECTOR(3 downto 0);
        ov     : out STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behav OF counterr IS

    SIGNAL counter_n : INTEGER := 0;

    BEGIN

        PROCESS(clock, reset) BEGIN
            IF rising_edge(clock) AND enable = '1' THEN
                IF counter_n = 9 THEN
                    counter_n <= 0;
                    ov <= '1';
                ELSE 
                    counter_n <= counter_n + 1;
                END IF;
            END IF;
            IF rising_edge(reset) THEN
                counter_n <= 0;
                ov <= '0';
            END IF;
        END PROCESS;
        
        process(counter_n) BEGIN
            count <= std_logic_vector(to_unsigned(counter_n, 4));
        END PROCESS;
    
END ARCHITECTURE;