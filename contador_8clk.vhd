library IEEE;
use IEEE.std_logic_1164.all;

entity contador_8clk is
   port(
     clk : in STD_LOGIC;
     saida : out STD_LOGIC
     );
end contador_8clk;

architecture estrutural of contador_8clk is

    signal contador : integer range 0 to 7 := 0;

begin

    process(clk)
    begin
    if rising_edge(clk) then
        if contador = 7 then
            contador <= 0;
            saida <= '1';
        else
            contador <= contador + 1;
            saida <= '0';
        end if;
    end if;
    end process;
    	

end estrutural;