library ieee;
use ieee.std_logic_1164.all;

entity ou is port(
    a, b, c: in std_logic;
    e, f, d: out std_logic
);
end ou;

--------------------------------------

architecture ou_arch of ou is
begin
    d <= not(a OR not b) XOR (not b and not c);
    e <= not(not b and not c ) or not b;
    f <= not(not b and not c) XOR not(b or c);
end ou_arch;

--------------------------------------