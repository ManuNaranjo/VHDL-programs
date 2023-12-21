----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2022 23:12:04
-- Design Name: 
-- Module Name: FREC_PIXEL - Behavioral
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

entity FREC_PIXEL is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_pixel : out STD_LOGIC);
end FREC_PIXEL;

architecture Behavioral of FREC_PIXEL is

signal contador1:unsigned(1 downto 0);
signal pcontador1:unsigned(1 downto 0);

begin
contador1 <= pcontador1;

process(clk,reset)

begin

if (reset = '1') then
        pcontador1 <= (others => '0');
        clk_pixel <= '0';
        
else
    if(rising_edge(clk)) then
        clk_pixel <= '0';
        pcontador1 <= contador1 + 1;
 
        if (contador1 = "11")then
            clk_pixel <= '1';
            pcontador1 <= (others => '0');
        end if;
    
     end if;
 end if;
 
 end process;


end Behavioral;
