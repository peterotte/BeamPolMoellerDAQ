----------------------------------------------------------------------------------
-- Company: Institut für Kernphysik
-- Engineer: Peter-Bernd Otte
-- 
-- Create Date:    14:30:47 02/01/2010 
-- Module Name:    AdvSingleTDC - Behavioral 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--   Reihenfolge beim Zurücksetzen: 
--		(1) Gate ein, 
--		(2) ClearData ein, 
--		(3) ClearData aus und ResetHit ein, 
--		(4) ResetHit aus, fertig!
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.All;

entity AdvSingleTDC is
	-- Needs calibration:
	Generic (
		ShiftFineDataBy : integer := 42; -- Eleminate Offset 
		WhereToPlace : string;
		WhereToPlaceTDCHitControl : string;
		DebugDetermineShiftFineDataBy : natural := 0;
		TDCAdjustmentSelection : natural := 0;
		InterSelectSingleFineData : STD_LOGIC_VECTOR(31 downto 0) := x"ffffffff" ); 
   Port ( 
		CountersClear : in  STD_LOGIC;
		HitSave : in  STD_LOGIC;
		TDCGate : in STD_LOGIC;
		Clock400 : in  STD_LOGIC;
		HitClear : in  STD_LOGIC;
		HitPresent : out  STD_LOGIC;
		HitBeforeBuffer : out  STD_LOGIC;
		TimeDataSmall : out  STD_LOGIC_VECTOR (7 downto 0);
		DebugBigData : out  STD_LOGIC_VECTOR (15 downto 0);
		DebugBigDataLater : out  STD_LOGIC_VECTOR (15 downto 0);
		DebugFineData : out  STD_LOGIC_VECTOR (31 downto 0));
end AdvSingleTDC;

architecture Behavioral of AdvSingleTDC is
   COMPONENT SingleTDC
		PORT( Clock400	:	IN	STD_LOGIC; 
			BigDataLater	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
			BigData	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
			FineDataSaved	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
			SelectSingleFineData :	IN	STD_LOGIC_VECTOR(31 downto 0); 
			HitClear	:	IN	STD_LOGIC; 
			HitAfterBuffer	:	IN	STD_LOGIC; 
			CountersClear	:	IN	STD_LOGIC; 
			HitPresent	:	OUT	STD_LOGIC);
   END COMPONENT;

	
   COMPONENT TDCHitControl
   PORT( HitSave	:	IN	STD_LOGIC; 
          HitBeforeBuffer	:	OUT	STD_LOGIC; 
          TDCGate	:	IN	STD_LOGIC; 
          HitClear	:	IN	STD_LOGIC; 
          HitAfterBuffer	:	OUT	STD_LOGIC);
   END COMPONENT;
	
	signal MyFineDataSaved : std_logic_vector(31 downto 0);
	signal MyBigData, MyBigDataLater : std_logic_vector(15 downto 0);
	signal TempSignalOnlyForReduction : std_logic_vector(2 downto 0);
	
	signal InterHitAfterBuffer : std_logic;

	constant NFDSteps : integer := 56; --NumberOfFineDataSteps
	constant NRedFDSteps : integer := 8; --Reduced NumberOfFineDataSteps
	subtype TMyFineData is integer range 0 to NFDSteps-1;
	subtype TMyFineDataSmall is integer range 0 to NRedFDSteps-1;
	signal MyFineDataEncoded : TMyFineData;
	signal MyFineDataEncodedSmall : TMyFineDataSmall;
	
	attribute RLOC_ORIGIN       : string ;
	attribute RLOC_ORIGIN of Inst_SingleTDC : label is WhereToPlace;
	attribute RLOC_ORIGIN of Inst_TDCHitControl : label is WhereToPlaceTDCHitControl;
	
	constant TDCAdjustmentCount : integer := 24;
	type TTDCAdjustment is array(0 to TDCAdjustmentCount-1, 0 to NRedFDSteps-2) of integer;
	constant TDCAdjustmentSettings : TTDCAdjustment := 
		( 
			(9, 15, 21, 33, 38, 44, 49), --TDC0
			(9, 15, 21, 27, 38, 44, 49),  --TDC1, etc...
			(10, 16, 22, 28, 38, 44, 49),
			(9, 15, 20, 26, 37, 43, 49),
			(10, 15, 21, 26, 37, 43, 49),
			(10, 15, 21, 27, 38, 44, 49),
			(10, 16, 22, 28, 38, 44, 49),
			(10, 15, 21, 30, 38, 44, 49),
			(10, 16, 21, 28, 38, 44, 49),
			(10, 16, 21, 30, 38, 44, 49),
			(10, 15, 20, 25, 37, 43, 49),
			(10, 15, 21, 33, 38, 43, 49),
			(10, 16, 21, 28, 38, 44, 49), --not measured
			(10, 16, 21, 30, 38, 44, 49), --not measured
			(10, 15, 20, 25, 37, 43, 49), --not measured
			(10, 15, 21, 33, 38, 43, 49), --not measured
			(10, 16, 21, 28, 38, 44, 49), --not measured
			(10, 16, 21, 30, 38, 44, 49), --not measured
			(10, 15, 20, 25, 37, 43, 49), --not measured
			(10, 15, 21, 33, 38, 43, 49), --not measured
			(10, 16, 21, 28, 38, 44, 49), --not measured
			(10, 16, 21, 30, 38, 44, 49), --not measured
			(10, 15, 20, 25, 37, 43, 49), --not measured
			(10, 15, 21, 33, 38, 43, 49)  --not measured
		);

