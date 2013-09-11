library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity display_matrix is
    Port (  
			VN2andVN1 : in std_logic_vector(7 downto 0);	
			reset : in std_logic_vector (1 downto 0);
			LCD_DIN : inout  STD_LOGIC;
			LCD_LP : inout  STD_LOGIC;
			LCD_FLM : inout  STD_LOGIC;
			LCD_SCP : inout STD_LOGIC;
			LCD_LED_GRN : inout  STD_LOGIC;
			LCD_LED_RED : inout  STD_LOGIC;
			clk50			: in std_logic;
			--		VME interface -------------------------
			disp_in : in std_logic_vector(3 downto 0);
			u_ad_reg :in std_logic_vector(11 downto 2);
			u_dat_in :in std_logic_vector(31 downto 0);
			u_data_o :out std_logic_vector(31 downto 0);
			ckaddr,ws,oecsr, ckcsr:in std_logic
	  );
end display_matrix;

architecture RTL of display_matrix is

	signal	scp_div				: integer range 0 to 30;
	signal	row_count			: integer range 0 to 25;
	signal	col_count			: integer range 0 to 42;
	signal	col_count8			: integer range 0 to 7;
	signal 	ccol					:integer range 0 to 30;
	signal 	ccol1					: integer range 0 to 7;
	signal 	cfrm					: integer range 0 to 50;



	signal col_counter	: integer range 0 to 15;
	signal	page					: std_logic_vector (10 downto 0);
	--signal	count					: integer range 0 to 24;

	signal cmdreg		: std_logic_vector(7 downto 0);
	signal newcmd		: std_logic;
	signal cmdclr		: std_logic;
	signal lcd_clk		: std_logic;

	signal rescount	: integer range 0 to 24;

	signal locreset	: std_logic := '0';

	--------- declaration for state machines
	--type dpramacctype is (dp00,dp01,dp01a,dp01b,dp01c,dp01d,dp02a,dp02c,dp03,dp04,dp05,dp06,dp07,dp08,dp09);
	--signal  dpacc, dpacc_nx : dpramacctype;

	--signal sta  : std_logic_vector(3 downto 0) ;
	--signal led_out		: std_logic_vector ( 7 downto 0);


	constant dispcmd	: std_logic_vector(1 downto 0) := b"01";  -- DISP command register
	constant dispmem	: std_logic_vector(1 downto 0) := b"10";  -- DISP ram addr

	-- signals for dpram
	--signal address_a	:	std_logic_vector(10 downto 0);
	signal address_b  :	std_logic_vector(10 downto 0);
	--signal datain_a		:	std_logic_vector(7 downto 0);
	--signal dataout_a		: std_logic_vector(7 downto 0);
	signal dataout_b		: std_logic_vector(7 downto 0);

	signal ram_ena, cmd_ena: std_logic;
	signal wrena_a :std_logic;
	--
	signal count2	:	integer range 0 to 7;
	signal count1  :	integer range 0 to 7;
	signal puls		:	std_logic_vector(1 downto 0);
	signal lcdedge	:	std_logic_vector(2 downto 0);
	signal lpena		: std_logic;
	signal frmena		: std_logic;


	signal lcd_dat : std_logic_vector( 31 downto 0);
	constant fixed : std_logic_vector( 7 downto 0):=x"F0";

	constant COLCNTMAX : integer := 1023;
	signal disp_error : std_logic;
	signal error_count : integer range 0 to COLCNTMAX;
	signal disp_active : std_logic;
	signal active_count : integer range 0 to COLCNTMAX;

	signal disp_sel : std_logic_vector ( 7 downto 0);
	signal disp_image_1 : std_logic_vector( 31 downto 0);
	constant BASE_DISP_SEL : std_logic_vector(11 downto 2) := b"0000000000"; --0x0100 -> 0x017c(0x0160)  r/w

	--------- Peters Code

	--"standard" display content
	type ROM_array is array(0 to 23) of std_logic_vector(0 to 35);
	constant ROM_content_Slave1 : ROM_array := (
		0 => x"000000000", 1 => x"000000000", 2 => x"0000A0410", 3 => x"0000A0630", 
		4 => x"014CA6630", 5 => x"00D2AD550", 6 => x"005EAD550", 7 => x"0042AB550", 
		8 => x"0052AB550", 9 => x"004CA6490", 10 => x"000000000", 11 => x"000000000", 
		12 => x"000000000", 13 => x"000078000", 14 => x"000030000", 15 => x"000030000", 
		16 => x"000030000", 17 => x"000030000", 18 => x"000030000", 19 => x"000030000", 
		20 => x"000030000", 21 => x"000078000", 22 => x"000000000", 23 => x"000000000" );
	constant ROM_content_Slave2 : ROM_array := (
		0 => x"000000000", 1 => x"000000000", 2 => x"0000A0410", 3 => x"0000A0630", 
		4 => x"014CA6630", 5 => x"00D2AD550", 6 => x"005EAD550", 7 => x"0042AB550", 
		8 => x"0052AB550", 9 => x"004CA6490", 10 => x"000000000", 11 => x"000000000", 
		12 => x"000000000", 13 => x"0003F8000", 14 => x"0001B0000", 15 => x"0001B0000", 
		16 => x"0001B0000", 17 => x"0001B0000", 18 => x"0001B0000", 19 => x"0001B0000", 
		20 => x"0001B0000", 21 => x"0003F8000", 22 => x"000000000", 23 => x"000000000" );
	constant ROM_content_Slave3 : ROM_array := (
		0 => x"000000000", 1 => x"000000000", 2 => x"0000A0410", 3 => x"0000A0630", 
		4 => x"014CA6630", 5 => x"00D2AD550", 6 => x"005EAD550", 7 => x"0042AB550", 
		8 => x"0052AB550", 9 => x"004CA6490", 10 => x"000000000", 11 => x"000000000", 
		12 => x"000000000", 13 => x"001FF8000", 14 => x"000DB0000", 15 => x"000DB0000", 
		16 => x"000DB0000", 17 => x"000DB0000", 18 => x"000DB0000", 19 => x"000DB0000", 
		20 => x"000DB0000", 21 => x"001FF8000", 22 => x"000000000", 23 => x"000000000" );
	constant ROM_content_Slave4 : ROM_array := (
		0 => x"000000000", 1 => x"000000000", 2 => x"0000A0410", 3 => x"0000A0630", 
		4 => x"014CA6630", 5 => x"00D2AD550", 6 => x"005EAD550", 7 => x"0042AB550", 
		8 => x"0052AB550", 9 => x"004CA6490", 10 => x"000000000", 11 => x"000000000", 
		12 => x"000000000", 13 => x"001DF8000", 14 => x"000DB0000", 15 => x"000DB0000", 
		16 => x"000DB0000", 17 => x"000DB0000", 18 => x"000FB0000", 19 => x"000730000", 
		20 => x"000730000", 21 => x"001FF8000", 22 => x"000000000", 23 => x"000000000" );
	constant ROM_content_Slave_WrongVME : ROM_array := (
		0 => x"000000000", 1 => x"000000000", 2 => x"000000000", 3 => x"01C737540", 
		4 => x"012949540", 5 => x"012949540", 6 => x"012949540", 7 => x"01C931280", 
		8 => x"012000000", 9 => x"00C000000", 10 => x"000000000", 11 => x"000000000", 
		12 => x"000000000", 13 => x"000000000", 14 => x"08823CDA2", 15 => x"088504DA2", 
		16 => x"6EE504DB6", 17 => x"29953CD94", 18 => x"299704D94", 19 => x"299884D94", 
		20 => x"2EE8BCA98", 21 => x"000000000", 22 => x"000020000", 23 => x"000000000"
	);

	--------- Peters Code End


