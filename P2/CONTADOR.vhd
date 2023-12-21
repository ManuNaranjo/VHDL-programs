----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2022 22:44:20
-- Design Name: 
-- Module Name: CONTADOR - Behavioral
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

entity contador is
Generic (Nbit: INTEGER := 10);
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
enable : in STD_LOGIC;
resets : in STD_LOGIC;
Q : out STD_LOGIC_VECTOR (Nbit-1 downto 0));
end contador;


architecture Behavioral of CONTADOR is

signal cont: UNSIGNED(Nbit-1 downto 0);
signal pcont: UNSIGNED(Nbit-1 downto 0);

begin

cont <= pcont;
Q <= std_logic_vector(cont);

process(clk,reset)

begin

if (reset = '1') then
        pcont <= (others => '0');
        
 else
 
    if (rising_edge(clk))then
 
        if (resets = '1') then
                pcont <= (others => '0');
                
        else
            
            if ( enable = '1') then
                    pcont <= cont + 1;
                    
                
                    
                
        
               
            end if;
         end if;
    end if;
 end if;
end process;



end Behavioral;
