----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/18/2023 07:22:40 PM
-- Design Name: 
-- Module Name: lab2_q3_2 - Behavioral
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

entity lab2_q3_2 is
    Port (  sw : in STD_LOGIC_VECTOR (1 downto 0);
            led : out STD_LOGIC_VECTOR (1 downto 0)); 
end lab2_q3_2;

architecture Behavioral of lab2_q3_2 is

SIGNAL from_set: STD_Logic;
SIGNAL from_reset: STD_Logic;

begin
    from_set <= sw(1) nand from_reset; 
    from_reset <= sw(0) nand from_set; 
    led(1) <= from_set;
    led(0) <= from_reset;

end Behavioral;
