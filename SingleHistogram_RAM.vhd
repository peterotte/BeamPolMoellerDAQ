library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity SingleHistogram_RAM is
	Generic (
		DebugDetermineShiftFineDataBy : natural := 0 ); 
	Port (  ClockRAM : in  STD_LOGIC;
				ClockRAMB : in  STD_LOGIC;
				Clock : in STD_LOGIC;
				IncByOne : in  STD_LOGIC_VECTOR (2 downto 0);
				HistogramPage : in STD_LOGIC; --Two different Histograms for different source state
				HitPattern1 : in STD_LOGIC;
				HitPattern2 : in STD_LOGIC;
				CompleteTimeDataSmall1 : in  STD_LOGIC_VECTOR (7 downto 0);
				CompleteTimeDataSmall2 : in  STD_LOGIC_VECTOR (7 downto 0);
				ClearEntireRAM : in  STD_LOGIC;
				DataInB : in  STD_LOGIC_VECTOR (31 downto 0);
				AddrB : in  STD_LOGIC_VECTOR (8 downto 0);
				AddrBForClear : IN STD_LOGIC_VECTOR (8 downto 0);
				DataOutB : out  STD_LOGIC_VECTOR (31 downto 0));
end SingleHistogram_RAM;

architecture Behavioral of SingleHistogram_RAM is
	component Histogram_RAM
		port (
		clka: IN std_logic;
		wea: IN std_logic_VECTOR(0 downto 0);
		addra: IN std_logic_VECTOR(8 downto 0);
		dina: IN std_logic_VECTOR(31 downto 0);
		douta: OUT std_logic_VECTOR(31 downto 0);
		clkb: IN std_logic;
		web: IN std_logic_VECTOR(0 downto 0);
		addrb: IN std_logic_VECTOR(8 downto 0);
		dinb: IN std_logic_VECTOR(31 downto 0);
		doutb: OUT std_logic_VECTOR(31 downto 0));
	end component;

	-- Synplicity black box declaration
	attribute syn_black_box : boolean;
	attribute syn_black_box of Histogram_RAM: component is true;

	signal Temp_HistogramValueForInc : std_logic_vector(31 downto 0);
	signal Temp_WriteEnabledA, Temp_WriteEnabledB : std_logic_vector(0 downto 0);
	
	signal HistogramRAM_DInA : std_logic_vector(31 downto 0);
	signal HistogramRAM_DOutA : std_logic_vector(31 downto 0);
	signal HistogramRAM_AddrA : std_logic_vector(8 downto 0);
	
	signal TDCDifference21 : std_logic_vector(7 downto 0);
	signal InterHitPattern : std_logic_vector(1 downto 0);
	
	signal Inter_DataInB : STD_LOGIC_VECTOR (31 downto 0);
	signal Inter_AddrB : std_logic_vector(8 downto 0);
	
begin
	DebugCondiditionNormal: if DebugDetermineShiftFineDataBy = 0 generate
		-- This division operation takes ~10ns time, or a bit more
		-- be sure, not reading an indetermined state
		TDCDifference21 <= CompleteTimeDataSmall2(7 downto 0) - CompleteTimeDataSmall1(7 downto 0);
		InterHitPattern <= HitPattern2 & HitPattern1;
	end generate;
	DebugCondiditionDetermine1: if DebugDetermineShiftFineDataBy = 1 generate
		TDCDifference21 <= CompleteTimeDataSmall1;
		InterHitPattern <= HitPattern1 & HitPattern1;
	end generate;
	DebugCondiditionDetermine2: if DebugDetermineShiftFineDataBy = 2 generate
		TDCDifference21 <= CompleteTimeDataSmall2;
		InterHitPattern <= HitPattern2 & HitPattern2;
	end generate;
		
	-- HistogramPage respects the actual setting of the MAMI electron source
	HistogramRAM_AddrA <= HistogramPage&TDCDifference21;
	
	Inter_DataInB <= DataInB when ClearEntireRAM = '0' else (31 downto 0=>'0');
	Inter_AddrB <= AddrB when ClearEntireRAM = '0' else AddrBForClear;
	Temp_WriteEnabledA(0) <= IncByOne(2) when ClearEntireRAM = '0' else '0';
	Temp_WriteEnabledB(0) <= ClearEntireRAM;

	Inst_Histogram_RAM : Histogram_RAM
		port map (
			clka => ClockRAM,
			wea => Temp_WriteEnabledA,
			addra => HistogramRAM_AddrA,
			dina => HistogramRAM_DInA,
			douta => HistogramRAM_DOutA,
			clkb => ClockRAMB,
			web => Temp_WriteEnabledB,
			addrb => Inter_AddrB,
			dinb => Inter_DataInB,
			doutb => DataOutB);
		
	
	process(Clock)
	begin
		if rising_edge(Clock) then
			if (IncByOne(0) = '1') then
				Temp_HistogramValueForInc <= HistogramRAM_DOutA;
			elsif (IncByOne(1) = '1') and (InterHitPattern = "11") then
				Temp_HistogramValueForInc <= Temp_HistogramValueForInc + 1;
			else
				Temp_HistogramValueForInc <= Temp_HistogramValueForInc ;
			end if;
		end if;
	end process;
	
	HistogramRAM_DInA <= Temp_HistogramValueForInc when (IncByOne(2) = '1') else (others => '0');

end Behavioral;