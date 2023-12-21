----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 23:36:30
-- Design Name: 
-- Module Name: Serie - Behavioral
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

entity serie is
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
button : in STD_LOGIC;
TX : out STD_LOGIC);
end serie;


architecture Behavioral of Serie is

signal dir: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal datos: STD_LOGIC_VECTOR(7 DOWNTO 0);
--signal s_TX: UNSIGNED;


component fsm is
Generic (ancho_bus_dir:integer:=4;
VAL_SAT_CONT:integer:=10416;
ANCHO_CONTADOR:integer:=14);
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
button : in STD_LOGIC;
data : in std_logic_vector(7 downto 0);
direcc : out std_logic_vector(ancho_bus_dir-1 downto 0);
TX : out STD_LOGIC);
end component;

component mi_memoria IS
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END component;

begin


Fsm1: fsm
GENERIC MAP
(ancho_bus_dir => 4,
VAL_SAT_CONT => 10416,
ANCHO_CONTADOR => 14)
PORT MAP(
clk => clk,
reset => reset,
button => button,
data => datos,
direcc => dir,
TX => TX);

Memoria1: mi_memoria
PORT MAP(
clka => clk,
addra => dir,
douta => datos );



end Behavioral;
