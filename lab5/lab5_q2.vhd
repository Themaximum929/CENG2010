library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lan5_q2_2 is
    Port (
        sw : in STD_LOGIC_VECTOR(0 downto 0);
        btnC : in STD_LOGIC;
        led : out STD_LOGIC_VECTOR(1 downto 0)
        );
end lan5_q2_2;

architecture Behavioral of lan5_q2_2 is
    signal Q_internal : std_logic;
begin
    process(btnC)
    begin
    if(rising_edge(btnC)) then
        Q_internal <= sw(0);
    end if;
    end process;

    led(0) <= Q_internal;
    led(1) <= not Q_internal;
    
end Behavioral;
