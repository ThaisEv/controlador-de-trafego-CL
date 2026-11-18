library IEEE;
use IEEE.std_logic_1164.all;

entity maq_4estados is
   port(
     clk : in STD_LOGIC;
     clrn: in STD_LOGIC;
     ena: in STD_LOGIC;
     sensor_a : in STD_LOGIC;
     sensor_b : in STD_LOGIC;
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
                    -- Keep the current green phase while only its lane has
                    -- traffic. Otherwise, follow the normal sequence.
                    when "00" =>
                        if sensor_a = '1' and sensor_b = '0' then
                            estado <= "00";
                        else
                            estado <= "01";
                        end if;
                    when "01" => estado <= "10";
                    when "10" =>
                        if sensor_b = '1' and sensor_a = '0' then
                            estado <= "10";
                        else
                            estado <= "11";
                        end if;
                    when others => estado <= "00";
                end case;
            end if;
        end if;
    end process;

end estrutural;