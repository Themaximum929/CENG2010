----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2023 07:21:29 PM
-- Design Name: 
-- Module Name: a - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity a is
    port (
        btnC        : in  std_logic;
        sw          : in  std_logic_vector(3 downto 0);
        led         : out  std_logic_vector(1 downto 0)
    );
end a;

architecture Behavioral of a is
signal Q, Q_bar : std_logic := '0';

begin
    process (btnC, sw(3 downto 0))
    begin
        if sw(2) = '0' then
            Q <= '0';
            Q_bar <= '1';
            
        elsif sw(3) = '0' then
            Q <= '1';
            Q_bar <= '0';
            
        elsif rising_edge(btnC) then
            case sw(1 downto 0) is
                when "00" => Q <= Q; Q_bar <= Q_bar;
                when "01" => Q <= '0'; Q_bar <= '1';
                when "10" => Q <= '1'; Q_bar <= '0';
                when "11" => Q <= Q_bar; Q_bar <= Q;
                when others => Q <= '0'; Q_bar <= '1';
             end case;
         end if;
    end process;
     
    led(1) <= Q;
    led(0) <= Q_bar;

end Behavioral;
