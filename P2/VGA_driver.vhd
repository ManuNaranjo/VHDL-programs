----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.04.2022 17:38:49
-- Design Name: 
-- Module Name: VGA_driver - Behavioral
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

entity VGA_driver is
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
VS : out STD_LOGIC;
HS : out STD_LOGIC;
RED : out STD_LOGIC_VECTOR (3 downto 0);
GRN : out STD_LOGIC_VECTOR (3 downto 0);
BLU : out STD_LOGIC_VECTOR (3 downto 0));
end VGA_driver;


architecture Behavioral of VGA_driver is
signal s_f:STD_LOGIC;

signal s_y:STD_LOGIC;

signal CH_1:STD_LOGIC;
signal CH_2:STD_LOGIC;
signal CH_3:STD_LOGIC;

signal CV_1:STD_LOGIC;
signal CV_2:STD_LOGIC;
signal CV_3:STD_LOGIC;

signal ejex:STD_LOGIC_VECTOR(9 DOWNTO 0);
signal ejey:STD_LOGIC_VECTOR(9 DOWNTO 0);

signal RED_IN:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal GRN_IN:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal BLU_IN:STD_LOGIC_VECTOR(3 DOWNTO 0);

signal RED_OUT:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal GRN_OUT:STD_LOGIC_VECTOR(3 DOWNTO 0);
signal BLU_OUT:STD_LOGIC_VECTOR(3 DOWNTO 0);



component FREC_PIXEL is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_pixel : out STD_LOGIC);
end component;

component contador is
Generic (Nbit: INTEGER := 10);
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
enable : in STD_LOGIC;
resets : in STD_LOGIC;
Q : out STD_LOGIC_VECTOR (Nbit-1 downto 0));
end component;

component COMPARADOR  is
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
end component ;

component DIBUJA is
    Port (  eje_x : in STD_LOGIC_VECTOR (9 downto 0);
            eje_y : in STD_LOGIC_VECTOR (9 downto 0);
            RED : out STD_LOGIC_VECTOR(3 downto 0);
            GRN : out STD_LOGIC_VECTOR(3 downto 0);
            BLU : out STD_LOGIC_VECTOR(3 downto 0));

end component;

component vga_monitor
generic (
NR: integer := 3; -- Number of bits of red bus
NG: integer := 3; -- Number of bits of green bus
NB: integer := 2 ); -- Number of bits of blue bus
Port (
clk : in STD_LOGIC;
hs : in STD_LOGIC;
vs : in STD_LOGIC;
R : in STD_LOGIC_VECTOR (NR-1 downto 0);
G : in STD_LOGIC_VECTOR (NG-1 downto 0);
B : in STD_LOGIC_VECTOR (NB-1 downto 0));
end component;



begin

HS <= CH_2;
VS <= CV_2;

s_y <= s_f and CH_3;

RED <= RED_OUT;
GRN <= GRN_OUT;
BLU <= BLU_OUT;



frec_pixel1: FREC_PIXEL
PORT MAP(
clk => clk,
reset => reset,
clk_pixel => s_f);

Conth: contador
GENERIC MAP(Nbit => 10)
PORT MAP(
clk => clk,
reset => reset,
enable => s_f,
resets => s_y,
Q => ejex);

Contv: contador
GENERIC MAP(Nbit => 10)
PORT MAP(
clk => clk,
reset => reset,
enable => s_y,
resets => CV_3,
Q => ejey);

Comph: COMPARADOR
GENERIC MAP(Nbit => 10,
End_Of_Screen=>799, 
Start_Of_Pulse=>655,
End_Of_Pulse=>751, 
End_Of_Line=>639)
PORT MAP(
clk => clk,
reset => reset,
data => ejex,
O1 => CH_1,
O2 => CH_2,
O3 => CH_3);

Compv: COMPARADOR
GENERIC MAP(Nbit => 10,
End_Of_Screen=>520, 
Start_Of_Pulse=>489,
End_Of_Pulse=>491, 
End_Of_Line=>479)
PORT MAP(
clk => clk,
reset => reset,
data => ejey,
O1 => CV_1,
O2 => CV_2,
O3 => CV_3);


Dibuja1: Dibuja
PORT MAP(
eje_x => ejex,
eje_y => ejey,
RED => RED_IN,
GRN => GRN_IN,
BLU => BLU_IN);


monitor: vga_monitor
generic map(
NR => 4, -- Number of bits of red bus
NG => 4, -- Number of bits of green bus
NB => 4) -- Number of bits of blue bus
Port map (
clk => clk,
hs => CH_2,
vs => CV_2,
R => RED_OUT,
G => GRN_OUT,
B => BLU_OUT);



gen_color:process(CH_1, CV_1, RED_IN, GRN_IN,
BLU_IN)
begin
if (CH_1='1' or CV_1='1') then
        RED_OUT<=(others => '0'); 
        GRN_OUT<=(others => '0');
        BLU_OUT<=(others => '0');
else
    RED_OUT<=RED_IN; 
    GRN_OUT<=GRN_IN; 
    BLU_OUT<=BLU_IN;
end if;
end process;











end Behavioral;
