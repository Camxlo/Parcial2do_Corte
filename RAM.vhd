library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity RAM is
port (    
        addres :  in std_logic_vector(5 downto 0);
        clk :     in std_logic;
        data_in : in integer range 0 to 40;
        WE :      in std_logic;
        data_out : out integer range 0 to 40);
end entity;

architecture RAM_arch of RAM is
type RAM_type is array (0 to 53) of integer range 0 to 120;

   signal RW : RAM_type:= (
	                    --MOD NORMAL
                        0 => 30,
                        1 => 10,
							   2 => 5,
							   3 => 40,
							   4 => 5,
							   5 => 25,
							   6 => 5,
							 --MOD NOCTURNO
							   7 => 5,
								8 => 5,
								9 => 5,
								10 => 5,
								11 => 5,
								12 => 5,
								13 => 5,
								14 => 5,
								15 => 5,
								16 => 5,
								17 => 5,
								18 => 5,
								19 => 5,
								20 => 5,
								21 => 5,
								22 => 5,
								23 => 5,
								24 => 5,
								25 => 5,
								26 => 5,
								27 => 5,
								28 => 5,
								29 => 5,
								30 => 5,
							--MOD PRIORIDAD
								31 => 40,
								32 => 15,
								33 => 10,
								34 => 5,
								35 => 30,
								36 => 5,
								37 => 10,
								38 => 5,
							-- MOD URGENCIA 1
								39 => 25,
								40 => 25,
								41 => 10,
								42 => 5,
								43 => 20,
								44 => 5,
								45 => 25,
								46 => 5,
							-- MOD URGENCIA 2
								47 => 25,
								48 => 20,
								49 => 5,
								50 => 35,
								51 => 5,
								52 => 25,
								53 => 5 );
begin

MEMORY : process (clk)
begin
 if (clk'event and clk='1') then
if (WE = '1') then
RW(to_integer(unsigned(addres))) <= data_in;
else
data_out <= RW(to_integer(unsigned(addres)));
end if;
end if;
end process;

end architecture;