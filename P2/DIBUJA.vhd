----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2022 00:21:41
-- Design Name: 
-- Module Name: DIBUJA - Behavioral
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

entity DIBUJA is
    Port (  eje_x : in STD_LOGIC_VECTOR (9 downto 0);
            eje_y : in STD_LOGIC_VECTOR (9 downto 0);
            RED : out STD_LOGIC_VECTOR(3 downto 0);
            GRN : out STD_LOGIC_VECTOR(3 downto 0);
            BLU : out STD_LOGIC_VECTOR(3 downto 0));

end DIBUJA;

architecture Behavioral of DIBUJA is

--signal ejex: UNSIGNED(9 downto 0);
--signal ejey: UNSIGNED(9 downto 0); 

begin

process(eje_x,eje_y)
begin

if(((300 < unsigned(eje_x)) and (unsigned(eje_x) < 340)) or ((220 < unsigned(eje_y)) and (unsigned(eje_y) < 260))) then
    RED <= "1111";
    GRN <= "0000";
    BLU <= "0000";
else
    RED <= "1111";
    GRN <= "1111";
    BLU <= "1111";
    
    
    
end if;

end process;





end Behavioral;
