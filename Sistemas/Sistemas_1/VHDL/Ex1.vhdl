library ieee;
use ieee.std_logic_1164.all;

entity ou is port(
    a, b, c, d: in std_logic;
    s: out std_logic
);
end ou;

--------------------------------------

architecture ou_arch of ou is
begin
    s <= a OR b OR c OR d;
end ou_arch;

--------------------------------------