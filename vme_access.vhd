
----------------------------------------------------------------------------------
-- Company:     GSI
-- Engineer:    S.Minami
-- 
-- Create Date:    10:47:22 06/03/2008 
-- Design Name: vme_access.vhd
-- Module Name:    vme_access - Behavioral 
-- Project Name:  vuprom_tdc_v2
-- Target Devices: VUPROM2
-- Tool versions: ISE 9.2
-- Description:  a module for vme access control
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vme_access is
  generic (
    BASE_AD : std_logic_vector( 23 downto 20) := b"0000"
                                        -- VME base address D23 to D 20
    );
    
  Port ( AD : inout  STD_LOGIC_VECTOR (31 downto 0);
		vmeaccess_out : out STD_LOGIC_VECTOR (31 downto 0);	
		VME_Reset : in std_logic;
           ASI : in  STD_LOGIC;
           WRI : in  STD_LOGIC;
           DS0I : in  STD_LOGIC;
           DS1I : in  STD_LOGIC;
           CON : inout  STD_LOGIC_VECTOR (15 downto 0);
			  VN2andVN1 : out std_logic_vector(7 downto 0);
           DB : out  STD_LOGIC_VECTOR (7 downto 0);
			  CKADDR : out STD_LOGIC;
			  WS : out STD_LOGIC; -- Anselm: write signal?
           CKCSR : out  STD_LOGIC;
           OECSR : out  STD_LOGIC;
			  U_AD_REG : out STD_LOGIC_VECTOR ( 31 downto 2);
			  U_DAT_IN : in STD_LOGIC_VECTOR ( 31 downto 0);
			  U_DAT_OUT : out STD_LOGIC_VECTOR ( 31 downto 0);
 
			  CLK : in  STD_LOGIC);
end vme_access;

architecture Behavioral of vme_access is


------------------------------- vme signals -----------------------------------------------
signal asis	: std_logic;		-- synchronized  VME !AS
signal dsr	: std_logic;		-- synchronized  VME (!DS0 and !DS1)
signal ad_reg		: std_logic_vector (31 downto 0);	 -- internal address register for VME address
--signal u_ad_reg 	:std_logic_vector(19 downto 2);	
--signal u_dat_in 	:std_logic_vector(31 downto 0);	


