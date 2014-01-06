library IEEE;
use IEEE.STD_LOGIC_1164.ALL;																						
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all; --  for bufg

entity trigger is
	port (
		clock50 : in STD_LOGIC;
		clock100 : in STD_LOGIC;
		clock200 : in STD_LOGIC;
		clock400 : in STD_LOGIC; 
		trig_in : in STD_LOGIC_VECTOR (191 downto 0);		
		trig_out : out STD_LOGIC_VECTOR (63 downto 0);			
		nim_in   : in  STD_LOGIC;
		nim_out  : out STD_LOGIC;
		led	     : out STD_LOGIC_VECTOR(8 downto 1); -- 8 LEDs onboard
		pgxled   : out STD_LOGIC_VECTOR(8 downto 1); -- 8 LEDs on PIG board
		Global_Reset_After_Power_Up : in std_logic;
		VN2andVN1 : in std_logic_vector(7 downto 0);
		DAQ_LiveTime_Gate : out std_logic;
		DAQ_Enabled_Out : out std_logic;
		AdditionalCountersOut : out std_logic_vector(11 downto 0); --0..3 for e- Flux Mesaurement
		-- VME interface ------------------------------------------------------
		u_ad_reg :in std_logic_vector(11 downto 2);
		u_dat_in :in std_logic_vector(31 downto 0);
		u_data_o :out std_logic_vector(31 downto 0);
		oecsr, ckcsr:in std_logic
	);
end trigger;


