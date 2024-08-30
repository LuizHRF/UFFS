library ieee;
use ieee.std_logic_1164.all;

entity fourbit_add is
port(
    a: in std_logic_vector(3 downto 0);
    b: in std_logic_vector(3 downto 0);
    carry_out: out std_logic;
    sum: out std_logic_vector(3 downto 0);
    carry_in: in std_logic
);
end fourbit_add;

----------------------------------------------
architecture behave_fourb of fourbit_add is

    signal x, y, z: STD_LOGIC;

    component full_add is
        port(
            a, b, carry_in: in std_logic;
            carry_out, sum: out std_logic
        );
    end component full_add;

    begin

        fa1: component full_add port map(
            a => a(0),
            b => b(0),
            carry_in => carry_in,
            carry_out => x,
            sum => sum(0)
        );

        fa2: component full_add port map(
            a => a(1),
            b => b(1),
            carry_in => x,
            carry_out => y,
            sum => sum(1)
        );

        fa3: component full_add port map(
            a => a(2),
            b => b(2),
            carry_in => y,luizhrigofaccio@outlook.com
            carry_out => z,
            sum => sum(2)
        );

        fa4: component full_add port map(
            a => a(3),
            b => b(3),
            carry_in => z,
            carry_out => carry_out,
            sum => sum(3)
        );    

    end behave_fourb;

----------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity full_add is
port(
    a, b, carry_in: in std_logic;
    carry_out, sum: out std_logic
);
end full_add;

----------------------------------------------

architecture behave_fadd of full_add is

    signal x, y, z: STD_LOGIC;

    component half_add is
    port(
        a,b: in std_logic;
        carry, sum: out std_logic
    );
    end component half_add;

    begin

        ha1: component half_add port map(
            a => a,
            b => b,
            carry => x,
            sum => y
        );

        ha2: component half_add port map(
            a => y,
            b => carry_in,
            sum => sum,
            carry => z
        );  

        carry_out <= z OR x;

    end behave_fadd;

---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity half_add is
port(
    a,b: in std_logic;
    carry, sum: out std_logic
);
end half_add;

---------------------------------------------

architecture behav_add of half_add is
begin

    carry <= a AND b;
    sum <= a XOR b;

end behav_add;
 
----------------------------------------------
