-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity semaforo is
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
end semaforo;

architecture estrutural of semaforo is

	signal saida : STD_LOGIC;
    signal q : STD_LOGIC_VECTOR(1 downto 0);
    signal A : STD_LOGIC_VECTOR(1 downto 0);
    signal B : STD_LOGIC_VECTOR(1 downto 0);
    signal ena_estado : STD_LOGIC;

begin

    CONT8: entity work.contador_8clk
        port map(
            clk => clk,
            saida => saida
        );

    ena_estado <= ena and saida;

    ESTADOS: entity work.maq_4estados
        port map(
            clk => clk,
            clrn => clrn,
            ena => ena_estado,
            q => q
        );

    DECOD: entity work.dec_4estados
        port map(
            estado => q,
            A => A,
            B => B
            
        );

    CORES_A: entity work.dec_cores
        port map(
            estado => A,
            vermelho => vermelho_a,
            amarelo => amarelo_a,
            verde => verde_a
        );

    CORES_B: entity work.dec_cores
        port map(
            estado => B,
            vermelho => vermelho_b,
            amarelo => amarelo_b,
            verde => verde_b
        );

 
end estrutural;
