----------------------------------------
--ENTITY Somador de 3 bits
-----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder3bits IS 
PORT (
        a_f3, b_f3: in STD_LOGIC_VECTOR(2 DOWNTO 0);
        overflow: out STD_LOGIC;
        sum: out STD_LOGIC_VECTOR(2 DOWNTO 0)
);
END ENTITY adder3bits;

ARCHITECTURE behav_estrutural OF adder3bits is
    
    component full_adder IS
        PORT (
            a_f,b_f: in STD_LOGIC;
            carry_in: in STD_LOGIC;
            carry_out, sum: out STD_LOGIC
        );
    END component;

    signal carry1, carry2: STD_LOGIC;

BEGIN
    fa0: full_adder port map(
        a_f => a_f3(0),
        b_f => b_f3(0),
        carry_in => '0',
        carry_out => carry1,
        sum => sum(0)
    );

    fa1: full_adder port map(
        a_f => a_f3(1),
        b_f => b_f3(1),
        carry_in => carry1,
        carry_out => carry2,
        sum => sum(1)
    );

    fa3: full_adder port map(
        a_f => a_f3(2),
        b_f => b_f3(2),
        carry_in => carry2,
        carry_out => overflow,
        sum => sum(2)
    );

END behav_estrutural;

----------------------------------------
--ENTITY full_adder
-----------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder IS
    PORT (
       a_f,b_f: in STD_LOGIC;
       carry_in: in STD_LOGIC;
       carry_out, sum: out STD_LOGIC
    );
END ENTITY full_adder;

ARCHITECTURE behav_estrutural OF full_adder IS
    component half_adder IS
    PORT (
        a,b: in STD_LOGIC;
        carry, sum: out STD_LOGIC
    );
    END component;

    signal carry1, carry2, sum_int: STD_LOGIC;

BEGIN
   
    ha1: half_adder
     port map(
        a => a_f,
        b => b_f,
        carry => carry1,
        sum => sum_int
    );

    ha2: half_adder
    port map(
       a => sum_int,
       b => carry_in,
       carry => carry2,
       sum => sum
   );

   carry_out <= carry1 OR carry2;

END behav_estrutural;

----------------------------------------
--ENTITY half_adder
-----------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder IS
    PORT (
       a,b: in STD_LOGIC;
       carry, sum: out STD_LOGIC
    );
END ENTITY half_adder;

ARCHITECTURE behav_FLUXO OF half_adder IS
BEGIN
   carry <= a AND b;
   sum <= a XOR b;
END behav_FLUXO;



-- ARCHITECTURE behav_algo OF half_adder IS
-- BEGIN
--     process (a,b)
--     begin
--         if ( a = '1' and b = '1') then 
--             sum <= '0';
--             carry <= '1';
--         elsif (a > b or b > a) then
--             sum <= '1'; 
--             carry <= '0';
--         else
--             sum <= '0'; 
--             carry <= '0';
--         end if;
--     end process; 
-- END behav_algo;








