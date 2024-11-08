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

        ledg            : out STD_LOGIC_VECTOR(6 downto 0);
        ledr            : out STD_LOGIC_VECTOR(9 downto 0)
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
    
    ledg(6) <= result(0);
    ledr(0) <= result(1);

    process(pointsShown)
    begin
        -- Dividir o valor em dezenas e unidades
        tens <= std_logic_vector(to_unsigned(to_integer(unsigned(pointsShown)) / 10, 4));
        un <= std_logic_vector(to_unsigned(to_integer(unsigned(pointsShown)) mod 10, 4));

    end process;

    HEX0 <= seven_segment_decoder(un);
    HEX1 <= seven_segment_decoder(tens);

end Behavioral;