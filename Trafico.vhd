library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Trafico is
    Port ( 
        clk : in STD_LOGIC;
        estado : in STD_LOGIC_VECTOR(3 downto 0);
        A, B, C, D, E, F : out INTEGER
    );
end Trafico;

architecture arch_Trafico of Trafico is
begin

    process(clk)
    begin
        if rising_edge(clk) then
            case estado is
                when "0000" | "1011" | "1111" =>
                    A <= integer(120 * 0.25);
                    B <= integer(120 * 0.04);
                    C <= integer(120 * 0.25);
                    D <= integer(120 * 0.04);
                    E <= integer(120 * 0.21);
                    F <= integer(120 * 0.21);

                when "0001" | "0100" | "0101" =>
                    E <= integer(120 * 0.5);
                    F <= integer(120 * 0.5);

                when "0010" | "0110" =>
                    C <= integer(120 * 0.5);
                    E <= integer(120 * 0.5);

                when "0011" =>
                    C <= integer(120 * 0.5);
                    D <= integer(120 * 0.05);
                    F <= integer(120 * 0.46);

                when "0111" =>
                    C <= integer(120 * 0.5);
                    D <= integer(120 * 0.04);
                    E <= integer(120 * 0.23);
                    F <= integer(120 * 0.23);

                when "1000" =>
                    A <= integer(120 * 0.5);
                    F <= integer(120 * 0.5);

                when "1001" | "1100" | "1101" =>
                    A <= integer(120 * 0.3);
                    B <= integer(120 * 0.05);
                    C <= integer(120 * 0.3);
                    D <= integer(120 * 0.05);
                    E <= integer(120 * 0.3);

                when others =>
                    -- Manejo de casos no especificados
                    null;
            end case;
        end if;
    end process;

end arch_Trafico;
