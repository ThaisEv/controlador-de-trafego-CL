library IEEE;
use IEEE.std_logic_1164.all;

entity dec_cores is
   port(
     estado: in STD_LOGIC_VECTOR(1 downto 0);
     vermelho : out STD_LOGIC;
     amarelo : out STD_LOGIC;
     verde: out STD_LOGIC
   );
end dec_cores;

architecture estrutural of dec_cores is

begin
    process(estado)
    begin
        case estado is
            when "01" =>
                vermelho <= '0';
                amarelo <= '1';
                verde <= '0';
            when "10" =>
                vermelho <= '0';
                amarelo <= '0';
                verde <= '1';
            when others =>
                vermelho <= '1';
                amarelo <= '0';
                verde <= '0';
        end case;
    end process;

end estrutural;