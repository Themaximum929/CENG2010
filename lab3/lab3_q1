library ieee;
use ieee.std_logic_1164.all;

entity aa is
    port (
        btnC        : in  std_logic;
        sw          : in  std_logic_vector(6 downto 0);
        seg         : out std_logic_vector(6 downto 0);
        an          : out std_logic_vector(3 downto 0) := "0011"
    );
end entity;

architecture Behavioral of aa is
signal a : std_logic := '0';

begin
    seg <= sw;
    
    process (btnC)
    begin
        if (rising_edge(btnC)) then 
            if a = '0' then
                an <= "1100";
                 a <= '1';
            else   
                an <= "0011";
                a <= '0';
            end if;
        end if; 
    
    end process;

end architecture;
