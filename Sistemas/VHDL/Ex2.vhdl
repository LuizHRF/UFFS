library ieee;
use ieee.std_logic_1164.all;

entity ou_vec is port(
    a, b, c, d: in std_logic_vector (3 downto 0);
    s: out std_logic_vector(3 downto 0)
);
end ou_vec;

--------------------------------------

architecture ou_arch of ou_vec is
begin
    process(a, b, c, d) begin
        for i in 0 to 3 loop
            s(i) <= a(i) OR b(i) OR c(i) OR d(i);
        end loop;
    end process;

end ou_arch;

--------------------------------------