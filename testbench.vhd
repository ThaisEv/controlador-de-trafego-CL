library IEEE;
use IEEE.std_logic_1164.all;

entity tb_semaforo is
end tb_semaforo;

architecture behavior of tb_semaforo is

    -- Component Declaration for the Unit Under Test (UUT)
    component semaforo
    port(
         clk : in STD_LOGIC;
         clrn : in STD_LOGIC;
         ena : in STD_LOGIC;
         vermelho_a : out STD_LOGIC;
         amarelo_a : out STD_LOGIC;
         verde_a : out STD_LOGIC;
         vermelho_b : out STD_LOGIC;
         amarelo_b : out STD_LOGIC;
         verde_b : out STD_LOGIC
        );
    end component;

   --Inputs
   signal clk : STD_LOGIC := '0';
   signal clrn : STD_LOGIC := '0';
   signal ena : STD_LOGIC := '0';

 	--Outputs
   signal vermelho_a : STD_LOGIC;
   signal amarelo_a : STD_LOGIC;
   signal verde_a : STD_LOGIC;
   signal vermelho_b : STD_LOGIC;
   signal amarelo_b : STD_LOGIC;
   signal verde_b : STD_LOGIC;

begin 
    -- Instantiate the Unit Under Test (UUT)
   uut: semaforo port map (
          clk => clk,
          clrn => clrn,
          ena => ena,
          vermelho_a => vermelho_a,
          amarelo_a => amarelo_a,
          verde_a => verde_a,
          vermelho_b => vermelho_b,
          amarelo_b => amarelo_b,
          verde_b => verde_b
        );

   -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      clrn <= '1';
      ena <= '1';
      wait for 100 ns;
      
      wait for 500 ns;
   end process;

end behavior;