--type vme_adr_typ is (va00,va01,va02,va03,va04,va05,va0b, vaRecovery);	-- va06,va07,va08,va09,va0a,
--signal vme_adr, vme_anx : vme_adr_typ;
	subtype vme_adr_typ is std_logic_vector(2 downto 0);
	constant va00 : vme_adr_typ 			:= "000";
	constant va01 : vme_adr_typ 			:= "001";
	constant va02 : vme_adr_typ 			:= "011";
	constant va03 : vme_adr_typ 			:= "010";
	constant va04 : vme_adr_typ 			:= "110";
	constant va05 : vme_adr_typ 			:= "111";
	constant va0b : vme_adr_typ 			:= "101";
	constant vaRecovery : vme_adr_typ 	:= "100";
	signal vme_adr, vme_adr_Next : vme_adr_typ;

	--Always use gray code for FSM!! http://en.wikipedia.org/wiki/Gray_code
	attribute safe_recovery_state: string;
	attribute safe_recovery_state of vme_adr: signal is "100"; -- always use some separate Recovery State
	attribute safe_implementation: string;
	attribute safe_implementation of vme_adr: signal is "yes";
	attribute fsm_encoding: string;
	attribute fsm_encoding of vme_adr: signal is "user"; -- "{auto | one-hot | compact | sequential | gray | johnson | speed1 | user}";
	attribute fsm_extract: string;
	attribute fsm_extract of vme_adr: signal is "yes";
	attribute register_powerup : string;
	attribute register_powerup of vme_adr : signal is "000"; -- if the FSm has no reset option, then thhis attribute has to be set. Otherwise it wont be recognised as a FSM.



	--type vmdacs_typ is (vc00,vc01,vc02,vc03,vc04,vc05,vc06,vc08,vc09,vc0a,vc0b,vc0c,vc0d,vc0e);
	subtype vmdacs_typ is std_logic_vector(3 downto 0);
	constant vc00 : vmdacs_typ 			:= "0000";
	constant vc01 : vmdacs_typ 			:= "0001";
	constant vc02 : vmdacs_typ 			:= "0011";
	constant vc03 : vmdacs_typ 			:= "0010";
	constant vc04 : vmdacs_typ 			:= "0110";
	constant vc05 : vmdacs_typ 			:= "0111";
	constant vc06 : vmdacs_typ 			:= "0101";
	constant vc08 : vmdacs_typ 			:= "0100";
	constant vc09 : vmdacs_typ 			:= "1100";
	constant vc0a : vmdacs_typ 			:= "1101";
	constant vc0b : vmdacs_typ 			:= "1111";
	constant vc0c : vmdacs_typ 			:= "1110";
	constant vc0d : vmdacs_typ 			:= "1010";
	constant vc0e : vmdacs_typ 			:= "1011";
	constant vcRecovery : vmdacs_typ 	:= "1001";
	signal vmdacs, vmdacs_nx : vmdacs_typ;
	attribute safe_recovery_state of vmdacs: signal is "1001";--"1001"; -- always use some separate Recovery State
	attribute safe_implementation of vmdacs: signal is "yes";
	attribute fsm_encoding of vmdacs: signal is "user"; -- "{auto | one-hot | compact | sequential | gray | johnson | speed1 | user}";
	attribute fsm_extract of vmdacs: signal is "yes";
	attribute register_powerup of vmdacs : signal is "0000"; -- if the FSm has no reset option, then thhis attribute has to be set. Otherwise it wont be recognised as a FSM.


	signal st_csr_drd		: std_logic;	 -- start state machine for CSR read
	signal st_csr_dwr		: std_logic;	 -- start state machine for CSR write   
	signal selcsr		: std_logic;	 -- CSR selected

	signal int_res		: std_logic_vector (23 downto 20);	 -- internal address register for VME address
	signal sel_rnd		: std_logic;	 -- FLASH, CSR, HPI, DPRAM random access
	signal sel_bt32	: std_logic;	 -- DPRAM BT 32 access

	signal ckad		: std_logic;				-- clock for internal address register
	signal stda		: std_logic;				-- start data phase	state machine
	signal wrs		: std_logic;				-- synchronized VME WRITE
	signal readacc,writeacc	: std_logic;
	signal regsel	:std_logic;
	signal csr_o	: std_logic_vector (1 downto 0);  	-- vme data phase outputs for csr 
	signal vdcsr	: std_logic_vector (3 downto 0);  	-- vme data phase outputs for external vme buffer register 
	signal aph_sta, dph_sta	: std_logic_vector (3 downto 0);  	-- states of aph machine
	signal enable		: std_logic;				-- enable internal data bus to outside of fpga
	signal ack_csr		: std_logic;				-- internal acknowledge csr