architecture RTL of trigger is
	constant FirmwareType: integer := 3;
	constant FirmwareRevision: integer := 46;
	signal TRIG_FIXED : std_logic_vector(31 downto 0); 

	subtype sub_Address is std_logic_vector(11 downto 4);
	constant BASE_TRIG_DAQ_Status : sub_Address   							:= x"02"; -- r
	constant BASE_TRIG_DAQ_Reset : sub_Address   							:= x"03"; -- r/w
	constant BASE_TRIG_DAQ_Enabled : sub_Address   							:= x"04"; -- r
	
	constant BASE_TRIG_DAQGateAllCards : sub_Address    					:= x"20"; -- r/w
	constant BASE_TRIG_NIMOUT_Mode : sub_Address    						:= x"21"; -- r/w Set to 0=normal, 1=SelectedTaggerCh AllOR
	
	constant BASE_TRIG_HistogramRAM_AddrB : sub_Address    				:= x"c1"; -- r/w
	constant BASE_TRIG_HistogramRAM_DInB : sub_Address    				:= x"c2"; -- r/w
	constant BASE_TRIG_HistogramRAM_DOutB0 : sub_Address    				:= x"80"; -- r --only top 2 bits are used
	constant BASE_TRIG_HistogramRAM_DOutB_Base : sub_Address      		:= x"81"; -- r --only top 2 bits are used

	constant BASE_TRIG_ChSelectorPart0 : sub_Address      				:= x"10"; -- r/w
	constant BASE_TRIG_ChSelectorPart1 : sub_Address      				:= x"11"; -- r/w
	constant BASE_TRIG_ChSelectorPart2 : sub_Address      				:= x"12"; -- r/w
	constant BASE_TRIG_ChSelectorPart3 : sub_Address      				:= x"13"; -- r/w
	constant BASE_TRIG_ChSelectorPart4 : sub_Address      				:= x"14"; -- r/w
	constant BASE_TRIG_ChSelectorPart5 : sub_Address      				:= x"15"; -- r/w
	constant BASE_TRIG_ChSelectorPart6 : sub_Address      				:= x"16"; -- r/w
	constant BASE_TRIG_ChSelectorPart7 : sub_Address      				:= x"17"; -- r/w

	--debug
	constant BASE_TRIG_Debug_ActualState : sub_Address							:= x"e0"; --r
	constant BASE_TRIG_SelectedDebugInput_1 : sub_Address						:= x"e1"; --r/w
	constant BASE_TRIG_SelectedDebugInput_2 : sub_Address						:= x"e2"; --r/w
	constant BASE_TRIG_SelectedDebugInput_3 : sub_Address						:= x"e3"; --r/w
	constant BASE_TRIG_SelectedDebugInput_4 : sub_Address						:= x"e4"; --r/w
	
	signal ChSelectorMask : std_logic_vector(32*8-1 downto 0) := (others => '0');

	signal DAQGateAllCards : std_logic := '0';
	signal NIMOUT_Mode : std_logic := '0';
	signal DAQ_Enabled : std_logic;
	signal DAQ_Reset, DAQ_Reset_6MuSec : std_logic := '0';
	signal Clock400GateEnable : std_logic;

	signal IncByOne : std_logic_vector(2 downto 0);
	signal HistogramRAM_AddrB : std_logic_VECTOR(8 downto 0);
	signal HistogramRAM_DInB : std_logic_VECTOR(31 downto 0);
	
	constant BASE_TRIG_FIXED : sub_Address 										:= x"f0" ; -- r



	constant NumberOfTDCs : integer := 10+14;
		  -- Also Set TDCAdjustmentCount in AdvSingleTDC.vhd
   constant NumberOfLeftChannels : integer := 10;
	constant NumberOfPairsPerLeftCh : integer := 5;
	constant NumberOfHistograms : integer := NumberOfLeftChannels*NumberOfPairsPerLeftCh+1;
	type TMoellerPairsTDCCh is array(0 to NumberOfLeftChannels-1, 0 to 1) of integer;
	constant MoellerPairsTDCCh : TMoellerPairsTDCCh := ( --TDCTrig_in numbers required, no Tagger Ch numbering
			(0,19), 
			(1,18), 
			(2,17), 
			(3,16), 
			(4,15), 
			(5,14), 
			(6,13), 
			(7,12), 
			(8,11), 
			(9,10)
		);
	signal InputChannelDebugLeftGroup  : std_logic_vector(NumberOfLeftChannels-1 downto 0); --The find the matching Moeller Pairs in Debug Mode
	signal InputChannelDebugRightGroup : std_logic_vector(NumberOfTDCs-NumberOfLeftChannels-1 downto 0); --The find the matching Moeller Pairs in Debug Mode

	type TypeRAMDataOut is array (NumberOfHistograms-1 downto 0) of std_logic_vector(31 downto 0);
	signal HistogramRAM_DOutB : TypeRAMDataOut;
	
	
	COMPONENT SingleHistogram_RAM
	Generic (
		DebugDetermineShiftFineDataBy : natural := 0 ); 
	PORT(
		ClockRAM : in  STD_LOGIC;
		ClockRAMB : in  STD_LOGIC;
		Clock : in STD_LOGIC;
      IncByOne : IN std_logic_vector(2 downto 0);
		HistogramPage : in STD_LOGIC; --Two different Histograms for different source state
		HitPattern1 : in STD_LOGIC;
		HitPattern2 : in STD_LOGIC;
		CompleteTimeDataSmall1 : in  STD_LOGIC_VECTOR (7 downto 0);
		CompleteTimeDataSmall2 : in  STD_LOGIC_VECTOR (7 downto 0);
		ClearEntireRAM : IN std_logic;
		DataInB : IN std_logic_vector(31 downto 0);
		AddrB : IN std_logic_vector(8 downto 0);       
		AddrBForClear : IN STD_LOGIC_VECTOR (8 downto 0);
		DataOutB : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	component InputStretcher is
	Generic (
		Duration : integer := 1		);
		PORT (
			Clock : in STD_LOGIC;
			Input : in STD_LOGIC;
			Output : out STD_LOGIC
		);
	end component;
	
	COMPONENT MoellerTrigger
	PORT(
		TChannelIn  : in STD_LOGIC_VECTOR(23 downto 0);
		TriggerOut : OUT STD_LOGIC;
		InhibitOutput : in STD_LOGIC; -- used e.g. when MAMI Source state is undetermined
		CLOCK : IN STD_LOGIC
		);
	END COMPONENT;
	signal MoellerTriggerSignal : std_logic;
	signal LastMoeller_1, LastMoeller_0 : std_logic;
   -------------------------------------------------------------------------
	


   -------------------------------------------------------------------------
	-- Component need to clear the complete RAM
   -------------------------------------------------------------------------
	COMPONENT Input_Enlarger
	Generic (
		Width : integer := 600 -- should be greater then 2**9 * 10ns
		);
	PORT(
		clock : IN std_logic;
		input_signal : IN std_logic;          
		output_signal : OUT std_logic
		);
	END COMPONENT;
	
	signal AddrBForClear : STD_LOGIC_VECTOR (8 downto 0);
   -------------------------------------------------------------------------





	------------------------------------------------------------------------------

	--------------------------------------------
   COMPONENT Clock400Gate
   PORT( ClockOUT	:	OUT	STD_LOGIC; 
          ClockIN	:	IN	STD_LOGIC; 
          Enable	:	IN	STD_LOGIC);
   END COMPONENT;

	COMPONENT AdvSingleTDC is
		-- Needs calibration:
		Generic (
			ShiftFineDataBy : integer := 42; -- Eleminate Offset 
			WhereToPlace : string;
			WhereToPlaceTDCHitControl : string;
			DebugDetermineShiftFineDataBy : natural := 0;
			TDCAdjustmentSelection : natural := 0;
			InterSelectSingleFineData : STD_LOGIC_VECTOR(31 downto 0) := x"ffffffff"  ); 
		Port ( 
			CountersClear : in  STD_LOGIC;
			HitSave : in  STD_LOGIC;
			TDCGate : in  STD_LOGIC;
			Clock400 : in  STD_LOGIC;
			HitClear : in  STD_LOGIC;
			HitPresent : out  STD_LOGIC;
			HitBeforeBuffer : out  STD_LOGIC;
			TimeDataSmall : out  STD_LOGIC_VECTOR (7 downto 0);
			DebugBigData : out  STD_LOGIC_VECTOR (15 downto 0);
			DebugBigDataLater : out  STD_LOGIC_VECTOR (15 downto 0);
			DebugFineData : out  STD_LOGIC_VECTOR (31 downto 0));
	end COMPONENT;
	

	--------------------------------------------
	constant AllTDCWorkModi : integer := 0; --normal: 0
	constant AllRAMWorkModi : integer := 0; --except for RAM_0, which is always in Mode=1 --normal: 0
			
	-- Configuration of all TDCs
	type TypeCellPosition is array(0 to NumberOfTDCs-1) of string(1 to 7);
	constant PlaceOfTDCHitControl : TypeCellPosition := 
		("X01Y014","X01Y015","X70Y014","X70Y015",
		 "X01Y046","X01Y047","X70Y046","X70Y047",
		 "X01Y078","X01Y079","X70Y078","X70Y079",
		 "X01Y110","X01Y111","X70Y110","X70Y111",
		 "X01Y174","X01Y175","X70Y174","X70Y175",
		 "X01Y238","X01Y239","X70Y238","X70Y239");
	constant PlaceOfTDCStartCell : TypeCellPosition := 
		("X04Y000","X20Y000","X50Y000","X60Y000",
		 "X04Y032","X20Y032","X50Y032","X60Y032",
		 "X04Y064","X20Y064","X50Y064","X60Y064",
		 "X04Y096","X20Y096","X50Y096","X60Y096",
		 "X04Y160","X20Y160","X50Y160","X60Y160",
		 "X04Y224","X20Y224","X50Y224","X60Y224");
	type TypeInterSelectSingleFineData is array(0 to NumberOfTDCs-1) of STD_LOGIC_VECTOR(31 downto 0);
	constant ArrayInterSelectSingleFineData : TypeInterSelectSingleFineData :=
		(x"FFEAAAAB",x"FFAEAAEB",x"FFEAAAAF",x"FFEAEEBF",
		 x"FFABAABB",x"FFAAAAAB",x"FFEAAAAB",x"FFEAAAAB",
		 x"FFEAAEAB",x"FFEAAEAB",x"FFEAAAAB",x"FFEEAAAB",
		 x"FFEAAEAB",x"FFEAAEAB",x"FFEAAAAB",x"FFEEAAAB", -- those 4 not measured
		 x"FFEAAEAB",x"FFEAAEAB",x"FFEAAAAB",x"FFEEAAAB", -- those 4 not measured
		 x"FFEAAEAB",x"FFEAAEAB",x"FFEAAAAB",x"FFEEAAAB"); -- those 4 not measured
	type TypeShiftFineDataBy is array(0 to NumberOfTDCs-1) of integer;
	constant ArrayShiftFineDataBy : TypeShiftFineDataBy := 
		(50,50,50,50,
		 50,50,50,50,
		 50,50,50,50,
		 50,50,50,50, -- those 4 not measured
		 50,50,50,50, -- those 4 not measured
		 50,50,50,50); -- those 4 not measured
	signal TDCTrig_in : std_logic_vector(NumberOfTDCs-1 downto 0);
	
	type TypeCompleteTimeDataSmall is array (NumberOfTDCs-1 downto 0) of std_logic_vector(7 downto 0);
	signal CompleteTimeDataSmall : TypeCompleteTimeDataSmall;

	signal TDCCountersClear : std_logic;
	
	signal TDC_HitPresent, TDC_HitBeforeBuffer : std_logic_vector(31 downto 0);
	signal TDC_HitClear_InputClockBuffer : std_logic; -- Going into the Global Clock Buffer
	--------------------------------------------


	signal Reset_After_Readout : std_logic;
	
	--FSM Measure
	subtype FSMTypeDAQState is std_logic_vector(3 downto 0);
	constant RecoveryState : FSMTypeDAQState 		:= "0000";
	constant FullReset0 : FSMTypeDAQState 			:= "0001";
	constant FullReset1 : FSMTypeDAQState 			:= "0011";
	constant FullReset2 : FSMTypeDAQState 			:= "0010";
	constant FullReset3 : FSMTypeDAQState 			:= "0110";
	constant WaitForAnyHit : FSMTypeDAQState 		:= "0111";
	constant WaitAfterAnyHit1 : FSMTypeDAQState 	:= "0101";
	constant ResetAndSave : FSMTypeDAQState 		:= "0100";
	constant FillHistogram0 : FSMTypeDAQState 	:= "1100";
	constant FillHistogram1 : FSMTypeDAQState 	:= "1101";
	constant FillHistogram2 : FSMTypeDAQState 	:= "1111";
	constant FillHistogram3 : FSMTypeDAQState 	:= "1110";
	
	--Always use gray code for FSM!! http://en.wikipedia.org/wiki/Gray_code
	signal DAQ_State, DAQ_NextState : FSMTypeDAQState;
	attribute safe_recovery_state: string;
	attribute safe_recovery_state of DAQ_State:signal is "0000";
	attribute safe_implementation: string;
	attribute safe_implementation of DAQ_State: signal is "yes";
	attribute fsm_encoding: string;
	attribute fsm_encoding of DAQ_State: signal is "user"; -- "{auto | one-hot | compact | sequential | gray | johnson | speed1 | user}";
	
	signal GatedGlock400, GlobalTDCHitClear : std_logic;
	
	--FSM RAM
	subtype FSMTypeDAQRAMState is std_logic_vector(2 downto 0);
	constant FSMRAMResetAndSave : FSMTypeDAQRAMState 		:= "000";
	constant FSMRAMCalculate : FSMTypeDAQRAMState 			:= "001";
	constant FSMRAMRead : FSMTypeDAQRAMState 					:= "011";
	constant FSMRAMInc : FSMTypeDAQRAMState 					:= "010";
	constant FSMRAMWrite : FSMTypeDAQRAMState 				:= "110";
	constant FSMRAMWait : FSMTypeDAQRAMState 					:= "111";
	constant FSMRAMRecovery : FSMTypeDAQRAMState 			:= "101";

	signal DAQRAM_State, DAQRAM_NextState : FSMTypeDAQRAMState;
	attribute safe_recovery_state of DAQRAM_State: signal is "101";
	attribute safe_implementation of DAQRAM_State: signal is "yes";
	attribute fsm_encoding of DAQRAM_State: signal is "user";

	signal GlobalInputGate : std_logic;
	signal TempDifference : std_logic_vector(7 downto 0);
	
	signal TaggerOR : std_logic;
	
	---------------------------------------------------------------------------------
	-- Signals to/from MAMI to control the electron source
	---------------------------------------------------------------------------------
	signal MAMIElectronSourceSetting : std_logic_vector(1 downto 0);
	signal MAMIElectronSourceSettingLastStatus : std_logic;
	---------------------------------------------------------------------------------

	---------------------------------------------------------------------------------
	-- Signals for MAMI e- flux counting
	---------------------------------------------------------------------------------
	component Prescaler is
		 Generic (
				Factor : integer );
		 Port ( clock : in  STD_LOGIC;
				  Input : in  STD_LOGIC;
				Output : out  STD_LOGIC);
	end component;
	signal Tagger16ORs : std_logic_vector(5 downto 0); --6 Big ORS for inputs IN1, IN2, INOUT1
	signal FluxCounterEnable : std_logic;
	---------------------------------------------------------------------------------

	---------------------------------------------------------------------------------
	-- For all components
	constant NDebugSignalOutputs : integer := 4;
	signal SelectedDebugInput : std_logic_vector(8*NDebugSignalOutputs-1 downto 0);
	signal Debug_ActualState : std_logic_vector(NDebugSignalOutputs-1 downto 0);
	signal DebugSignals : std_LOGIC_VECTOR(255 downto 0);

	COMPONENT DebugChSelector
	PORT(
		DebugSignalsIn : IN std_logic_vector(255 downto 0);
		SelectedInput : IN std_logic_vector(7 downto 0);          
		SelectedOutput : OUT std_logic
		);
	END COMPONENT;
	---------------------------------------------------------------------------------

	---------------------------------------------------------------------------------
	-- Tagger Ch Selector Signals
	signal PairSpecModule1, PairSpecModule2, PairSpecModule3, PairSpecModule4 : std_logic_vector(15 downto 0);
	signal PairSpecModulesCombined : std_logic_vector(7 downto 0);
	signal SelectedTaggerCh : std_logic_vector(31 downto 0);
	---------------------------------------------------------------------------------

	Signal SelectedTaggerCh_ALLOR : std_logic;
begin
	TRIG_FIXED(31 downto 24) <= CONV_STD_LOGIC_VECTOR(FirmwareType, 8);
	TRIG_FIXED(23 downto 16) <= CONV_STD_LOGIC_VECTOR(0, 8);
	TRIG_FIXED(15 downto 0)  <= CONV_STD_LOGIC_VECTOR(FirmwareRevision, 16);

	-------------------------------------------------------------------------------------------------
	-- Debug Selector
	DebugSignals(191 downto 0) <= trig_in;
	DebugSignals(192) <= DAQ_Reset;
	DebugSignals(193) <= DAQ_Reset_6MuSec;
	DebugSignals(255) <= NIM_IN;
	
	DebugChSelectors: for i in 0 to NDebugSignalOutputs-1 generate
	begin
		Inst_DebugChSelector: DebugChSelector PORT MAP(
			DebugSignalsIn => DebugSignals,
			SelectedInput => SelectedDebugInput((i+1)*8-1 downto i*8),
			SelectedOutput => Debug_ActualState(i)
		);
	end generate;
	-------------------------------------------------------------------------------------------------

	SelectedTaggerChs: for i in 0 to 7 generate
	begin
		PairSpecModulesCombined <= PairSpecModule4(8)&PairSpecModule4(0)&PairSpecModule3(8)&PairSpecModule3(0)&PairSpecModule2(8)&PairSpecModule2(0)&PairSpecModule1(8)&PairSpecModule1(0);
		SelectedTaggerCh(0+i)  <= '1' when (ChSelectorMask(7+(i+0 )*8 downto 0+(i+0 )*8) and PairSpecModulesCombined) /= "0" else '0';
		SelectedTaggerCh(8+i)  <= '1' when (ChSelectorMask(7+(i+8 )*8 downto 0+(i+8 )*8) and PairSpecModulesCombined) /= "0" else '0';
		SelectedTaggerCh(16+i) <= '1' when (ChSelectorMask(7+(i+16)*8 downto 0+(i+16)*8) and PairSpecModulesCombined) /= "0" else '0';
		SelectedTaggerCh(24+i) <= '1' when (ChSelectorMask(7+(i+24)*8 downto 0+(i+24)*8) and PairSpecModulesCombined) /= "0" else '0';
	end generate;
	SelectedTaggerCh_ALLOR <= '1' when SelectedTaggerCh /= "0" else '0';
	DebugSignals(254)<= SelectedTaggerCh_ALLOR;
	
	--signals to exp trigger via out1
	trig_out(27 downto 0) <= SelectedTaggerCh(27 downto 0);
	trig_out(28+NDebugSignalOutputs-1 downto 28) <= Debug_ActualState;
	
	--signals for external detector tests
	trig_out(31+32 downto 32) <= SelectedTaggerCh;

	------------------------------------------------------------------------------------------------
	-- show the actual status of the machine using leds
	led(8 downto 1) <= not x"00";
	pgxled(8 downto 1) <= not x"00";
	------------------------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	-- Signals to/from MAMI to control the electron source
	---------------------------------------------------------------------------------
	-- Pin 0 = output from generator (+)
	-- Pin 1 = inhibit, if set, status of source is indetermined
	MAMIElectronSourceSetting <= trig_in(1+32*5 downto 0+32*5); 

	SaveLastMAMiSourceStatus: process(GlobalTDCHitClear)
	begin
		if (GlobalTDCHitClear'event) and (GlobalTDCHitClear = '1') then
			MAMIElectronSourceSettingLastStatus <= MAMIElectronSourceSetting(0);
		end if;
	end process;
	
	---------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------------
	-- Moeller Trigger
	------------------------------------------------------------------------------------------------
	Inst_MoellerTrigger: MoellerTrigger PORT MAP(
		TChannelIn => TDCTrig_in,  -- channels from tagger
		TriggerOut => MoellerTriggerSignal, -- Evtl. Moeller Trigger Signal auch verlängern
		InhibitOutput => MAMIElectronSourceSetting(1), --or '0', If MAMI source is undetermined, do not produce Triggers
		CLOCK => clock100
	);
	
	GlobalInputGate <= not MAMIElectronSourceSetting(1);
	------------------------------------------------------------------------------------------------
	
	
   Inst_ClockGate: Clock400Gate PORT MAP(
		ClockOUT => GatedGlock400, 
		ClockIN => clock400, 
		Enable => Clock400GateEnable
   );
	
	BUFG_inst : BUFG
		port map (
			O => GlobalTDCHitClear, -- 1-bit Clock buffer output
			I => TDC_HitClear_InputClockBuffer  -- 1-bit Clock buffer input
		);
		
		
	------------------------------------------------------------------------------------------
	-- Select Left and Right Channels for Debug
	------------------------------------------------------------------------------------------
	InputChannelDebugLeftGroup <= trig_in(0+NumberOfLeftChannels-1 downto 0);
	InputChannelDebugRightGroup <= trig_in(0+NumberOfTDCs-1 downto NumberOfLeftChannels);
		-- if NIMOUT_mode = '0' then normal DAQ_Enable signal
		-- if NIMOUT_mode = '1' then SelectedTaggerCh_ALLOR
	NIM_OUT <= DAQGateAllCards when NIMOUT_Mode='0' else SelectedTaggerCh_ALLOR; --send to NIM OUT and then to all other VUPROMs via NIM IN

	DAQ_Enabled <= NIM_IN;
	DAQ_Enabled_out <= DAQ_Enabled;
	------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------
	-- TDCs
	------------------------------------------------------------------------------------------
   -- The first (0,1,...) NumberOfLeftChannels TDC have to be "left" ones. Then come the right ones.
	TDCTrig_in <= InputChannelDebugRightGroup & InputChannelDebugLeftGroup;

	---------------------------------------------------------------------------------
	-- Signals for MAMI e- flux counting
	---------------------------------------------------------------------------------
	FluxCounterEnable <= '1' when (DAQ_Enabled = '1') and (MAMIElectronSourceSetting(1) = '0') else '0';
	
	HelicityFluxCounterSignals: for i in 0 to 5 generate -- loop trough all TaggerORs
		begin
			Tagger16ORs(i) <= trig_in(24+i) when (FluxCounterEnable = '1') else '0';

			AdditionalCountersOut(i) <= '1'   when (Tagger16ORs(i) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0'; --Helicity 0
			AdditionalCountersOut(i+6) <= '1' when (Tagger16ORs(i) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0'; --Helicity 1
	end generate;	
	---------------------------------------------------------------------------------

	---------------------------------------------------------------------------------
	-- DAQ Livetime Gate
	---------------------------------------------------------------------------------
	DAQ_LiveTime_Gate <= '1' when ((DAQ_State = WaitForAnyHit) or (DAQ_State = WaitAfterAnyHit1)) and (DAQ_Enabled = '1') else '0';
	---------------------------------------------------------------------------------

	
	
	CGenerateTDCs: for i in 0 to NumberOfTDCs-1 generate -- loop trough all TDC channels
		begin
		Inst_AdvSingleTDC: AdvSingleTDC 
			GENERIC MAP (ShiftFineDataBy => ArrayShiftFineDataBy(i), WhereToPlace => PlaceOfTDCStartCell(i),
				WhereToPlaceTDCHitControl => PlaceOfTDCHitControl(i), DebugDetermineShiftFineDataBy => AllTDCWorkModi,
				TDCAdjustmentSelection => i, InterSelectSingleFineData => ArrayInterSelectSingleFineData(i))
			PORT MAP(
			CountersClear => TDCCountersClear,
			HitSave => TDCTrig_in(i),
			TDCGate => GlobalInputGate, -- could be improved be using a global clock
			Clock400 => GatedGlock400,
			HitClear => GlobalTDCHitClear, --trig_in(4),
			HitPresent => TDC_HitPresent(i),
			HitBeforeBuffer => TDC_HitBeforeBuffer(i),
			TimeDataSmall => CompleteTimeDataSmall(i),
			DebugBigData => open, --TDC1_DebugBigData,
			DebugBigDataLater => open, --TDC1_DebugBigDataLater,
			DebugFineData => open --TDC1_DebugFineData
		);
	end generate;	
	TDC_HitPresent(31 downto NumberOfTDCs) <= (others => '0');
	TDC_HitBeforeBuffer(31 downto NumberOfTDCs) <= (others => '0');

	------------------------------------------------------------------------------------------
	-- Histograms
	------------------------------------------------------------------------------------------
	Inst_Input_Enlarger: Input_Enlarger GENERIC MAP(
		Width => 600
	) PORT MAP(
		clock => clock100, --same clock as ClockRAMB
		input_signal => DAQ_Reset,
		output_signal => DAQ_Reset_6MuSec
	);
	
	process (clock100) --same clock as ClockRAMB
	begin
		if rising_edge(clock100) then
			AddrBForClear <= AddrBForClear + 1;
		end if;
	end process;


	-- The following instance is used for debug or calibration cases
	Inst_SingleHistogram_RAM_0: SingleHistogram_RAM 
		GENERIC MAP (DebugDetermineShiftFineDataBy => 1)
		PORT MAP(
		ClockRAM => clock200,
		ClockRAMB => clock100,
		Clock => clock100,
		IncByOne => IncByOne,
		HistogramPage => MAMIElectronSourceSettingLastStatus,
		HitPattern1 => TDC_HitPresent(0),
		HitPattern2 => TDC_HitPresent(1),
		CompleteTimeDataSmall1 => CompleteTimeDataSmall(0),
		CompleteTimeDataSmall2 => CompleteTimeDataSmall(1),
		ClearEntireRAM => DAQ_Reset_6MuSec,
		DataInB => HistogramRAM_DInB,
		AddrB => HistogramRAM_AddrB,
		AddrBForClear => AddrBForClear,
		DataOutB => HistogramRAM_DOutB(0)
	);
	
	-- These are the histograms used for the physical measurement
	Ccomb: for k in 0 to NumberOfLeftChannels-1 generate -- loop through left channels
		begin
		Ccomb2: for i in 0 to NumberOfPairsPerLeftCh-1 generate -- loop trough right channels
			begin
			Inst_SingleHistogram_RAM_2: SingleHistogram_RAM 
				GENERIC MAP (DebugDetermineShiftFineDataBy => AllRAMWorkModi)
				PORT MAP(
				ClockRAM => clock200,
				ClockRAMB => clock100,
				Clock => clock100,
				IncByOne => IncByOne,
				HistogramPage => MAMIElectronSourceSettingLastStatus,
				HitPattern1 => TDC_HitPresent(MoellerPairsTDCCh(k,0)),
				HitPattern2 => TDC_HitPresent(MoellerPairsTDCCh(k,1)+i),
				CompleteTimeDataSmall1 => CompleteTimeDataSmall(MoellerPairsTDCCh(k,0)),
				CompleteTimeDataSmall2 => CompleteTimeDataSmall(MoellerPairsTDCCh(k,1)+i),
				ClearEntireRAM => DAQ_Reset_6MuSec,
				DataInB => HistogramRAM_DInB,
				AddrB => HistogramRAM_AddrB,
				AddrBForClear => AddrBForClear,
				DataOutB => HistogramRAM_DOutB( k*NumberOfPairsPerLeftCh+i+1)
			);
		end generate;
	end generate;

	------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------
	-- FSM DAQ
	------------------------------------------------------------------------------------------
	DAQFSM_State: process (clock50)
	begin
		if rising_edge(clock50) then
			if (DAQ_Reset_6MuSec = '1') then
				DAQ_State <= FullReset0;
			else
				DAQ_State <= DAQ_NextState;
			end if;
		end if;
	end process;
	
	DAQFSM_Outputs: process (DAQ_State)
	begin
		TDC_HitClear_InputClockBuffer <= '0';
		TDCCountersClear <= '0';
		Clock400GateEnable <= '0';
		if (DAQ_State = RecoveryState) then
			null;
		elsif (DAQ_State = FullReset0) then 
			TDCCountersClear <= '1';
			TDC_HitClear_InputClockBuffer <= '1';
		elsif (DAQ_State = FullReset1) then
			TDCCountersClear <= '1';
		elsif (DAQ_State = FullReset2) then
			null;
		elsif (DAQ_State = FullReset3) then
			Clock400GateEnable <= '1';
		elsif (DAQ_State = WaitForAnyHit) then
			Clock400GateEnable <= '1';
		elsif (DAQ_State = WaitAfterAnyHit1) then
			Clock400GateEnable <= '1';
		elsif (DAQ_State = ResetAndSave) then
			Clock400GateEnable <= '1';
			TDC_HitClear_InputClockBuffer <= '1';
		elsif (DAQ_State = FillHistogram0) then
			Clock400GateEnable <= '1';
		elsif (DAQ_State = FillHistogram1) then
			Clock400GateEnable <= '1';
		elsif (DAQ_State = FillHistogram2) then
			Clock400GateEnable <= '1';
		elsif (DAQ_State = FillHistogram3) then
			Clock400GateEnable <= '1';
		else
			null;
		end if;
	end process;
	
	DAQFSM_Next: process (DAQ_State, DAQ_Enabled, TDC_HitPresent)
	begin
		if (DAQ_State = RecoveryState) then
			DAQ_NextState <= FullReset0;
		elsif (DAQ_State = FullReset0) and (DAQ_Enabled = '1') then 
			DAQ_NextState <= FullReset1;
		elsif (DAQ_State = FullReset0) then
			DAQ_NextState <= FullReset0;
		elsif (DAQ_State = FullReset1) then
			DAQ_NextState <= FullReset2;
		elsif (DAQ_State = FullReset2) then
			DAQ_NextState <= FullReset3;
		elsif (DAQ_State = FullReset3) then
			DAQ_NextState <= WaitForAnyHit;
		elsif (DAQ_State = WaitForAnyHit) and (TDC_HitBeforeBuffer /= "0") then
			DAQ_NextState <= WaitAfterAnyHit1;
		elsif (DAQ_State = WaitForAnyHit) then
			DAQ_NextState <= WaitForAnyHit;
		elsif (DAQ_State = WaitAfterAnyHit1) then
			DAQ_NextState <= ResetAndSave;
		elsif (DAQ_State = ResetAndSave) and (DAQ_Enabled = '1') then 
--			DAQ_NextState <= FillHistogram0;
			DAQ_NextState <= WaitForAnyHit;
		elsif (DAQ_State = ResetAndSave) then 
			DAQ_NextState <= FullReset0;
		elsif (DAQ_State = FillHistogram0) then 
			DAQ_NextState <= FillHistogram1;
		elsif (DAQ_State = FillHistogram1) then
			DAQ_NextState <= FillHistogram2;
		elsif (DAQ_State = FillHistogram2) then
			DAQ_NextState <= FillHistogram3;
		elsif (DAQ_State = FillHistogram3) then
			DAQ_NextState <= WaitForAnyHit;
--			DAQ_NextState <= FillHistogram3; -- to make it stop here
		else
			DAQ_NextState <= FullReset0;
		end if;
	end process;
	------------------------------------------------------------------------------------------

	
	
	------------------------------------------------------------------------------------------
	-- FSM RAM
	------------------------------------------------------------------------------------------
	DAQFSMRAM_State: process (clock100, DAQRAM_State)
	begin
		if rising_edge(clock100) then --was before 3.12. clock100
			if (DAQ_State = ResetAndSave) then
				DAQRAM_State <= FSMRAMResetAndSave;
			else
				DAQRAM_State <= DAQRAM_NextState;
			end if;
		end if;
	end process;
	
	DAQFSMRAM_Next: process (DAQRAM_State)
	begin
		if (DAQRAM_State = FSMRAMResetAndSave) then 
			DAQRAM_NextState <= FSMRAMCalculate;
		elsif (DAQRAM_State = FSMRAMCalculate) then 
			DAQRAM_NextState <= FSMRAMRead;
		elsif (DAQRAM_State = FSMRAMRead) then 
			DAQRAM_NextState <= FSMRAMInc;
		elsif (DAQRAM_State = FSMRAMInc) then 
			DAQRAM_NextState <= FSMRAMWrite;
		elsif (DAQRAM_State = FSMRAMWrite) then 
			DAQRAM_NextState <= FSMRAMWait;
		elsif (DAQRAM_State = FSMRAMWait) then 
			DAQRAM_NextState <= FSMRAMWait;
		elsif (DAQRAM_State = FSMRAMRecovery) then 
			DAQRAM_NextState <= FSMRAMWait;
		else
			DAQRAM_NextState <= FSMRAMRecovery;
		end if;
	end process;
	
	DAQFSMRAM_Outputs: process (DAQRAM_State)
	begin
		IncByOne <= "000";
		if (DAQRAM_State = FSMRAMResetAndSave) then 
			null;
		elsif (DAQRAM_State = FSMRAMCalculate) then 
			null;
		elsif (DAQRAM_State = FSMRAMRead) then 
			IncByOne(0) <= '1';
		elsif (DAQRAM_State = FSMRAMInc) then 
			IncByOne(1) <= '1';
		elsif (DAQRAM_State = FSMRAMWrite) then 
			IncByOne(2) <= '1';
		elsif (DAQRAM_State = FSMRAMWait) then 
			null;
		elsif (DAQRAM_State = FSMRAMRecovery) then 
			null;
		else
			null;
		end if;
	end process;
	
	
	------------------------------------------------------------------------------------------
	
	
	---------------------------------------------------------------------------------------------------------	
	-- Code for VME handling / access
	-- decoder for data registers
	-- handle write commands from vmebus
	---------------------------------------------------------------------------------------------------------	
	process(clock50, ckcsr, u_ad_reg)
	begin
		if (clock50'event and clock50 ='1') then
			DAQ_Reset <= '0';
			if (u_ad_reg(11 downto 4) = BASE_TRIG_DAQ_Reset) and (ckcsr = '1') then 			DAQ_Reset <= u_dat_in(0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_AddrB) and (ckcsr = '1') then HistogramRAM_AddrB <= u_dat_in(8 downto 0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_DInB) and (ckcsr = '1') then 	HistogramRAM_DInB <= u_dat_in; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_DAQGateAllCards) and (ckcsr = '1') then 	DAQGateAllCards <= u_dat_in(0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_NIMOUT_Mode) and (ckcsr = '1') then 			NIMOUT_Mode <= u_dat_in(0); end if;
			
			--Ch Selector
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart0) ) then 			ChSelectorMask(32*0+31 downto 32*0) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart1) ) then 			ChSelectorMask(32*1+31 downto 32*1) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart2) ) then 			ChSelectorMask(32*2+31 downto 32*2) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart3) ) then 			ChSelectorMask(32*3+31 downto 32*3) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart4) ) then 			ChSelectorMask(32*4+31 downto 32*4) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart5) ) then 			ChSelectorMask(32*5+31 downto 32*5) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart6) ) then 			ChSelectorMask(32*6+31 downto 32*6) <= u_dat_in; end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_ChSelectorPart7) ) then 			ChSelectorMask(32*7+31 downto 32*7) <= u_dat_in; end if;
			
			--debug
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_SelectedDebugInput_1) ) then 	SelectedDebugInput(8*1-1 downto 8*0) <= u_dat_in(7 downto 0); end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_SelectedDebugInput_2) ) then 	SelectedDebugInput(8*2-1 downto 8*1) <= u_dat_in(7 downto 0); end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_SelectedDebugInput_3) ) then 	SelectedDebugInput(8*3-1 downto 8*2) <= u_dat_in(7 downto 0); end if;
			if ( (ckcsr = '1') and (u_ad_reg(11 downto 4) = BASE_TRIG_SelectedDebugInput_4) ) then 	SelectedDebugInput(8*4-1 downto 8*3) <= u_dat_in(7 downto 0); end if;
		end if;
	end process;
	

	---------------------------------------------------------------------------------------------------------	
	-- Code for VME handling / access
	-- handle read commands from vmebus
	---------------------------------------------------------------------------------------------------------	
	process(clock50, oecsr, u_ad_reg)
	begin
		if (clock50'event and clock50 = '1' and oecsr = '1') then
			u_data_o <= (others => '0');
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_AddrB) then 			u_data_o(8 downto 0) <= HistogramRAM_AddrB; end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_HistogramRAM_DInB) then				u_data_o <= HistogramRAM_DInB; end if;
			-- Histogram 0 readout
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_HistogramRAM_DOutB0) then			u_data_o <= HistogramRAM_DOutB(0); end if;
			-- Histogram 1..N readout
			for k in 1 to NumberOfHistograms-1 loop
				if ( u_ad_reg(11 downto 10) = BASE_TRIG_HistogramRAM_DOutB_Base(11 downto 10) ) and
					( u_ad_reg(9 downto 2) = CONV_STD_LOGIC_VECTOR(k, 8) ) then 
						u_data_o <= HistogramRAM_DOutB(k);