begin


--
---- xxxxxxxxxxxxxxxxx    Matrix display   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxx
	-------------------------------------------------------
	-- clock generation  for display ----------------------
	-------------------------------------------------------
	PROCESS (clk50)
	BEGIN
	
		-- clock for lcd ------------------------------
		IF (rising_edge(clk50)) THEN
			scp_div <= scp_div + 1;
			if scp_div > 14 then				-- cpld_clk / 28 
				lcd_clk <= NOT lcd_clk;		-- => 50MHz / 28 = 1,78Mhz = LCD_SCP (Clock for LCD)
				scp_div <= 0;
			end if;
	end if;
	end process;
	
	
	process (clk50,lcd_clk)
	begin
		if(rising_edge(clk50)) then
			LCD_SCP <= lcd_clk;
		end if;
	end process;
	
	
	------------- Peters code
	
	  process (lcd_clk,locreset)
  begin
    -- count rows and collums	
    if (rising_edge(lcd_clk)) then
      col_count <= col_count + 1;
      if col_count > 34 then
        row_count <= row_count + 1;
        col_count <= 0;
        if row_count > 22 then
          row_count <= 0;
        end if;
      end if;
		
		if row_count >= 0 and row_count <= 23 then
			if VN2andVN1 = x"01" then
				lcd_din <= ROM_content_Slave1(row_count)(col_count);
			elsif VN2andVN1 = x"02" then
				lcd_din <= ROM_content_Slave2(row_count)(col_count);
			elsif VN2andVN1 = x"03" then
				lcd_din <= ROM_content_Slave3(row_count)(col_count);
			elsif VN2andVN1 = x"04" then
				lcd_din <= ROM_content_Slave4(row_count)(col_count);
			else
				lcd_din <= ROM_content_Slave_WrongVME(row_count)(col_count);
			end if;
      else 
        lcd_din <=   '1';
      end if;
      
      -- generate line pulse on bit 36 of every line
      if  col_count = 35 then
        lcd_lp <=  '1';
      else
        lcd_lp <=  '0';
      end if;
      
      -- generate first line marker on bit 40 of line 1 and bit 1 of line 2
      if ( (col_count = 35)and (row_count = 0)) or( (col_count = 0)and (row_count = 1)) then
        lcd_flm <= '1';
      else
        lcd_flm <= '0';
      end if;
    end if;
  end process;

	
	------------- Peters Code End
	
	
	
	

	
