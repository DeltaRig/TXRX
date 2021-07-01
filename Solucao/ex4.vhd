--------------------------------------
-- Biblioteca
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity tx_req is
  port( -- <COMPLETAR>
         clock, reset, send, grant : in std_logic;
         palavra : in std_logic_vector (7 downto 0);
         address : in std_logic_vector (1 downto 0);
         busy, linha, req: out std_logic );
end entity;

--------------------------------------
-- Arquitetura
--------------------------------------
architecture tx_req of tx_req is
  -- <COMPLETAR>    
  type states is (IDLE, START_BIT, REQSTATE, A0, A1, S0, S1, S2, S3, S4, S5, S6, S7, STOP_BIT);
  signal EA, PE : states;
begin

  -- <COMPLETAR>
-- Processo para troca de estados
process(reset, clock)
begin
  if reset='1' then 
    EA <= IDLE;
  elsif rising_edge(clock) then
    EA <= PE;
  end if;
end process;

-- Processo para definir o proximo estado
process(EA, send, grant)
begin
  case EA is
    when IDLE =>
      req <= '0';
      if send = '1' then
          PE <= REQSTATE;
      else
        PE <= IDLE;
      end if;

    when REQSTATE => 
        req <= '1';
        if grant = '1' then
        PE <= START_BIT;
        else 
          PE <= REQSTATE;
        end if;

    when START_BIT =>
        req <= '0';
        PE <= A0;   
      
    when A0 =>
      PE <= A1;
      
    when A1 =>
      PE <= S0;

    when S0 =>
      PE <= S1;

    when S1 =>
      PE <= S2;

    when S2 =>
      PE <= S3;

    when S3 =>
      PE <= S4;

    when S4 =>
      PE <= S5;

    when S5 =>
      PE <= S6;

    when S6 =>
      PE <= S7;

    when S7 =>
      PE <= STOP_BIT;

    when STOP_BIT =>
      PE <= IDLE;
  end case;
end process;

-- Bloco de dados
busy  <= '0' when EA=IDLE else '1';

linha <= '0'        when EA=START_BIT or EA=STOP_BIT else
         'H'        when EA = REQSTATE else
         address(0) when EA=A0 else
         address(1) when EA=A1 else
         palavra(0) when EA=S0 else  --  envio da palavra
         palavra(1) when EA=S1 else  
         palavra(2) when EA=S2 else  
         palavra(3) when EA=S3 else  
         palavra(4) when EA=S4 else  
         palavra(5) when EA=S5 else  
         palavra(6) when EA=S6 else  
         palavra(7) when EA=S7 else 
         'H'; -- default
end architecture;