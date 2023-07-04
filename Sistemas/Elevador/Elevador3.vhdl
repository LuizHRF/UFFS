library IEEE;
use IEEE.std_logic_1164.all;

entity ElevatorControl is
    port (
        clk : in std_logic;
        reset : in std_logic;
        call_request : in std_logic_vector(3 downto 0);
        floor_sensor : in std_logic_vector(3 downto 0);
        motor_up : out std_logic;
        motor_down : out std_logic;
        current_floor : out std_logic_vector(1 downto 0)
    );
end entity;

architecture Behavioral of ElevatorControl is
    type ElevatorState is (Idle, MoveUp, MoveDown);
    signal current_state : ElevatorState;
    signal next_state : ElevatorState;
    signal next_floor : std_logic_vector(1 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            current_state <= Idle;
            next_state <= Idle;
            next_floor <= "00";
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process (current_state, call_request, floor_sensor)
    begin
        case current_state is
            when Idle =>
                if call_request /= "0000" then
                    if floor_sensor = "00" then
                        next_state <= Idle;
                    elsif floor_sensor < call_request then
                        next_state <= MoveUp;
                        next_floor <= call_request;
                    elsif floor_sensor > call_request then
                        next_state <= MoveDown;
                        next_floor <= call_request;
                    end if;
                else
                    next_state <= Idle;
                    next_floor <= floor_sensor;
                end if;
            when MoveUp =>
                if next_floor = floor_sensor then
                    next_state <= Idle;
                else
                    next_state <= MoveUp;
                end if;
            when MoveDown =>
                if next_floor = floor_sensor then
                    next_state <= Idle;
                else
                    next_state <= MoveDown;
                end if;
        end case;
    end process;

    process (current_state, next_state, floor_sensor)
    begin
        case current_state is
            when Idle =>
                motor_up <= '0';
                motor_down <= '0';
            when MoveUp =>
                motor_up <= '1';
                motor_down <= '0';
            when MoveDown =>
                motor_up <= '0';
                motor_down <= '1';
        end case;

        if current_state = Idle then
            current_floor <= floor_sensor;
        else
            current_floor <= next_floor;
        end if;
    end process;
end architecture;
