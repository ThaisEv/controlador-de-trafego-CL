library IEEE;
use IEEE.std_logic_1164.all;

entity dec_4estados is
   port(
     estado: in STD_LOGIC_VECTOR(1 downto 0);
     A : out STD_LOGIC_VECTOR(1 downto 0);
     B : out STD_LOGIC_VECTOR(1 downto 0)
   );
end dec_4estados;

architecture estrutural of dec_4estados is

begin
    process(estado)
    begin
        case estado is
            when "00" =>
                A <= "00";
                B <= "10";
            when "01" =>
                A <= "00";
                B <= "01";
            when "10" =>
                A <= "10";
                B <= "00";
            when others =>
                A <= "01";
                B <= "00";
        end case;
    end process;

end estrutural;