----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2022 15:15:48
-- Design Name: 
-- Module Name: CONT_DIGITO - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity CONT_DIGITO is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           sat: out STD_LOGIC);
 end CONT_DIGITO;

architecture Behavioral of CONT_DIGITO is
signal contador2: UNSIGNED(3 downto 0);
signal pcontador2: UNSIGNED(3 downto 0);
begin
contador2 <= pcontador2;
cuenta <= std_logic_vector(contador2);
process(clk, reset,enable)
begin
if (reset = '1') then
        pcontador2 <= (others => '0');
        sat <= '0';
        
 else  
 
       if ( enable = '1') then
             
             if (rising_edge(clk))then
                sat <= '0';
                pcontador2 <= contador2 + 1;
                if(contador2 = "1000") then
                    sat <= '1';
                 else
                    
                    if(contador2 = "1001") then
                        pcontador2 <= (others => '0');
                    
                    
                
                    end if;
                end if;
             end if;
       end if;
end if;
end process;
end Behavioral;