begin
	vmeaccess_out(0) <= '1' when vme_adr = va00 else '0';
	vmeaccess_out(1) <= '1' when vme_adr = va01 else '0';
	vmeaccess_out(2) <= '1' when vme_adr = va02 else '0';
	vmeaccess_out(3) <= '1' when vme_adr = va03 else '0';
	vmeaccess_out(4) <= '1' when vme_adr = va04 else '0';
	vmeaccess_out(5) <= '1' when vme_adr = va05 else '0';
	vmeaccess_out(6) <= '1' when vme_adr = va0b else '0';
	
	vmeaccess_out(7) <= '1' when vmdacs = vc00 else '0';
	vmeaccess_out(8) <= '1' when vmdacs = vc01 else '0';
	vmeaccess_out(9) <= '1' when vmdacs = vc02 else '0';
	vmeaccess_out(10) <= '1' when vmdacs = vc03 else '0';
	vmeaccess_out(11) <= '1' when vmdacs = vc04 else '0';
	vmeaccess_out(12) <= '1' when vmdacs = vc05 else '0';
	vmeaccess_out(13) <= '1' when vmdacs = vc06 else '0';
	vmeaccess_out(14) <= '1' when vmdacs = vc08 else '0';
	vmeaccess_out(15) <= '1' when vmdacs = vc09 else '0';
	vmeaccess_out(16) <= '1' when vmdacs = vc0a else '0';
	vmeaccess_out(17) <= '1' when vmdacs = vc0b else '0';
	vmeaccess_out(18) <= '1' when vmdacs = vc0c else '0';
	vmeaccess_out(19) <= '1' when vmdacs = vc0d else '0';
	vmeaccess_out(20) <= '1' when vmdacs = vc0e else '0';
	vmeaccess_out(31 downto 21) <= (others => '0');
	
	
	------------------------------------------------------------------------
	-- Reading VN1 and VN2
	------------------------------------------------------------------------
	process (clk)
	begin
		if rising_edge(clk) then
			con(13 downto 12) <= con(13 downto 12)+1;
			case con(13 downto 12) is
				when "00" => VN2andVN1(7 downto 6) <= con(15 downto 14);
				when "01" => VN2andVN1(5 downto 4) <= con(15 downto 14);
				when "10" => VN2andVN1(3 downto 2) <= con(15 downto 14);
				when "11" => VN2andVN1(1 downto 0) <= con(15 downto 14);
				when others => null;    -- null = no operation
			end case;
		end if;
	end process;
	------------------------------------------------------------------------



----* ADPH @@@@@@@@@@@@@@@@ VME ADDRESS PHASE @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--...................... synchronize and invert address strobe .......................
	process(clk) begin
		if (rising_edge(clk)) then 
		    asis <= not ASI;
		    dsr  <= not DS0I and not DS1I;      -- synchronized DS input from VME
		end if;
	end process;
--

	U_AD_REG 	<=	 ad_reg(31 downto 2);
	U_DAT_OUT 	<=	 AD;    -- VME address/data bus (31 downto 0)
	
	
--...................... VME address phase state machine .......................
	
	process (clk)
	begin
		if (rising_edge(clk)) then
			if VME_Reset = '1' then
				vme_adr <= va00;
			else
				vme_adr <= vme_adr_Next;
			end if;
		end if;
	end process;
	
	process (clk,vme_adr,asis) 	-- states are - va00,va01,va02,va03,va04,va05,va0b
	begin
		if (vme_adr = vaRecovery) then
			vme_adr_Next <= va00;
		elsif (vme_adr = va00) and (asis = '1') then	
			vme_adr_Next <= va01;
		elsif (vme_adr = va00) then
			vme_adr_Next <= va00;
		elsif (vme_adr = va01) and (asis = '1') then
			vme_adr_Next <= va02;
		elsif (vme_adr = va01) then
			vme_adr_Next <= va00;
		elsif (vme_adr = va02) then
			vme_adr_Next <= va03;
		elsif (vme_adr = va03) then
			vme_adr_Next <= va04;
		elsif (vme_adr = va04) then
			vme_adr_Next <= va05;
		elsif (vme_adr = va05) then
			vme_adr_Next <= va0b;
		elsif (vme_adr = va0b) and (asis = '1') then
			vme_adr_Next <= va0b;
		elsif (vme_adr = va0b) then
			vme_adr_Next <= va00;				
		else 
			vme_adr_Next <= va00;
		end if;

