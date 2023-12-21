----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2022 18:28:44
-- Design Name: 
-- Module Name: CONTROL_DISPLAY_P1 - Behavioral
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

entity CONTROL_DISPLAY_P1 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E : out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end CONTROL_DISPLAY_P1;

architecture Behavioral of CONTROL_DISPLAY_P1 is
signal s_uno:STD_LOGIC;
signal s_dos:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal letras:STD_LOGIC_VECTOR(6 DOWNTO 0);


component DIV_FREQ 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sat : out STD_LOGIC);
end component;

component CONT_DIGITO 
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

component DECODIFICADOR
    Port ( binario : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           siete_seg : out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;

begin
(A,B,C,D,E,F,G) <= letras;
DP <= '1';
AN <= "1110";

div_freq1: DIV_FREQ
PORT MAP(
clk => clk,
reset => reset,
sat => s_uno );

cont_digito1 : CONT_DIGITO
PORT MAP(
clk => clk,
reset => reset,
enable => s_uno,
cuenta => s_dos );

decodificador1 : DECODIFICADOR
PORT MAP(
binario => s_dos,
siete_seg => letras );
    


end Behavioral;
