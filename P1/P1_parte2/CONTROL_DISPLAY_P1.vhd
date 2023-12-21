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
signal s_dos:STD_LOGIC;
signal s_tres:STD_LOGIC;
signal s_cuatro:STD_LOGIC;

signal s_a:STD_LOGIC;
signal s_b:STD_LOGIC;
signal s_c:STD_LOGIC;


signal div:STD_LOGIC;

signal dig_uno:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal dig_dos:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal dig_tres:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal dig_cuatro:STD_LOGIC_VECTOR(3 DOWNTO 0);

signal reg:STD_LOGIC_VECTOR(3 DOWNTO 0);

signal mux_out:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal letras:STD_LOGIC_VECTOR(6 DOWNTO 0);






component DIV_FREQ 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sat : out STD_LOGIC;
           sat2 : out STD_LOGIC);
end component;

component CONT_DIGITO 
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           cuenta : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           sat: out STD_LOGIC);
end component;

component DECODIFICADOR
    Port ( binario : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           siete_seg : out STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;

component REG_DESP is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           display_enable : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux41_behavioral is
    Port ( i1 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           i2 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           i3 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           i4 : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           sel : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           o : out STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

begin
(A,B,C,D,E,F,G) <= letras;
DP <= '1';
AN <= reg;

s_dos <= s_uno and s_a;
s_tres <= s_dos and s_b;
s_cuatro <= s_tres and s_c;

mux41: mux41_behavioral
PORT MAP(
i1 => dig_uno,
i2 => dig_dos,
i3 => dig_tres,
i4 => dig_cuatro,
sel => reg,
o => mux_out);


div_freq1: DIV_FREQ
PORT MAP(
clk => clk,
reset => reset,
sat => s_uno,
sat2 => div);

cont_digito1 : CONT_DIGITO
PORT MAP(
clk => clk,
reset => reset,
enable => s_uno,
cuenta => dig_uno,
sat => s_a);

cont_digito2 : CONT_DIGITO
PORT MAP(
clk => clk,
reset => reset,
enable => s_dos,
cuenta => dig_dos,
sat => s_b);

cont_digito3 : CONT_DIGITO
PORT MAP(
clk => clk,
reset => reset,
enable => s_tres,
cuenta => dig_tres,
sat => s_c);

cont_digito4 : CONT_DIGITO
PORT MAP(
clk => clk,
reset => reset,
enable => s_cuatro,
cuenta => dig_cuatro,
sat => open);

reg_desp1 : REG_DESP
PORT MAP(
clk => clk,
reset => reset,
enable => div,
Display_enable => reg);



decodificador1 : DECODIFICADOR
PORT MAP(
binario => mux_out,
siete_seg => letras );
    


end Behavioral;