--			case vme_adr is
--				when vaRecovery =>
--					vme_adr_Next <= va00;
--				when va00 =>
--					if	asis ='1' then	
--						vme_adr_Next <= va01;
--					else
--						vme_adr_Next <= va00;
--					end if;
--				when va01 =>
--					if	asis ='1' then
--						vme_adr_Next <= va02;
--					else
--						vme_adr_Next <= va00;
--					end if;
--				when va02 => vme_adr_Next <= va03;
--				when va03 => vme_adr_Next <= va04;
--				when va04 => vme_adr_Next <= va05;
--				when va05 => vme_adr_Next <= va0b;
--				when va0b =>
--					if asis ='1' then
--						vme_adr_Next <= va0b;
--					else
--						vme_adr_Next <= va00;				
--					end if;
--				when others => vme_adr_Next <= va00;
--			end case;
   end process;
-- .............................. synchronize outputs ..................................
	process(vme_adr) 
	begin
		if ( (vme_adr = va02) or (vme_adr=va03) ) then
		  ckad <= '1';
		else
		  ckad <= '0';
		end if;
		if ( (vme_adr = va04) or (vme_adr = va05) or (vme_adr = va0b) ) then
			stda <= '1';
		else
			stda <='0';
		end if;
	end process;
	CKADDR <= ckad;
	
----................... end of VME address phase state machine ...................
--
---................... save VME address into FPGA internal address register ...................
	process(clk, ckad)
	begin
		if (rising_edge(clk)) then
			if ckad = '1' then
				ad_reg <= AD;
				wrs <= WRI;  
			end if;
		end if;
	end process;
	WS <= not wrs;
	int_res	<= ad_reg(23 downto 20);  -- internal resources 
--..................  transfer mode decoded by CPLD
	process(clk)								  
	begin
		if (rising_edge(clk)) then   
			sel_rnd <= CON(7);   -- CSR random access
			sel_bt32 <= CON(8);  --  BT 32 bit access
		end if;
	end process;


-- * CSR0 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ DATA PHASE for CSR @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--................................  comparator for CSR  and  DSP CSR  .......................................

	process(clk)
	begin
		if(rising_edge(clk)) then
			if (dsr='1' and stda='1' and wrs='1' and sel_rnd='1') then 
				readacc <= '1'; -- CSR sta-ma
			else 
				readacc <= '0';
			end if;    
			if (dsr='1' and stda='1' and wrs='0' and sel_rnd='1') then 
				writeacc <= '1'; -- CSR sta-ma
			else 
				writeacc <= '0';
			end if;   
		end if;
	end process;

	process(clk) begin
	--	if(rising_edge(clk)) then
	--		if(int_res = BASE_AD) then  -- csr_ad is constant
	--			regsel <= '1';
	--		else
	--			regsel <= '0';
	--		end if;
	--	end if;
		regsel<='1';
   end process;
		  
	process(clk)			-- address selection for internal csr and dsp csr registers
	begin
		if (rising_edge(clk)) then   
			if (readacc = '1' and regsel = '1') then 
				st_csr_drd <= '1'; -- CSR sta-ma
			else 
				st_csr_drd <= '0';
			end if;    
		end if;
	end process;
	
	process(clk) begin
		if(rising_edge(clk)) then
			if (writeacc = '1' and regsel = '1' ) then 
				st_csr_dwr <= '1'; -- CSR sta-ma
			else 
				st_csr_dwr <= '0';
			end if; 
		end if;
	end process;
	
	process (clk)
	begin
		if (rising_edge(clk)) then   
			if (int_res=BASE_AD and sel_rnd='1') then 
				selcsr <= '1'; -- CSR selected
			else 
				selcsr <= '0';
			end if;  
		end if;
	end process;

-- ............................ clock for vmedacs state machine ................................
	process(clk) 
	begin
		if (rising_edge(clk)) then 
			if VME_Reset = '1' then
				vmdacs <= vc00;
			else
				vmdacs <= vmdacs_nx;
			end if;
		end if;
	end process;

	process (vmdacs, dsr, st_csr_dwr, st_csr_drd) 	-- states are - vc00,vc01,vc02,vc03,vc04,vc05,vc06,vc07,vc08 
		begin
			csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1';
			if (vmdacs = vc00) and (st_csr_drd ='1') then
				csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"0"; 		
				vmdacs_nx <= vc01;						
			elsif (vmdacs = vc00) and (st_csr_dwr ='1') then
				csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"0"; 		
				vmdacs_nx <= vc08;		
			elsif (vmdacs = vc00) then
				csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"0"; 		
				vmdacs_nx <= vc00;
