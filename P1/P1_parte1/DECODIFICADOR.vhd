----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2022 16:09:45
-- Design Name: 
-- Module Name: DECODIFICADOR - Behavioral
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

entity DECODIFICADOR is
    Port ( binario : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           siete_seg : out STD_LOGIC_VECTOR(6 DOWNTO 0));
end DECODIFICADOR;

architecture Behavioral of DECODIFICADOR is

begin
process(binario)
begin
    case binario is
        when "0000" => siete_seg <= "0000001";
        when "0001" => siete_seg <= "1001111";
        when "0010" => siete_seg <= "0010010";
        when "0011" => siete_seg <= "0000110";
        when "0100" => siete_seg <= "1001100";
        when "0101" => siete_seg <= "0100100";
        when "0110" => siete_seg <= "0100000";
        when "0111" => siete_seg <= "0001111";
        when "1000" => siete_seg <= "0000000";
        when "1001" => siete_seg <= "0000100";
        when others => siete_seg <= "0000000";
    end case;
end process;


end Behavioral;
