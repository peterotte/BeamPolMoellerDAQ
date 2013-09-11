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
		AdditionalCountersOut : out std_logic_vector(31 downto 0); --0..3 for e- Flux Mesaurement
		-- VME interface ------------------------------------------------------
		u_ad_reg :in std_logic_vector(11 downto 2);
		u_dat_in :in std_logic_vector(31 downto 0);
		u_data_o :out std_logic_vector(31 downto 0);
		oecsr, ckcsr:in std_logic
	);
end trigger;


architecture RTL of trigger is

	subtype sub_Adress is std_logic_vector(11 downto 4);
	constant BASE_TRIG_DAQ_Status : sub_Adress   							:= x"02"; -- r
	constant BASE_TRIG_DAQ_Reset : sub_Adress   								:= x"03"; -- r/w
	constant BASE_TRIG_DAQ_Enabled : sub_Adress   							:= x"04"; -- r/w
	constant BASE_TRIG_DAQ_Counter_Fix : sub_Adress   						:= x"05"; -- w
	constant BASE_TRIG_DAQ_Counter_LiveTime : sub_Adress   				:= x"06"; -- r
	constant BASE_TRIG_DAQ_Counter_LiveTimeGated : sub_Adress   		:= x"07"; -- r
	constant BASE_TRIG_VN2andVN1						 : sub_Adress   		:= x"08"; -- r --Setting of VN1 and VN2
	constant BASE_TRIG_MAMIEnergySetting			 : sub_Adress   		:= x"09"; -- r/w
	constant BASE_TRIG_InputChannelsDebugMode			 : sub_Adress   		:= x"0a"; -- r/w --Enable this, if you want to find the corresponding Moeller channels
	constant BASE_TRIG_InputChannelDebugLeftStart	 : sub_Adress   		:= x"0b"; -- r/w left channel (lower energy) to start with
	constant BASE_TRIG_InputChannelDebugRightStart	 : sub_Adress   		:= x"0c"; -- r/w right channel (higher energy) to start with
	
	constant BASE_TRIG_HistogramRAM_WEB : sub_Adress    						:= x"c0"; -- r/w
	constant BASE_TRIG_HistogramRAM_AddrB : sub_Adress    					:= x"c1"; -- r/w
	constant BASE_TRIG_HistogramRAM_DInB : sub_Adress    						:= x"c2"; -- r/w
	constant BASE_TRIG_HistogramRAM_DOutB0 : sub_Adress    					:= x"80"; -- r
	constant BASE_TRIG_HistogramRAM_DOutB_Base : sub_Adress      			:= x"81"; -- r

	constant BASE_TRIG_DebugTrigIn : sub_Adress    								:= x"0f"; -- r/w
	signal DebugTrigIn : std_logic_vector(31 downto 0);
	
	signal MAMIEnergySetting : std_logic_vector(2 downto 0); --To set up the Inputs depending on MAMI energy
	signal InputChannelsDebugMode : std_logic; 
	signal InputChannelDebugLeftStart, InputChannelDebugRightStart : std_logic_vector(7 downto 0);
	
	signal DAQ_Enabled : std_logic;
	signal DAQ_Reset : std_logic;
	signal Clock400GateEnable : std_logic;

	signal IncByOne : std_logic_vector(2 downto 0);
	signal HistogramRAM_WEB : std_logic;
	signal HistogramRAM_AddrB : std_logic_VECTOR(8 downto 0);
	signal HistogramRAM_DInB : std_logic_VECTOR(31 downto 0);
	
	constant BASE_TRIG_FIXED : sub_Adress 					:= x"f0" ; -- r
	constant TRIG_FIXED : std_logic_vector(31 downto 0) := x"0a100927"; --Universal File, Date: 30.11.2010



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
		WriteEnabledB : IN std_logic;
		DataInB : IN std_logic_vector(31 downto 0);
		AddrB : IN std_logic_vector(8 downto 0);          
		ClearCompleted : OUT std_logic;
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
	
	signal DAQ_Counter_LiveTime, DAQ_Counter_LiveTimeGated : std_logic_vector(39 downto 0) := x"0000000000";
	signal DAQ_Counter_LiveTime_Fix, DAQ_Counter_LiveTimeGated_Fix : std_logic_vector(31 downto 0) := x"00000000";
	signal DAQ_Counter_Fix : std_logic;
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
	signal MAMIElectronSourceSetting : std_logic_vector(3 downto 0);
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
	signal AdditionalCountersOut_Intermediate : std_logic_vector(31 downto 0); --6 16OR Counters for 2 helicities for 2 ranges