--............................. read csr ................................
			elsif (vmdacs = vc01) then
				vmdacs_nx <= vc02;	csr_o <= b"01"; vdcsr <= b"1010"; ack_csr	<='1'; dph_sta <= x"1";
			elsif (vmdacs = vc02) then
				vmdacs_nx <= vc03;	csr_o <= b"01"; vdcsr <= b"1010"; ack_csr	<='1'; dph_sta <= x"2";
			elsif (vmdacs = vc03) then
				vmdacs_nx <= vc04;	csr_o <= b"01"; vdcsr <= b"1010"; ack_csr	<='1'; dph_sta <= x"3";
			elsif (vmdacs = vc04) then
				vmdacs_nx <= vc05;	csr_o <= b"01"; vdcsr <= b"1000"; ack_csr	<='1'; dph_sta <= x"4";
			elsif (vmdacs = vc05) and (dsr ='1') then
				csr_o <= b"01"; vdcsr <= b"1001"; ack_csr	<='0'; dph_sta <= x"5"; 		
				vmdacs_nx <= vc05;						
			elsif (vmdacs = vc05) then
				csr_o <= b"01"; vdcsr <= b"1001"; ack_csr	<='0'; dph_sta <= x"5"; 		
				vmdacs_nx <= vc06;						
			elsif (vmdacs = vc06) then
				vmdacs_nx <= vc00;	csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"6";
--............................. write csr ................................
			elsif (vmdacs = vc08) then
				vmdacs_nx <= vc09;	csr_o <= b"10"; vdcsr <= b"0011"; ack_csr	<='1'; dph_sta <= x"8";
			elsif (vmdacs = vc09) then
				vmdacs_nx <= vc0a;	csr_o <= b"10"; vdcsr <= b"0011"; ack_csr	<='1'; dph_sta <= x"9";
			elsif (vmdacs = vc0a) then
				vmdacs_nx <= vc0b;	csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='1'; dph_sta <= x"a";
			elsif (vmdacs = vc0b) then
				vmdacs_nx <= vc0c;	csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='1'; dph_sta <= x"b";
			elsif (vmdacs = vc0c) then
				vmdacs_nx <= vc0d;	csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='1'; dph_sta <= x"c";
			elsif (vmdacs = vc0d) and (dsr ='1') then
				csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='0'; dph_sta <= x"d"; 		
				vmdacs_nx <= vc0d;
			elsif (vmdacs = vc0d) then
				csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='0'; dph_sta <= x"d"; 		
				vmdacs_nx <= vc0e;	
			elsif (vmdacs = vc0e) then
				vmdacs_nx <= vc00;	csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"e";
			elsif (vmdacs = vcRecovery) then
				vmdacs_nx <= vc00;
			else
				vmdacs_nx <= vc00;
			end if;


