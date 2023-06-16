library ieee;
use ieee.std_logic_1164.all;

entity decod is port(
    entrada: in std_logic_vector(4 downto 0);
    out1, out2, out3, out4, out5: out std_logic
); 
end decod;

architecture dec of decod is
    begin
    process(entrada) begin
        if entrada(0) = '1' then out1<='1'; else out1<='0'; end if;
        if entrada(1) = '1' then out2<='1'; else out2<='0'; end if;
        if entrada(2) = '1' then out3<='1'; else out3<='0'; end if;
        if entrada(3) = '1' then out4<='1'; else out4<='0'; end if;
        if entrada(4) = '1' then out5<='1'; else out5<='0'; end if;
    end process;
end dec;