----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 19:08:19
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity fsm is
Generic (ancho_bus_dir:integer:=4;
VAL_SAT_CONT:integer:=10416;
ANCHO_CONTADOR:integer:=14);
Port ( clk : in STD_LOGIC;
reset : in STD_LOGIC;
button : in STD_LOGIC;
data : in std_logic_vector(7 downto 0);
direcc : out std_logic_vector(ancho_bus_dir-1 downto 0);
TX : out STD_LOGIC);
end fsm;


architecture Behavioral of fsm is

type tipo_estado is(REPOSO,INICIO,ESPERA,TEST_DATA,B_START,B_0,B_1,B_2,B_3,B_4,B_5,B_6,B_7,B_PARIDAD,B_STOP);
signal estado,p_estado: tipo_estado;


signal p_cont: UNSIGNED(14 downto 0);
signal cont: UNSIGNED(14 downto 0);
signal p_dir: UNSIGNED(ancho_bus_dir-1 downto 0);
signal dir: UNSIGNED(ancho_bus_dir-1 downto 0);

begin

 direcc <= std_logic_vector(dir);
 

 
 


sinc: process(clk, reset)
begin

if (reset = '1') then
    estado <= REPOSO;
    cont <= (others => '0');
    dir  <= (others => '0');
elsif (rising_edge(clk)) then
        estado <= p_estado;
        cont <= p_cont;
        dir <= p_dir;
    
        
end if;
 
 end process;


comb: process(estado,button,data,cont,dir)
begin
case estado is
when REPOSO =>
    TX <= '1';
   p_cont <= (others => '0');
    p_dir  <= (others => '0');

    if (button = '1') then
        p_estado <= INICIO;
    else
        p_estado <= REPOSO;
    end if;
when INICIO =>
    p_dir  <= dir;
    p_cont <= (others => '0');
    TX <= '1';
    if (button = '0') then
        p_estado <= ESPERA;
     else
        p_estado <= INICIO;
     end if;
when ESPERA =>
   p_dir  <= dir;
    p_cont <= (others => '0');
    TX <= '1';
    p_estado <= TEST_DATA;
    
when TEST_DATA =>
    p_dir  <= dir;
    p_cont <= (others => '0');
    TX <= '1';
    if (data = "00000000") then
        p_estado <= REPOSO;
    else
        p_estado <= B_START;
    end if;
when B_START =>
    p_dir  <= dir;
    TX <= '0';
    
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_0;
     else
        p_cont <= cont + 1;
        p_estado <= B_START;
     end if;
when B_0 =>
   p_dir  <= dir;
    TX <= data(0);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_1;
     else
        p_estado <= B_0;
     end if;
when B_1 =>
   p_dir  <= dir;
    TX <= data(1);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_2;
     else
        p_estado <= B_1;
     end if;
when B_2 =>
    p_dir  <= dir;
    TX <= data(2);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_3;
     else
        p_estado <= B_2;
     end if;
when B_3 =>
   p_dir  <= dir;
    TX <= data(3);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_4;
     else
        p_estado <= B_3;
     end if;
when B_4 =>
    p_dir  <= dir;
    TX <= data(4);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_5;
     else
        p_estado <= B_4;
     end if;
when B_5 =>
    p_dir  <= dir;
    TX <= data(5);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_6;
     else
        p_estado <= B_5;
     end if;
when B_6 =>
   p_dir  <= dir;
    TX <= data(6);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_7;
     else
        p_estado <= B_6;
     end if;
when B_7 =>
    p_dir  <= dir;
    TX <= data(7);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_PARIDAD;
     else
        p_estado <= B_7;
     end if;
when B_PARIDAD =>
   p_dir  <= dir;
    TX <= data(0) xor data(1)xor data(2) xor data(3) xor data(4) xor data(5) xor data(6) xor data(7);
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_estado <= B_STOP;
     else
        p_estado <= B_PARIDAD;
     end if;
when B_STOP =>
   p_dir  <= dir;
    TX <= '1';
    p_cont <= cont + 1;
    if (cont = VAL_SAT_CONT) then
        p_cont <= (others => '0');
        p_dir <= dir + 1;
        p_estado <= INICIO;
     else
        p_estado <= B_STOP;
     end if;
    
    
         
end case;
end process;



end Behavioral;
