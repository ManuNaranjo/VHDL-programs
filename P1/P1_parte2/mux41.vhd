----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2022 13:46:41
-- Design Name: 
-- Module Name: mux21_behavioral - Behavioral
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

entity mux41_behavioral is
    Port ( i1 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           i2 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           i3 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           i4 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           sel : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           o : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end mux41_behavioral;

architecture Behavioral of mux41_behavioral is

begin

 process(sel,i1,i2)
 begin

    if( sel = "1110") then
        o <= i1;
    else
        if( sel = "1101") then
            o <= i2;
        else
            if( sel = "1011") then
                o <= i3;
            else
                o <= i4;
            end if;
        end if;
     end if;
     
  end process;
 


end Behavioral;
