----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2022 00:04:44
-- Design Name: 
-- Module Name: COMPARADOR - Behavioral
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

entity COMPARADOR  is
Generic (Nbit: integer :=10;
End_Of_Screen: integer :=800;
Start_Of_Pulse: integer :=656;
End_Of_Pulse: integer := 752;
End_Of_Line: integer := 639);
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
data : in STD_LOGIC_VECTOR (Nbit-1 downto 0);
O1 : out STD_LOGIC;
O2 : out STD_LOGIC;
O3 : out STD_LOGIC);
end COMPARADOR ;


architecture Behavioral of COMPARADOR is

--signal pdata: UNSIGNED(Nbit-1 downto 0);
--signal po1: STD_LOGIC;
--signal po2: STD_LOGIC;
--signal po3: STD_LOGIC;

begin



process(clk,reset)

begin

if (reset = '1') then
       o1 <= '0';
       o2 <= '0';
       o3 <= '0';
        
 else
 
    if (rising_edge(clk))then
    
        if(unsigned(data) > End_Of_Line) then
            o1 <= '1';
         else
            o1 <= '0';
        end if;
         
        
        if((Start_Of_Pulse < unsigned(data)) and (unsigned(data) < End_Of_Pulse)) then
            o2 <= '0';
            
        else
            o2 <= '1';
            
            if(unsigned(data) = End_Of_Screen) then
                o3 <= '1';
              
            else
                o3 <= '0';
 
        
                
            end if;
         end if;
         
      end if;
   end if;

 end process;


end Behavioral;
