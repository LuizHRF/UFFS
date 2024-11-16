library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Necessário para conversões entre tipos

entity random_generator is
    port (
        clk     : in  std_logic;                      -- Sinal de clock
        reset   : in  std_logic;                      -- Sinal de reset
        enable  : in  std_logic;                      -- Habilitação do gerador
        random_number : out std_logic_vector(3 downto 0)
    );
end random_generator;

architecture Behavioral of random_generator is
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
