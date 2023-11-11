library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity Modo_Normal is
    port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        semaforo : out STD_LOGIC_VECTOR(9 downto 0);
	LEDG : out integer;
	Salida_Divisor : out std_LOGIC;
	Salida_Contador : BUFFER std_LOGIC_VECTOR (6 downto 0)
    );
end Modo_Normal;

architecture  Normal of Modo_Normal is
    type State_Type is (Estado30s, Estado10s, Estado5s, Estado40s, Estado5seg, Estado25s, Estado0s);
    signal estado_actual, siguiente_estado : tipo_estado;
    signal M0 : std_LOGIC;

component Divisor_frecuencia 
PORT ( clk : IN STD_LOGIC;
       Salidadivisor : BUFFER STD_LOGIC);
end component;

component Contador_120
port (      Clk : in STD_LOGIC;
            Up : in STD_LOGIC;
            Salidacontador: out STD_LOGIC_VECTOR(6 downto 0)
           );
end component;

begin
L0 : Divisor_frecuencia  port map(clk,M0);
L1 : Contador_120 port map (M0,reset,M1);
Salida_Divisor<=M0;
    process (clk, reset)
    begin
        if reset = '0' then
            estado_actual <= S1;-- Estado inicial
			
        elsif (clk' event and clk='1') then
            estado_actual <= siguiente_estado;
				
        end if;
    end process;

      process (estado_actual,Salida_Contador)
    begin
        case estado_actual is
            when Estado30s =>
                if Salida_Contador < "1011010" then
                    siguiente_estado <= Estado10s;
                else
                    siguiente_estado <= Estado30s;
                end if;
            when Estado10s =>
                if Salida_Contador < "1010000" then
                    siguiente_estado <= Estado5s;
                else
                    siguiente_estado <= Estado10s;
                end if;
            when Estado5s =>
                if Salida_Contador < "1001011" then
                    siguiente_estado <= Estado40s;
                else
                    siguiente_estado <= Estado5s;
                end if;
            when Estado40s =>
                if Salida_Contador < "0100011" then
                    siguiente_estado <= Estado5seg;
                else
                    siguiente_estado <= Estado40s;
                end if;
            when Estado5seg =>
                if Salida_Contador < "0011110" then
                    siguiente_estado <= Estado25s;
                else
                    siguiente_estado <= Estado5seg;
                end if;
            when Estado25s =>
                if Salida_Contador < "0000101" then
                    siguiente_estado <= Estado0s;
                else
                    siguiente_estado <= Estado25s;
                end if;
            when Estado0s =>
                if Salida_Contador > "0000000" then
                    siguiente_estado <= Estado30s;
                else
                    siguiente_estado <= Estado0s;
                end if;
            when others =>
                siguiente_estado <= Estado30s;
        end case;
    end process;

	  process (estado_actual)
    begin
        case estado_actual is
            when Estado30s =>
                semaforo <= "1000010110";
            when Estado10s =>
                semaforo <= "1000011010";
            when Estado5s =>
                semaforo <= "0100101010";
            when Estado40s =>
                semaforo <= "0011001010";
            when Estado5seg =>
                semaforo <= "0101001010";
            when Estado25s =>
                semaforo <= "1001000101";
	    when Estado0s =>
		semaforo <= "1000100110";
            when others =>
                semaforo <= (others => '0');
        end case;
    end process;
end  Normal;