--						u_data_o(31 downto 8) <= (others => '0');
--						u_data_o(7 downto 0) <= CONV_STD_LOGIC_VECTOR( k*6+(i-6)+1, 8) ;
				end if;
			end loop;

			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Status) then
				u_data_o(3 downto 0) <= DAQ_State;
				u_data_o(29) <= GlobalTDCHitClear;
				u_data_o(28) <= TDC_HitClear_InputClockBuffer;
				u_data_o(28-4) <= Clock400GateEnable;
				u_data_o(28-2*4) <= TDCCountersClear; end if;
				
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Enabled) then 		u_data_o(0) <= DAQ_Enabled; end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Reset) then 			u_data_o(0) <= DAQ_Reset_6MuSec; end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_FIXED) then 				u_data_o(31 downto 0) <= TRIG_FIXED; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_DAQGateAllCards) then 	u_data_o(0) <= DAQGateAllCards; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_NIMOUT_Mode) then 			u_data_o(0) <= NIMOUT_Mode; end if;
			
			--Ch Selector
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart0) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*0+31 downto 32*0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart1) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*1+31 downto 32*1); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart2) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*2+31 downto 32*2); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart3) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*3+31 downto 32*3); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart4) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*4+31 downto 32*4); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart5) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*5+31 downto 32*5); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart6) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*6+31 downto 32*6); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_ChSelectorPart7) then 			u_data_o(31 downto 0) <= ChSelectorMask(32*7+31 downto 32*7); end if;

			--debug
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_1) then 	u_data_o(7 downto 0) <= SelectedDebugInput(8*1-1 downto 8*0); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_2) then 	u_data_o(7 downto 0) <= SelectedDebugInput(8*2-1 downto 8*1); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_3) then 	u_data_o(7 downto 0) <= SelectedDebugInput(8*3-1 downto 8*2); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_SelectedDebugInput_4) then 	u_data_o(7 downto 0) <= SelectedDebugInput(8*4-1 downto 8*3); end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_Debug_ActualState) then 		u_data_o(NDebugSignalOutputs-1 downto 0) <= Debug_ActualState; end if;

		end if;
	end process;

end RTL;