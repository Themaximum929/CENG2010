library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop is
    Port (
        sw: in STD_LOGIC_VECTOR (0 downto 0);
        btnC: in STD_LOGIC;
        led: out STD_LOGIC_VECTOR (1 downto 0)
    );
end D_flip_flop;

architecture Behavioral of D_flip_flop is
    signal D, clk: STD_LOGIC;
    signal Q, Q_bar: STD_LOGIC;
begin
    D <= sw(0);
    clk <= btnC;
    led(0) <= Q;
    led(1) <= Q_bar;

    process(clk)
    begin
        if rising_edge(clk) then
            Q <= D;
            Q_bar <= not D;
        end if;
    end process;
end Behavioral;
