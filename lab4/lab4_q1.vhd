----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2023 05:01:24 PM
-- Design Name: 
-- Module Name: lab4q1 - Behavioral
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

entity lab4q1 is
--  Port ( );
    Port (
        btnC    : in std_logic;
        btnD    : in std_logic;
        sw      : in std_logic_vector (0 downto 0);
        led     : out std_logic_vector(7 downto 0)
    );
end lab4q1;

architecture Behavioral of lab4q1 is
    type state_type is (S0, S1, S2);
    signal state, next_state : state_type;
begin
    SYNC_PROC : process (btnC, btnD)
    begin
        if (btnD = '1') then
            state <= S0;
        elsif rising_edge(btnC) then
            state <= next_state;
        end if;
     end process;
     
     OUTPUT_DECODE : process (state)
     begin
        case (state) is
            when S0 => 
                led(0) <= '0';
                led(5) <= '1';
                led(6) <= '0';
                led(7) <= '0';
            when S1 =>
                led(0) <= '1';
                led(5) <= '0';
                led(6) <= '1';
                led(7) <= '0';
            when S2 =>
                led(0) <= '0';
                led(5) <= '0';
                led(6) <= '0';
                led(7) <= '1';
        end case;        
     end process;
    
     NEXT_STATE_DECODE : process (state, sw(0))
     begin
        case (state) is
            when S0 => 
                if (sw(0) = '0') then
                    next_state <= S0;
                elsif (sw(0) = '1') then
                    next_state <= S1;
                end if;
            when S1 =>
                if (sw(0) = '1') then
                    next_state <= S1;
                elsif (sw(0) = '0') then
                    next_state <= S2;
                end if;            
            when S2 =>
                 if (sw(0) = '0') then
                    next_state <= S2;
                 elsif (sw(0) = '1') then
                    next_state <= S1;
                 end if;
         end case;
     end process;
    
end Behavioral;