--  -------- generate PWM for display backlight ------------
	process ( clk50)
	begin
		if(rising_edge(clk50)) then
			LCD_LED_RED <= '1'; 			-- turn red backlight off
			LCD_LED_GRN <= '0';			-- turn green backlight on
--			LCD_LED_RED <= not disp_sel(0);
--			LCD_LED_GRN <= not disp_sel(1);
 		end if;
 	end process;


				
-------- end of pwm generation --------------------------



----VME access ----------------------------------------------------------------------------------------- .................... decoder for data registers ................................
		-- process write command from VME bus
		process(clk50, ckcsr, u_ad_reg)
		begin

			if (clk50'event and clk50 ='1') then

				if (ckcsr='1' and u_ad_reg(11 downto 2)= BASE_DISP_SEL  ) then
						disp_sel(7 downto 0) <= u_dat_in(7 downto 0);
				end if;
			end if;
		end process;



-------- vme read cycle -------------------------------------------------------
		-- process read command from VME bus

		process(clk50, oecsr, u_ad_reg)
		begin
  			if (clk50'event and clk50 ='1' and oecsr ='1') then

				if (u_ad_reg(11 downto 2)= BASE_DISP_SEL  ) then
						u_data_o( 7 downto 0) <= disp_sel;
						u_data_o(31 downto 8) <= (others =>'0');
				end if;	
				-- More vme addresses can be inserted here like the four lines above
			end if;

		end process;
		
		

end RTL;

