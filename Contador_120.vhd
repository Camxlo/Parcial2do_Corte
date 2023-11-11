library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Contador_120 is 
  port(
    Clk : in std_logic;
    Up  : in std_logic;
    Salidacontador : out std_logic_vector(6 downto 0)
  );
end Contador_120;

architecture Contador of Contador_120 is
  signal Conteo : std_logic_vector(6 downto 0) := "0000000";
begin

  process(Up,Clk) begin
    if (Clk' event and Clk='1') then
if (Up='1') then
Conteo<=Conteo-1;
   if (Conteo=0) then
   Conteo<="1111000";
   end if;
end if;
end if;
end process;

  Salidacontador <= Conteo;

end Contador;

