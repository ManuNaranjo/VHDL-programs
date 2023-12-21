----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 21:21:44
-- Design Name: 
-- Module Name: REG_DESP - Behavioral
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

entity REG_DESP is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           display_enable : out STD_LOGIC_VECTOR (3 downto 0));
end REG_DESP;

architecture Behavioral of REG_DESP is

signal desp1:unsigned(3 downto 0);
signal pdesp1:unsigned(3 downto 0);


begin

desp1 <= pdesp1;
display_enable <= std_logic_vector(pdesp1);



process(clk,reset,enable)


begin



if (reset = '1') then
       pdesp1 <= "1110";
       
       
 else
 
    if(enable = '1') then
        if(rising_edge(clk)) then
            case desp1 is
                when "1110" =>
                pdesp1 <= "1101";
                when "1101" =>
                pdesp1 <= "1011";
                when "1011" =>
                pdesp1 <= "0111";
                when others =>
                pdesp1 <= "1110";
             end case;
                
                
                    
            
      
        end if;
     end if;
 end if;
 
end process;
            
            
end Behavioral;
