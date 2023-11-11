LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Divisor_frecuencia IS
  PORT (
    clk : IN STD_LOGIC;
    Salidadivisor : BUFFER STD_LOGIC
  );
END Divisor_frecuencia;

ARCHITECTURE Divisor OF Divisor_frecuencia IS
BEGIN
  PROCESS (clk)
    VARIABLE pulso : INTEGER RANGE 0 TO 50000000;
  BEGIN
    IF (clk'EVENT AND clk = '1') THEN
      pulso := pulso + 1;

      IF (pulso = 25000000) THEN
         Salidadivisor <= NOT Salidadivisor;
       pulso := 0;
      END IF;
    END IF;
  END PROCESS;
END Divisor;