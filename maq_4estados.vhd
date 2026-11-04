library IEEE;
use IEEE.std_logic_1164.all;

entity maq_4estados is
   port(
     clk : in STD_LOGIC;
     clrn: in STD_LOGIC;
     ena: in STD_LOGIC;
     q : out STD_LOGIC_VECTOR(1 downto 0)
   );
end maq_4estados;

architecture estrutural of maq_4estados is
    signal estado : STD_LOGIC_VECTOR(1 downto 0) := "00";
begin
    q <= estado;

    process(clk, clrn)
    begin
        if clrn = '0' then
            estado <= "00";
        elsif rising_edge(clk) then
            if ena = '1' then
                case estado is
                    when "00" => estado <= "01";
                    when "01" => estado <= "10";
                    when "10" => estado <= "11";
                    when others => estado <= "00";
                end case;
            end if;
        end if;
    end process;

end estrutural;