--			case vmdacs is
--				when vc00 => 							csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"0"; 		
--					if st_csr_drd ='1' then
--						vmdacs_nx <= vc01;						
--					elsif st_csr_dwr ='1' then
--						vmdacs_nx <= vc08;		
--					else 	
--						vmdacs_nx <= vc00;
--					end if;
----............................. read csr ................................
--				when vc01 => vmdacs_nx <= vc02;	csr_o <= b"01"; vdcsr <= b"1010"; ack_csr	<='1'; dph_sta <= x"1"; 								
--				when vc02 => vmdacs_nx <= vc03;	csr_o <= b"01"; vdcsr <= b"1010"; ack_csr	<='1'; dph_sta <= x"2";						
--				when vc03 => vmdacs_nx <= vc04;	csr_o <= b"01"; vdcsr <= b"1010"; ack_csr	<='1'; dph_sta <= x"3";						
--				when vc04 => vmdacs_nx <= vc05;	csr_o <= b"01"; vdcsr <= b"1000"; ack_csr	<='1'; dph_sta <= x"4";						
--				when vc05 => 							csr_o <= b"01"; vdcsr <= b"1001"; ack_csr	<='0'; dph_sta <= x"5"; 		
--					if dsr ='1' then
--						vmdacs_nx <= vc05;						
--					else
--						vmdacs_nx <= vc06;						
--					end if;
--				when vc06 => vmdacs_nx <= vc00;	csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"6";						
----............................. write csr ................................
--				when vc08 => vmdacs_nx <= vc09;	csr_o <= b"10"; vdcsr <= b"0011"; ack_csr	<='1'; dph_sta <= x"8";
--				when vc09 => vmdacs_nx <= vc0a;	csr_o <= b"10"; vdcsr <= b"0011"; ack_csr	<='1'; dph_sta <= x"9";
--				when vc0a => vmdacs_nx <= vc0b;	csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='1'; dph_sta <= x"a";
--				when vc0b => vmdacs_nx <= vc0c;	csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='1'; dph_sta <= x"b";
--				when vc0c => vmdacs_nx <= vc0d;	csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='1'; dph_sta <= x"c";
--				when vc0d => 							csr_o <= b"10"; vdcsr <= b"0111"; ack_csr	<='0'; dph_sta <= x"d"; 		
--					if dsr ='1' then
--						vmdacs_nx <= vc0d;
--					else 
--						vmdacs_nx <= vc0e;	
--					end if;
--				when vc0e => vmdacs_nx <= vc00;	csr_o <= b"00"; vdcsr <= b"1011"; ack_csr	<='1'; dph_sta <= x"e";
--				when vcRecovery => vmdacs_nx <= vc00;
--				when others => vmdacs_nx <= vc00;
--			 end case;

	end process;
-- ...................................................................................
	
	
-- .............................. synchronize outputs ..................................
	process(clk) begin
		if (rising_edge(clk)) then 
			if(selcsr = '1') then
				ckcsr	<= csr_o(1);	-- clock data into csr
				oecsr	<= csr_o(0);	-- output data from csr to VME
			else
				ckcsr <= '0';
            oecsr <= '0';
			end if;
		end if;
	end process;
	
	

--------------------------- Multiplexer	for VME buffer and VME control signals -------------------------------
--			vdbuf = odvi,cdvi,odiv,cdiv
	process(clk)
	begin
		if (rising_edge(clk)) then   
			if ( selcsr='1' ) then 
				CON(4)	<=	vdcsr(3);	-- odvi = OE for data register VME<-internal
				CON(3)	<=	vdcsr(2);	-- cdvi = clock for data register VME<-internal
				CON(2)	<=	vdcsr(1);	-- odiv = OE for data register internal<-VME  
				CON(1)	<=	vdcsr(0);	-- cdiv = clock for data register internal<-VME
				CON(0)	<=	ack_csr;		-- acknowledge from csr
			else 
				CON(4) <= '1';
				CON(3) <= '1';
				CON(2) <= '1';
				CON(1) <= '1';
				CON(0) <= '1';	-- inactive
			end if;    
		end if;
	end process; 
		
	enable	<=	csr_o(0);	-- address and data bus output
	AD <= U_DAT_IN when enable ='1' else (others => 'Z');		  
	
	DB(0) <= asis;
	DB(1) <= dsr;
	DB(2) <= sel_rnd;
	DB(3) <= ckad;
	DB(4) <= not wrs;
	DB(5) <= csr_o(0);
	DB(6) <= csr_o(1);
	DB(7) <= ack_csr;
	
end Behavioral;