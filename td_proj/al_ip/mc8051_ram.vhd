--
-- Copyright (c) 2002 by Aldec, Inc. All rights reserved.
--
------------------------------------------------------------------------------------
-- DESCRIPTION   :  Component was generated by Aldec IP CORE Generator, version 3.0
--                  Details: 
--                  Synchronous single ported RAM
--                  Word size : 8 bits
--                  Memory size : 128 words
--                  Clock (CLK) active : high
--                  Write enable (WE) active : high
-- CREATED       :  2003-7-22, 12:28:3
------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity mc8051_ram is
	port (
		reset      : in  std_logic;
		ram_wr_i : in STD_LOGIC;
		ram_en_i   : in  std_logic;
		clk : in STD_LOGIC;
		ram_adr_i : in STD_LOGIC_VECTOR(6 downto 0);
		ram_data_i : in STD_LOGIC_VECTOR (7 downto 0);
		ram_data_o : out STD_LOGIC_VECTOR (7 downto 0)
	);
end entity;

--}} End of automatically maintained section

architecture ram_arch of mc8051_ram is

type ram_mem_type is array (127 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal ram_mem : ram_mem_type;

begin
process (clk)
	begin
		if rising_edge(CLK) then
			if (ram_wr_i = '1') and (ram_en_i='1') then
				ram_mem(CONV_INTEGER(ram_adr_i)) <= ram_data_i;
			end if;
			ram_data_o <= ram_mem(CONV_INTEGER(ram_adr_i));
		end if;
	end process;
end architecture;

configuration mc8051_ram_sim_cfg of mc8051_ram is
  
  for ram_arch  
  end for;
  
end mc8051_ram_sim_cfg; 