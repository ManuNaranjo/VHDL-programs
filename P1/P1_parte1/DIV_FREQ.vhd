----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2022 12:02:06
-- Design Name: 
-- Module Name: DIV_FREQ - Behavioral
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

entity DIV_FREQ is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sat : out STD_LOGIC);
end DIV_FREQ;

architecture Behavioral of DIV_FREQ is
signal contador1:unsigned(25 downto 0);
signal pcontador1:unsigned(25 downto 0);

begin

contador1 <= pcontador1;


process(clk, reset)
begin


 if (reset = '1') then
        pcontador1 <= (others => '0');
        sat <= '0';
        
  else
    if(rising_edge(clk)) then
        sat <= '0';
        pcontador1 <= contador1 + 1;
 
        if (contador1 = "11111111111111111111111111")then
            sat <= '1';
            pcontador1 <= (others => '0');
        end if;
    
     end if;
 end if;
 

end process;


end Behavioral;