begin

	Inst_TDCHitControl: TDCHitControl PORT MAP(
		HitSave => HitSave,
		HitBeforeBuffer => HitBeforeBuffer,
		TDCGate => TDCGate,
		HitClear => HitClear, 
		HitAfterBuffer => InterHitAfterBuffer
   );

	Inst_SingleTDC: SingleTDC PORT MAP(
		HitAfterBuffer => InterHitAfterBuffer,
		Clock400 => Clock400, 
		BigDataLater => MyBigDataLater, 
		BigData => MyBigData, 
		SelectSingleFineData => InterSelectSingleFineData,
		FineDataSaved => MyFineDataSaved, 
		HitClear => HitClear, 
		CountersClear => CountersClear, 
		HitPresent => HitPresent
   );
	
	DebugFineData <= MyFineDataSaved;
	DebugBigData <= MyBigData;
	DebugBigDataLater <= MyBigDataLater;
	
	MyFineDataEncoded <= 
		((0-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(1 downto 0) = "01") else 
			((28-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(1 downto 0) = "10") else   
		((1-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(2 downto 1) = "01") else 
			((29-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(2 downto 1) = "10") else   -- diese dürften evtl. auch Ergebnisse liefern
		((2-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(3 downto 2) = "01") else 
			((30-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(3 downto 2) = "10") else   -- welche auf unterschiedliche Variaten zustande
		((3-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(4 downto 3) = "01") else 
			((31-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(4 downto 3) = "10") else   -- kommen um bei evtl. unterschiedliche Laufzeiten
		((4-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(5 downto 4) = "01") else 
			((32-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(5 downto 4) = "10") else   -- immer ein sicheres Ergebnis zu erreichen
		((5-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(6 downto 5) = "01") else 
			((33-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(6 downto 5) = "10") else   -- z.B. man könnte auf zwei unterschiedliche Arten
		((6-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(7 downto 6) = "01") else 
			((34-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(7 downto 6) = "10") else   -- 25 oder 49 erreichen
		((7-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(8 downto 7) = "01") else 
			((35-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(8 downto 7) = "10") else   -- teilweise ist dies jetzt auch schon gemacht.
		((8-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(9 downto 8) = "01") else 
			((36-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(9 downto 8) = "10") else 
		((9-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(10 downto 9) = "01") else 
			((37-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(10 downto 9) = "10") else 
		((10-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(11 downto 10) = "01") else 
			((38-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(11 downto 10) = "10") else 
		((11-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(12 downto 11) = "01") else 
			((39-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(12 downto 11) = "10") else 
		((12-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(13 downto 12) = "01") else 
			((40-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(13 downto 12) = "10") else 
		((13-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(14 downto 13) = "01") else 
			((41-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(14 downto 13) = "10") else 
		((14-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(15 downto 14) = "01") else 
			((42-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(15 downto 14) = "10") else 
		((15-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(16 downto 15) = "01") else 
			((43-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(16 downto 15) = "10") else 
		((16-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(17 downto 16) = "01") else 
			((44-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(17 downto 16) = "10") else 
		((17-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(18 downto 17) = "01") else 
			((45-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(18 downto 17) = "10") else 
		((18-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(19 downto 18) = "01") else 
			((46-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(19 downto 18) = "10") else 
		((19-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(20 downto 19) = "01") else 
			((47-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(20 downto 19) = "10") else 
		((20-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(21 downto 20) = "01") else 
			((48-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(21 downto 20) = "10") else 
		((21-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(22 downto 21) = "01") else 
			((49-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(22 downto 21) = "10") else 
		((22-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(23 downto 22) = "01") else 
			((50-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(23 downto 22) = "10") else 
		((23-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(24 downto 23) = "01") else 
			((51-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(24 downto 23) = "10") else 
		((24-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(25 downto 24) = "01") else 
			((52-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(25 downto 24) = "10") else 
		((25-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(26 downto 25) = "01") else 
			((53-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(26 downto 25) = "10") else 
		((26-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(27 downto 26) = "01") else
			((54-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(27 downto 26) = "10") else 
		((27-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(28 downto 27) = "01") else -- evtl. hier noch weitere Einträge hinzufügen
			((55-ShiftFineDataBy+NFDSteps) mod NFDSteps) when (MyFineDataSaved(28 downto 27) = "10") else 
		
			((0-ShiftFineDataBy+NFDSteps) mod NFDSteps); -- dieser Einträge sichern auch bei unterschiedliche
														-- schneller Laufzeit in den Elementen ein (fast) richtiges Ergebnis

	-- Depending on NRedFDSteps, we need to modify this when construct:
	MyFineDataEncodedSmall <= 
		0 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,0)) else 	
		1 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,1)) else 	
		2 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,2)) else 	
		3 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,3)) else 	
		4 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,4)) else 	
		5 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,5)) else 	
		6 when (MyFineDataEncoded <= TDCAdjustmentSettings(TDCAdjustmentSelection,6)) else 	
		7 ;
		

	-- For NRedFDSteps = 16
	--              0+
	--           15    1+
	--         14        2+
	--        13          3+
	--       12*           4+
	--        11*         5*
	--         10*       6*                  normal MyBigDataLater
	--           9*    7*                + = uses MyBigDataLater+1
	--              8*                   * = uses MyBigData
	
	-- For NRedFDSteps = 8
	--              0+
	--           7    1+
	--         6*       2+
	--           5*   3*
	--              4*
	
	
	-- Also, in the following, several changes has to be mode to comply with: NRedFDSteps
	-- For bin widths of 2.5/4ns
--	DebugCondiditionNormal: if DebugDetermineShiftFineDataBy = 0 generate
--		TimeDataSmall(7 downto 2) <= MyBigDataLater(5 downto 0)+1 when (MyFineDataEncodedSmall < 3) else
--			MyBigData(5 downto 0) when (MyFineDataEncodedSmall < 7) else
--			MyBigDataLater(5 downto 0);
--		TempSignalOnlyForReduction <= std_logic_vector(to_unsigned(MyFineDataEncodedSmall, 3)); 
--		TimeDataSmall(1 downto 0) <= TempSignalOnlyForReduction(2 downto 1);
--	end generate;
	-- For bin widths of 2.5/8ns
	DebugCondiditionNormal: if DebugDetermineShiftFineDataBy = 0 generate
		TimeDataSmall(7 downto 3) <= MyBigDataLater(4 downto 0)+1 when (MyFineDataEncodedSmall < 3) else
			MyBigData(4 downto 0) when (MyFineDataEncodedSmall < 7) else
			MyBigDataLater(4 downto 0);
		TimeDataSmall(2 downto 0) <= std_logic_vector(to_unsigned(MyFineDataEncodedSmall, 3));
	end generate;

	DebugCondiditionDetermine1: if DebugDetermineShiftFineDataBy = 1 generate		
		--	Zum Bestimmen von ShiftFineDataBy
		TimeDataSmall(7 downto 5) <= "000";
		TimeDataSmall(4 downto 0) <= "00"&std_logic_vector(to_unsigned(MyFineDataEncodedSmall, 3)) when
				MyBigDataLater(3 downto 0) /= MyBigData(3 downto 0) else -- hier könnte es auch ausreichen, nur ein einzelnes Bit zu vergleichen
				"10000";
	end generate;
	DebugCondiditionDetermine2: if DebugDetermineShiftFineDataBy = 2 generate		
		--	Zum Bestimmen von ShiftFineDataBy
		TimeDataSmall(7 downto 0) <= "00000"&std_logic_vector(to_unsigned(MyFineDataEncodedSmall, 3));
	end generate;
	DebugCondiditionDetermine3: if DebugDetermineShiftFineDataBy = 3 generate		
		--	Zum Bestimmen von ShiftFineDataBy
		TimeDataSmall(7 downto 0) <= "00"&std_logic_vector(to_unsigned(MyFineDataEncoded, 6)) when
				MyBigDataLater(3 downto 0) /= MyBigData(3 downto 0) else
				"01000000";
	end generate;
	DebugCondiditionDetermine4: if DebugDetermineShiftFineDataBy = 4 generate		
		--	Zum Bestimmen von ShiftFineDataBy
		TimeDataSmall(7 downto 0) <= "00"&std_logic_vector(to_unsigned(MyFineDataEncoded, 6));
	end generate;

end Behavioral;

