
---

# 🚦 Controlador de Tráfego em VHDL

Projeto desenvolvido para simulação de um sistema digital de controle de tráfego utilizando VHDL, organizado em módulos estruturados e validado por meio de um *testbench*.

O módulo principal disponibiliza dois conjuntos independentes de sinais:
`vermelho_a`, `amarelo_a`, `verde_a` e `vermelho_b`, `amarelo_b`, `verde_b`,
um para cada via.

---

## 📁 Estrutura do Projeto

```text
controlador-de-trafego/
│
├── diagramas/             # Arquivos de diagramas e esquemáticos do projeto
├── contador_8clk.vhd      # Módulo contador de clock
├── dec_4estados.vhd       # Módulo decodificador de 4 estados
├── dec_cores.vhd          # Módulo decodificador de cores dos semáforos
├── design.vhd             # Arquivo principal de integração (Top-Level)
├── maq_4estados.vhd       # Máquina de estados principal
├── testbench.vhd          # Banco de testes para simulação
└── README.md              # Documentação do projeto

```

---

## 🛠️ Pré-requisitos

Para compilar, simular e visualizar as formas de onda no **Ubuntu** (ou distribuições Linux baseadas em Debian), você precisará ter o **GHDL** e o **GTKWave** instalados:

```bash
sudo apt update
sudo apt install ghdl gtkwave

```

---

## 🚀 Como Executar a Simulação via Terminal

Navegue até a pasta raiz do projeto onde os arquivos `.vhd` estão localizados e siga os passos abaixo:

### 1. Analisar (Compilar) os Arquivos VHDL

Compile os componentes respeitando a ordem de hierarquia (das dependências básicas até o *testbench*):

```bash
ghdl -a contador_8clk.vhd dec_4estados.vhd dec_cores.vhd maq_4estados.vhd design.vhd testbench.vhd

```

### 2. Elaborar o Testbench

Prepare o executável da simulação informando a entidade principal do seu *testbench*:

```bash
ghdl -e tb_semaforo

```

### 3. Executar a Simulação e Gerar o Arquivo de Formato de Onda

Rode a simulação gerando o arquivo `wave.vcd` contendo o histórico de transição dos sinais:

```bash
ghdl -r tb_semaforo --vcd=wave.vcd --stop-time=500ns

```

### 4. Visualizar os Resultados no GTKWave

Abra a interface gráfica para analisar o comportamento do circuito:

```bash
gtkwave wave.vcd

```

---

## 💡 Dicas Úteis

* Se houver modificações em qualquer arquivo de código `.vhd`, basta repetir os **Passos 1, 3 e 4** para atualizar a simulação.
* No **GTKWave**, utilize a opção *Insert Signals* para adicionar os barramentos e sinais de clock, reset e estados à tela de visualização.