--	signal TaggerOR_SelectedCh_Heli0, TaggerOR_SelectedCh_Heli1 : std_logic;
	signal FluxCounterEnable : std_logic;
--	signal TaggerOR_SelectedCh_Heli0_Last0, TaggerOR_SelectedCh_Heli1_Last0 : std_logic;
--	signal TaggerOR_SelectedCh_Heli0_Last1, TaggerOR_SelectedCh_Heli1_Last1 : std_logic;
--	signal TaggerOR_SelectedCh_Heli0_underdriven, TaggerOR_SelectedCh_Heli1_underdriven : std_logic_vector(7 downto 0);
	---------------------------------------------------------------------------------
begin
	------------------------------------------------------------------------------------------------
	-- show the actual status of the machine using leds
	led(8 downto 1) <= not x"0f";
	pgxled(8 downto 1) <= not x"33";
	------------------------------------------------------------------------------------------------
	
	---------------------------------------------------------------------------------
	-- Signals to/from MAMI to control the electron source
	---------------------------------------------------------------------------------
	-- Pin 0 = mami response (+)
	-- Pin 1 = output from generator (+)
	-- Pin 2 = inverted output from generator (-)
	-- Pin 3 = inhibit, if set, status of source is indetermined
	MAMIElectronSourceSetting <= trig_in(3+32*5 downto 0+32*5); 
	--MAMIElectronSourceSetting <= "0100"; -- if no cable is connected at all

	SaveLastMAMiSourceStatus: process(GlobalTDCHitClear)
	begin
		if (GlobalTDCHitClear'event) and (GlobalTDCHitClear = '1') then
			MAMIElectronSourceSettingLastStatus <= MAMIElectronSourceSetting(0);
		end if;
	end process;
	
--	AdditionalCountersOut_Intermediate(4) <= clock50 when (MAMIElectronSourceSetting(0) = '0') and (MAMIElectronSourceSetting(3) = '0') else '0';
--	AdditionalCountersOut_Intermediate(5) <= clock50 when (MAMIElectronSourceSetting(0) = '1') and (MAMIElectronSourceSetting(3) = '0') else '0';
	---------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------------
	-- Moeller Trigger
	------------------------------------------------------------------------------------------------
	Inst_MoellerTrigger: MoellerTrigger PORT MAP(
		TChannelIn => TDCTrig_in,  -- channels from tagger
		TriggerOut => MoellerTriggerSignal, -- Evtl. Moeller Trigger Signal auch verlängern
		InhibitOutput => MAMIElectronSourceSetting(3), --or '0', If MAMI source is undetermined, do not produce Triggers
		CLOCK => clock100
	);
	--MoellerTriggerSignal <= '1';
	
	-- GlobalInputGate <= MoellerTriggerSignal; -- Regardles whether the electronics is ready for taking data or not
	--	GlobalInputGate <= '1';
	GlobalInputGate <= not MAMIElectronSourceSetting(3);
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
	InputChannelDebugLeftGroup <= 
		trig_in(0+NumberOfLeftChannels-1 downto 0) when InputChannelDebugLeftStart = x"00" else
		trig_in(1+NumberOfLeftChannels-1 downto 1) when InputChannelDebugLeftStart = x"01" else
		trig_in(2+NumberOfLeftChannels-1 downto 2) when InputChannelDebugLeftStart = x"02" else
		trig_in(3+NumberOfLeftChannels-1 downto 3) when InputChannelDebugLeftStart = x"03" else
		trig_in(4+NumberOfLeftChannels-1 downto 4) when InputChannelDebugLeftStart = x"04" else
		trig_in(5+NumberOfLeftChannels-1 downto 5) when InputChannelDebugLeftStart = x"05" else
		trig_in(6+NumberOfLeftChannels-1 downto 6) when InputChannelDebugLeftStart = x"06" else
		trig_in(7+NumberOfLeftChannels-1 downto 7) when InputChannelDebugLeftStart = x"07" else
		trig_in(8+NumberOfLeftChannels-1 downto 8) when InputChannelDebugLeftStart = x"08" else
		trig_in(9+NumberOfLeftChannels-1 downto 9) when InputChannelDebugLeftStart = x"09" else
		trig_in(10+NumberOfLeftChannels-1 downto 10) when InputChannelDebugLeftStart = x"0a" else
		trig_in(11+NumberOfLeftChannels-1 downto 11) when InputChannelDebugLeftStart = x"0b" else
		trig_in(12+NumberOfLeftChannels-1 downto 12) when InputChannelDebugLeftStart = x"0c" else
		trig_in(13+NumberOfLeftChannels-1 downto 13) when InputChannelDebugLeftStart = x"0d" else
		trig_in(14+NumberOfLeftChannels-1 downto 14) when InputChannelDebugLeftStart = x"0e" else
		trig_in(15+NumberOfLeftChannels-1 downto 15) when InputChannelDebugLeftStart = x"0f" else
		trig_in(16+NumberOfLeftChannels-1 downto 16) when InputChannelDebugLeftStart = x"10" else
		trig_in(17+NumberOfLeftChannels-1 downto 17) when InputChannelDebugLeftStart = x"11" else
		trig_in(18+NumberOfLeftChannels-1 downto 18) when InputChannelDebugLeftStart = x"12" else
		trig_in(19+NumberOfLeftChannels-1 downto 19) when InputChannelDebugLeftStart = x"13" else
		trig_in(20+NumberOfLeftChannels-1 downto 20) when InputChannelDebugLeftStart = x"14" else
		trig_in(21+NumberOfLeftChannels-1 downto 21) when InputChannelDebugLeftStart = x"15" else
		trig_in(22+NumberOfLeftChannels-1 downto 22) when InputChannelDebugLeftStart = x"16" else
		(others => '0');
	
	InputChannelDebugRightGroup <=
		trig_in(0+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 0+96) when InputChannelDebugRightStart = x"00" else
		trig_in(1+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 1+96) when InputChannelDebugRightStart = x"01" else
		trig_in(2+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 2+96) when InputChannelDebugRightStart = x"02" else
		trig_in(3+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 3+96) when InputChannelDebugRightStart = x"03" else
		trig_in(4+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 4+96) when InputChannelDebugRightStart = x"04" else
		trig_in(5+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 5+96) when InputChannelDebugRightStart = x"05" else
		trig_in(6+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 6+96) when InputChannelDebugRightStart = x"06" else
		trig_in(7+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 7+96) when InputChannelDebugRightStart = x"07" else
		trig_in(8+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 8+96) when InputChannelDebugRightStart = x"08" else
		trig_in(9+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 9+96) when InputChannelDebugRightStart = x"09" else
		trig_in(10+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 10+96) when InputChannelDebugRightStart = x"0a" else
		trig_in(11+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 11+96) when InputChannelDebugRightStart = x"0b" else
		trig_in(12+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 12+96) when InputChannelDebugRightStart = x"0c" else
		trig_in(13+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 13+96) when InputChannelDebugRightStart = x"0d" else
		trig_in(14+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 14+96) when InputChannelDebugRightStart = x"0e" else
		trig_in(15+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 15+96) when InputChannelDebugRightStart = x"0f" else
		trig_in(16+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 16+96) when InputChannelDebugRightStart = x"10" else
		trig_in(17+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 17+96) when InputChannelDebugRightStart = x"11" else
		trig_in(18+NumberOfTDCs-NumberOfLeftChannels-1+96 downto 18+96) when InputChannelDebugRightStart = x"12" else
		(others => '0');
	------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------
	-- TDCs
	------------------------------------------------------------------------------------------
   -- The first (0,1,...) NumberOfLeftChannels TDC have to be "left" ones.
	-- Then comes the right ones.
		--	--TDCTrig_in <= trig_in(124 downto 111)&trig_in(9 downto 0); --For Module 0x04, for 1557MeV @ 28.5.2010
		--	TDCTrig_in <= trig_in(111 downto 98)&trig_in(19 downto 10); --For Module 0x03, for 1557MeV @ 28.5.2010
		--	TDCTrig_in <= trig_in(124 downto 111)&trig_in(9+4+3 downto 0+4+3); --For Module 0x04, for 450MeV @ 28.6.2010
		--TDCTrig_in <= trig_in(111 downto 98)&trig_in(19+4+3 downto 10+4+3); --For Module 0x03, for 450MeV @ 28.6.2010
	
	TDCTrig_in <= 
		--Debug purposes
		InputChannelDebugRightGroup & InputChannelDebugLeftGroup	when (InputChannelsDebugMode = '1')  else
		
		--For Module 0x01, for 450MeV @ 13.9.2010
		trig_in(118 downto 105)	&trig_in(31 downto 24)&trig_in(11)&trig_in(23)	when (MAMIEnergySetting = "010") and (VN2andVN1 = x"01") and (InputChannelsDebugMode = '0')  else
		--For Module 0x01, for 1557MeV @ 13.9.2010
		trig_in(111 downto 98)	&trig_in(31 downto 24)&trig_in(11)&trig_in(23)	when (MAMIEnergySetting = "001") and (VN2andVN1 = x"01") and (InputChannelsDebugMode = '0')  else
		
		--For Module 0x02, for 450MeV @ 13.9.2010
		trig_in(113 downto 100)	&trig_in(81 downto 72)				when (MAMIEnergySetting = "010") and (VN2andVN1 = x"02") and (InputChannelsDebugMode = '0')  else
		--For Module 0x02, for 1557MeV @ 13.9.2010
		trig_in(113 downto 100)	&trig_in(9 downto 0)					when (MAMIEnergySetting = "001") and (VN2andVN1 = x"02") and (InputChannelsDebugMode = '0')  else
		
		--For Module 0x03, for 450MeV @ 28.6.2010
		trig_in(111 downto 98)	&trig_in(19+4+3 downto 10+4+3) 	when (MAMIEnergySetting = "010") and (VN2andVN1 = x"03") and (InputChannelsDebugMode = '0')  else
		--For Module 0x03, for 1557MeV @ 28.5.2010
		trig_in(111 downto 98)	&trig_in(19 downto 10) 				when (MAMIEnergySetting = "001") and (VN2andVN1 = x"03") and (InputChannelsDebugMode = '0')  else
		
		--For Module 0x04, for 450MeV @ 28.6.2010
		trig_in(124 downto 111)	&trig_in(9+4+3 downto 0+4+3) 	when (MAMIEnergySetting = "010") and (VN2andVN1 = x"04") and (InputChannelsDebugMode = '0')  else
		--For Module 0x04, for 1557MeV @ 28.5.2010
		trig_in(124 downto 111)&trig_in(9 downto 0) 				when (MAMIEnergySetting = "001") and (VN2andVN1 = x"04") and (InputChannelsDebugMode = '0') else
		(others => '0');
--	trig_out(NumberOfTDCs-1 downto 0) <= TDCTrig_in;

	---------------------------------------------------------------------------------
	-- Signals for MAMI e- flux counting
	---------------------------------------------------------------------------------
--	TaggerOR_SelectedCh_Heli0 <= '1' when (TDCTrig_in /= "0") and (DAQ_Enabled = '1') and 
--		(MAMIElectronSourceSetting(0) = '0') and (MAMIElectronSourceSetting(3) = '0') else '0';
--	TaggerOR_SelectedCh_Heli1 <= '1' when (TDCTrig_in /= "0") and (DAQ_Enabled = '1') and 
--		(MAMIElectronSourceSetting(0) = '1') and (MAMIElectronSourceSetting(3) = '0') else '0';
	FluxCounterEnable <= '1' when (DAQ_Enabled = '1') and (MAMIElectronSourceSetting(3) = '0') else '0';
	
	Tagger16ORs(0) <= '1' when (trig_in(16*0+15 downto 16*0) /= "0") and (FluxCounterEnable = '1') else '0';
	Tagger16ORs(1) <= '1' when (trig_in(16*1+15 downto 16*1) /= "0") and (FluxCounterEnable = '1') else '0';
	Tagger16ORs(2) <= '1' when (trig_in(16*2+15 downto 16*2) /= "0") and (FluxCounterEnable = '1') else '0';
	Tagger16ORs(3) <= '1' when (trig_in(16*3+15 downto 16*3) /= "0") and (FluxCounterEnable = '1') else '0';
	Tagger16ORs(4) <= '1' when (trig_in(16*0+15+3*32 downto 16*0+3*32) /= "0") and (FluxCounterEnable = '1') else '0';
	Tagger16ORs(5) <= '1' when (trig_in(16*1+15+3*32 downto 16*1+3*32) /= "0") and (FluxCounterEnable = '1') else '0';

	--Helicity 0
	AdditionalCountersOut_Intermediate(0) <= '1' when (Tagger16ORs(0) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0';
	AdditionalCountersOut_Intermediate(1) <= '1' when (Tagger16ORs(1) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0';
	AdditionalCountersOut_Intermediate(2) <= '1' when (Tagger16ORs(2) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0';
	AdditionalCountersOut_Intermediate(3) <= '1' when (Tagger16ORs(3) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0';
	AdditionalCountersOut_Intermediate(4) <= '1' when (Tagger16ORs(4) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0';
	AdditionalCountersOut_Intermediate(5) <= '1' when (Tagger16ORs(5) = '1') and (MAMIElectronSourceSetting(0) = '0') else '0';

	--Helicity 1
	AdditionalCountersOut_Intermediate(0+6) <= '1' when (Tagger16ORs(0) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0';
	AdditionalCountersOut_Intermediate(1+6) <= '1' when (Tagger16ORs(1) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0';
	AdditionalCountersOut_Intermediate(2+6) <= '1' when (Tagger16ORs(2) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0';
	AdditionalCountersOut_Intermediate(3+6) <= '1' when (Tagger16ORs(3) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0';
	AdditionalCountersOut_Intermediate(4+6) <= '1' when (Tagger16ORs(4) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0';
	AdditionalCountersOut_Intermediate(5+6) <= '1' when (Tagger16ORs(5) = '1') and (MAMIElectronSourceSetting(0) = '1') else '0';

--	Prescalers: for i in 0 to 12-1 generate -- loop trough all TDC channels
--		begin
--		Prescaler_0: Prescaler GENERIC MAP (Factor=>8) 
--			PORT MAP (clock=>clock200,Input=>AdditionalCountersOut_Intermediate(i),Output=>AdditionalCountersOut_Intermediate(i+12));
--	end generate;
	AdditionalCountersOut_Intermediate(31 downto 12) <= (others => '0');

--	TaggerOR_SelectedCh_Heli1 <= '1' when (trig_in(31 downto 0) /= "0") and (FluxCounterEnable = '1') and 
--		(MAMIElectronSourceSetting(0) = '1') else '0';
--	Prescaler_0: Prescaler GENERIC MAP (Factor=>8) 
--		PORT MAP (clock=>clock200,Input=>AdditionalCountersOut_Intermediate(0),Output=>AdditionalCountersOut_Intermediate(2));
--	Prescaler_1: Prescaler GENERIC MAP (Factor=>8) 
--		PORT MAP (clock=>clock200,Input=>AdditionalCountersOut_Intermediate(1),Output=>AdditionalCountersOut_Intermediate(3));
		
--	AdditionalCountersOut_Intermediate(0) <= TaggerOR_SelectedCh_Heli0;
--	AdditionalCountersOut_Intermediate(1) <= TaggerOR_SelectedCh_Heli1;
--	AdditionalCountersOut_Intermediate(5 downto 4) <= (others => '0');
	AdditionalCountersOut <= AdditionalCountersOut_Intermediate;
--	trig_out(31 downto 31-5) <= AdditionalCountersOut_Intermediate;

--	process (clock200)
--	begin
--		if rising_edge(clock200) then
--			TaggerOR_SelectedCh_Heli0_Last0 <= TaggerOR_SelectedCh_Heli0;
--			TaggerOR_SelectedCh_Heli0_Last1 <= TaggerOR_SelectedCh_Heli0_Last0;
--			TaggerOR_SelectedCh_Heli1_Last0 <= TaggerOR_SelectedCh_Heli1;
--			TaggerOR_SelectedCh_Heli1_Last1 <= TaggerOR_SelectedCh_Heli1_Last0;
--		end if;
--	end process;
--	process (clock200)
--	begin
--		if rising_edge(clock200) then
--			if (TaggerOR_SelectedCh_Heli0_Last0 = '1') and (TaggerOR_SelectedCh_Heli0_Last1 = '0') then
--				TaggerOR_SelectedCh_Heli0_underdriven <= TaggerOR_SelectedCh_Heli0_underdriven +1;
--			end if;
--			if (TaggerOR_SelectedCh_Heli1_Last0 = '1') and (TaggerOR_SelectedCh_Heli1_Last1 = '0') then
--				TaggerOR_SelectedCh_Heli1_underdriven <= TaggerOR_SelectedCh_Heli1_underdriven +1;
--			end if;
--		end if;
--	end process;
	
	--AdditionalCountersOut_Intermediate(2) <= TaggerOR_SelectedCh_Heli0_underdriven(7);
	--AdditionalCountersOut_Intermediate(3) <= TaggerOR_SelectedCh_Heli1_underdriven(7);
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
		ClearEntireRAM => DAQ_Reset,
		ClearCompleted => open,
		WriteEnabledB => HistogramRAM_WEB,
		DataInB => HistogramRAM_DInB,
		AddrB => HistogramRAM_AddrB,
		DataOutB => HistogramRAM_DOutB(0)
	);
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
				ClearEntireRAM => DAQ_Reset,
				ClearCompleted => open,
				WriteEnabledB => HistogramRAM_WEB,
				DataInB => HistogramRAM_DInB,
				AddrB => HistogramRAM_AddrB,
				DataOutB => HistogramRAM_DOutB( k*NumberOfPairsPerLeftCh+i+1)
			);
		end generate;
	end generate;

	------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------
	-- FSM DAQ
	------------------------------------------------------------------------------------------
	DAQFSM_State: process (clock50, DAQ_Reset)
	begin
		if rising_edge(clock50) then
			if (DAQ_Reset = '1') then
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
	
	LiveTimeCounters: process(clock100)
	begin
		if rising_edge(clock100) then
			if (DAQ_State = FullReset0) then
				DAQ_Counter_LiveTimeGated <= (others => '0');
			elsif ((DAQ_State = WaitForAnyHit) or (DAQ_State = WaitAfterAnyHit1)) and (DAQ_Enabled = '1') then
				DAQ_Counter_LiveTimeGated <= DAQ_Counter_LiveTimeGated + 1;
			else
				DAQ_Counter_LiveTimeGated <= DAQ_Counter_LiveTimeGated;
			end if;
			
			--if (DAQ_State = FullReset0) then --these two lines are not used any longer
			--	DAQ_Counter_LiveTime <= (others => '0');
			if (DAQ_Enabled = '1') then
				DAQ_Counter_LiveTime <= DAQ_Counter_LiveTime + 1;
			else
				DAQ_Counter_LiveTime <= DAQ_Counter_LiveTime;
			end if;
			
			if (DAQ_Counter_Fix = '1') then
				DAQ_Counter_LiveTimeGated_Fix <= DAQ_Counter_LiveTimeGated(39 downto 39-31);
				DAQ_Counter_LiveTime_Fix <= DAQ_Counter_LiveTime(39 downto 39-31);
			else
				DAQ_Counter_LiveTimeGated_Fix <= DAQ_Counter_LiveTimeGated_Fix ;
				DAQ_Counter_LiveTime_Fix <= DAQ_Counter_LiveTime_Fix;
			end if;
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
--			DAQ_NextState <= FillHistogram3; -- damit's stehen bleibt
		else
			DAQ_NextState <= FullReset0;
		end if;
	end process;
	------------------------------------------------------------------------------------------

	
	trig_out(1) <= TDC_HitPresent(0);
	trig_out(2) <= Clock400GateEnable;
	trig_out(3) <= TDCCountersClear;
	trig_out(4) <= TDC_HitClear_InputClockBuffer;
	trig_out(5) <= '1' when DAQ_State = FullReset0 else '0';
	trig_out(6) <= '1' when DAQ_State = FullReset1 else '0';
	trig_out(7) <= '1' when DAQ_State = FullReset2 else '0';
	trig_out(8) <= '1' when DAQ_State = FullReset3 else '0';
	trig_out(9) <= '1' when DAQ_State = WaitForAnyHit else '0';
	trig_out(10) <= '1' when DAQ_State = WaitAfterAnyHit1 else '0';
	trig_out(11) <= '1' when DAQ_State = ResetAndSave else '0';
	trig_out(12) <= TDC_HitPresent(0);
	trig_out(13) <= TDC_HitPresent(1);
	trig_out(14) <= TDC_HitPresent(2);
	trig_out(15) <= TDC_HitPresent(3);
	trig_out(16) <= TDC_HitPresent(4);
	trig_out(17) <= TDC_HitPresent(5);
	trig_out(18) <= TDC_HitPresent(6);
	trig_out(19) <= TDC_HitPresent(7);
	trig_out(20) <= TDC_HitPresent(8);
	trig_out(21) <= TDC_HitPresent(9);
	trig_out(22) <= TDC_HitPresent(10);
	trig_out(23) <= TDC_HitPresent(11);
	trig_out(24) <= TDC_HitPresent(12);
	trig_out(25) <= TDC_HitPresent(13);
	trig_out(26) <= TDC_HitPresent(14);
	trig_out(27) <= TDC_HitPresent(15);
	trig_out(28) <= TDC_HitPresent(16);
	trig_out(29) <= TDC_HitPresent(17);
	trig_out(30) <= TDC_HitPresent(18);
	trig_out(31) <= TDC_HitPresent(19);
	
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

	
	--TaggerOR <= '1' when trig_in(63 downto 43) /= "0" else '0';
	--nim_out <= MoellerTriggerSignal; --DAQ_Enabled;

	nim_out <= TDCTrig_in(0) when DebugTrigIn = x"0000" else
		TDCTrig_in(1) when DebugTrigIn = x"0001" else
		TDCTrig_in(2) when DebugTrigIn = x"0002" else
		TDCTrig_in(3) when DebugTrigIn = x"0003" else
		TDCTrig_in(4) when DebugTrigIn = x"0004" else
		TDCTrig_in(5) when DebugTrigIn = x"0005" else
		TDCTrig_in(6) when DebugTrigIn = x"0006" else
		TDCTrig_in(7) when DebugTrigIn = x"0007" else
		TDCTrig_in(8) when DebugTrigIn = x"0008" else
		TDCTrig_in(9) when DebugTrigIn = x"0009" else
		TDCTrig_in(10) when DebugTrigIn = x"000A" else
		TDCTrig_in(11) when DebugTrigIn = x"000B" else
		TDCTrig_in(12) when DebugTrigIn = x"000C" else
		TDCTrig_in(13) when DebugTrigIn = x"000D" else
		TDCTrig_in(14) when DebugTrigIn = x"000E" else
		TDCTrig_in(15) when DebugTrigIn = x"000F" else
		TDCTrig_in(16) when DebugTrigIn = x"0010" else
		TDCTrig_in(17) when DebugTrigIn = x"0011" else
		TDCTrig_in(18) when DebugTrigIn = x"0012" else
		TDCTrig_in(19) when DebugTrigIn = x"0013" else
		TDCTrig_in(20) when DebugTrigIn = x"0014" else
		TDCTrig_in(21) when DebugTrigIn = x"0015" else
		TDCTrig_in(22) when DebugTrigIn = x"0016" else
		TDCTrig_in(23) when DebugTrigIn = x"0017" else
		TDC_HitPresent(0) when DebugTrigIn = x"0020" else
		TDC_HitPresent(1) when DebugTrigIn = x"0021" else
		TDC_HitPresent(2) when DebugTrigIn = x"0022" else
		TDC_HitPresent(3) when DebugTrigIn = x"0023" else
		TDC_HitPresent(4) when DebugTrigIn = x"0024" else
		TDC_HitPresent(5) when DebugTrigIn = x"0025" else
		TDC_HitPresent(6) when DebugTrigIn = x"0026" else
		TDC_HitPresent(7) when DebugTrigIn = x"0027" else
		TDC_HitPresent(8) when DebugTrigIn = x"0028" else
		TDC_HitPresent(9) when DebugTrigIn = x"0029" else
		TDC_HitPresent(10) when DebugTrigIn = x"002a" else
		TDC_HitPresent(11) when DebugTrigIn = x"002b" else
		TDC_HitPresent(12) when DebugTrigIn = x"002c" else
		TDC_HitPresent(13) when DebugTrigIn = x"002d" else
		TDC_HitPresent(14) when DebugTrigIn = x"002e" else
		TDC_HitPresent(15) when DebugTrigIn = x"002f" else
		TDC_HitPresent(16) when DebugTrigIn = x"0030" else
		TDC_HitPresent(17) when DebugTrigIn = x"0031" else
		TDC_HitPresent(18) when DebugTrigIn = x"0032" else
		TDC_HitPresent(19) when DebugTrigIn = x"0033" else
		TDC_HitPresent(20) when DebugTrigIn = x"0034" else
		TDC_HitPresent(21) when DebugTrigIn = x"0035" else
		TDC_HitPresent(22) when DebugTrigIn = x"0036" else
		TDC_HitPresent(23) when DebugTrigIn = x"0037" else
		MoellerTriggerSignal when DebugTrigIn = x"00FF" else
		MAMIElectronSourceSetting(3) when DebugTrigIn = x"0100" else
		'0';
	
	
	
	---------------------------------------------------------------------------------------------------------	
	-- Code for VME handling / access
	-- decoder for data registers
	-- handle write commands from vmebus
	---------------------------------------------------------------------------------------------------------	
	process(clock50, ckcsr, u_ad_reg)
	begin
		HistogramRAM_WEB <= '0'; -- schreiben auf den RAM disabled
		if (clock50'event and clock50 ='1') then
			if (u_ad_reg(11 downto 4) = BASE_TRIG_DAQ_Enabled) and (ckcsr = '1') then 
				DAQ_Enabled <= u_dat_in(0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_DAQ_Reset) and (ckcsr = '1') then 
				DAQ_Reset <= u_dat_in(0); end if;

			if (u_ad_reg(11 downto 4) = BASE_TRIG_DAQ_Counter_Fix) and (ckcsr = '1') then 
				DAQ_Counter_Fix <= u_dat_in(0); else DAQ_Counter_Fix <= '0'; end if;

--			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_WEB) and (ckcsr = '1') then 
--				HistogramRAM_WEB <= u_dat_in(0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_AddrB) and (ckcsr = '1') then 
				HistogramRAM_AddrB <= u_dat_in(8 downto 0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_DInB) and (ckcsr = '1') then 
				HistogramRAM_DInB <= u_dat_in; end if;

			if (u_ad_reg(11 downto 4) = BASE_TRIG_MAMIEnergySetting) and (ckcsr = '1') then 
				MAMIEnergySetting <= u_dat_in(2 downto 0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_InputChannelsDebugMode) and (ckcsr = '1') then 
				InputChannelsDebugMode <= u_dat_in(0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_InputChannelDebugLeftStart) and (ckcsr = '1') then 
				InputChannelDebugLeftStart <= u_dat_in(7 downto 0); end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_InputChannelDebugRightStart) and (ckcsr = '1') then 
				InputChannelDebugRightStart <= u_dat_in(7 downto 0); end if;

			if (u_ad_reg(11 downto 4) = BASE_TRIG_DebugTrigIn) and (ckcsr = '1') then 
				DebugTrigIn <= u_dat_in; end if;
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
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_WEB) then
				u_data_o(0) <= HistogramRAM_WEB; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_HistogramRAM_AddrB) then
				u_data_o(8 downto 0) <= HistogramRAM_AddrB; end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_HistogramRAM_DInB) then
				u_data_o <= HistogramRAM_DInB; end if;
			-- Histogram 0 readout
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_HistogramRAM_DOutB0) then
				u_data_o <= HistogramRAM_DOutB(0); end if;
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
				
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Counter_LiveTime) then
				u_data_o <= DAQ_Counter_LiveTime_Fix; end if;
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Counter_LiveTimeGated) then
				u_data_o <= DAQ_Counter_LiveTimeGated_Fix;	 end if;
			
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Enabled) then
				u_data_o(0) <= DAQ_Enabled; end if;
				
			if (u_ad_reg(11 downto 4) =  BASE_TRIG_DAQ_Reset) then
				u_data_o(0) <= DAQ_Reset; end if;
				
			if (u_ad_reg(11 downto 4) = BASE_TRIG_VN2andVN1) then
				u_data_o(7 downto 0) <= VN2andVN1; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_MAMIEnergySetting) then
				u_data_o(2 downto 0) <= MAMIEnergySetting; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_InputChannelsDebugMode) then
				u_data_o(0) <= InputChannelsDebugMode; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_InputChannelDebugLeftStart) then
				u_data_o(7 downto 0) <= InputChannelDebugLeftStart; end if;
			if (u_ad_reg(11 downto 4) = BASE_TRIG_InputChannelDebugRightStart) then
				u_data_o(7 downto 0) <= InputChannelDebugRightStart; end if;
				

			if (u_ad_reg(11 downto 4) =  BASE_TRIG_FIXED) then 
				u_data_o(31 downto 0) <= TRIG_FIXED; end if;

			if (u_ad_reg(11 downto 4) = BASE_TRIG_DebugTrigIn) then 
				u_data_o <= DebugTrigIn; end if;
				
		end if;
	end process;

end RTL;