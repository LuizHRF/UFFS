library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity portao is
    Port (
        ledr: out std_logic_vector(9 downto 0);
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        hex0: out std_logic_vector(6 downto 0)
    );
end portao;

architecture Behavioral of portao is

    component motor is port (
        ledr: out std_logic_vector(9 downto 0);
        Fecha, Abre, S, clock, r : in STD_LOGIC;
        hex0: out std_logic_vector(6 downto 0)
    );
    end component;

    component sensores is port (
			Sin: in std_logic;
        sw: in std_logic_vector(9 downto 0);
        key: in std_logic_vector(3 downto 0);
        Fecha, Abre, Sout : out STD_LOGIC;
        SA, SF, r: in STD_LOGIC
    );
    end component;

    SIGNAL Fecha_sig, Abre_sig, Sout, reset: STD_LOGIC;
    SIGNAL meanLedr: STD_LOGIC_VECTOR(9 downto 0);

begin
    
    reset <= NOT key(1);
    ledr <= meanLedr;

    sensores_inst: sensores port map (
			Sin => sw(0),
        sw => sw,
        key => key,
        Fecha => Fecha_sig,
        Abre => Abre_sig,
        Sout => Sout,
        SA => meanLedr(0),
        SF => meanLedr(1),
        r => reset
    );

    motor_inst: motor port map (
        ledr => meanLedr,
        Fecha => Fecha_sig,
        Abre => Abre_sig,
        S => Sout,
        clock => key(2),
        hex0 => hex0,
        r => reset
    );
    
    
end Behavioral;