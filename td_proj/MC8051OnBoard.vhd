library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_arith.all;

library work;
use work.mc8051_p.all;


entity  MC8051OnBoard is 

port (
        sysclk : in std_logic;
        key     : in std_logic;        
        led   : out std_logic
        );
 
end MC8051OnBoard;

architecture rtl of MC8051OnBoard is
  signal P1:std_logic_vector(7 downto 0);
  
  signal P0_o:std_logic_vector(7 downto 0);
  signal P1_o:std_logic_vector(7 downto 0);
  signal P2_o:std_logic_vector(7 downto 0);
  signal P3_o:std_logic_vector(7 downto 0);
  
   signal all_rxd_o:std_logic_vector(C_IMPL_N_SIU-1 downto 0);
   signal all_txd_o:std_logic_vector(C_IMPL_N_SIU-1 downto 0);
   signal all_rxdwr_o:std_logic_vector(C_IMPL_N_SIU-1 downto 0);
   
   
  signal mcu_clk_110592:std_logic;
  signal reset:std_logic;
  signal nreset:std_logic;
  
  
component pll
PORT ( refclk	: IN	STD_LOGIC;
		reset	: IN	STD_LOGIC;
		clk0_out	: OUT	STD_LOGIC;
		clk1_out	: OUT	STD_LOGIC;
		clk2_out	: OUT	STD_LOGIC);
end component;
		
  component mc8051_top
    port (clk       : in std_logic;   -- system clock
        reset     : in std_logic;   -- system reset
        int0_i    : in std_logic_vector(C_IMPL_N_EXT-1 downto 0);  -- ext.Int
        int1_i    : in std_logic_vector(C_IMPL_N_EXT-1 downto 0);  -- ext.Int
        -- counter input 0 for T/C
        all_t0_i  : in std_logic_vector(C_IMPL_N_TMR-1 downto 0);
        -- counter input 1 for T/C
        all_t1_i  : in std_logic_vector(C_IMPL_N_TMR-1 downto 0);
        -- serial input for SIU
        all_rxd_i : in std_logic_vector(C_IMPL_N_SIU-1 downto 0);
        p0_i      : in std_logic_vector(7 downto 0);  -- IO-port0 input
        p1_i      : in std_logic_vector(7 downto 0);  -- IO-port1 input
        p2_i      : in std_logic_vector(7 downto 0);  -- IO-port2 input
        p3_i      : in std_logic_vector(7 downto 0);  -- IO-port3 input 

        p0_o        : out std_logic_vector(7 downto 0);  -- IO-port0 output
        p1_o        : out std_logic_vector(7 downto 0);  -- IO-port1 output
        p2_o        : out std_logic_vector(7 downto 0);  -- IO-port2 output
        p3_o        : out std_logic_vector(7 downto 0);  -- IO-port3 output
        -- Mode 0 serial output for SIU
        all_rxd_o   : out std_logic_vector(C_IMPL_N_SIU-1 downto 0);
        -- serial output for SIU 
        all_txd_o   : out std_logic_vector(C_IMPL_N_SIU-1 downto 0);
        -- rxd direction signal
        all_rxdwr_o : out std_logic_vector(C_IMPL_N_SIU-1 downto 0));  
  end component;
  
 begin
    reset<=key;
	nreset<=not key;
	
  u_pll: pll port map
  (
  	refclk=>sysclk,
  	reset =>nreset,
	clk1_out=>mcu_clk_110592
  );

	u8051_inst:mc8051_top  port map(
	clk=>mcu_clk_110592,
	reset=>nreset,
	int0_i =>"0",
	int1_i =>"0",
    -- counter input 0 for T/C
	all_t0_i=>"0",
     -- counter input 1 for T/C
	all_t1_i=>"0",
      -- serial input for SIU
	all_rxd_i=>"1",
    
	p0_i =>(others=>'1'),
    p1_i =>"11111111",
    p2_i=>"11111111",
    p3_i=>"11111111",
        
		p0_o=>P0_o,
        p1_o=>P1,
        p2_o=>(P2_o),
        p3_o=>(P3_o),
        -- Mode 0 serial output for SIU
        all_rxd_o=>(all_rxd_o),
        -- serial output for SIU 
        all_txd_o=>(all_txd_o),
        -- rxd direction signal
        all_rxdwr_o =>(all_rxdwr_o)
    );

    led <= P1(0);  

end rtl; 