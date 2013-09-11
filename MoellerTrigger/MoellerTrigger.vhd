library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

ENTITY MoellerTrigger is
	PORT (
		TChannelIn  : in STD_LOGIC_VECTOR(23 downto 0);
		TriggerOut : OUT STD_LOGIC;
		InhibitOutput : in STD_LOGIC; -- used e.g. when MAMI Source state is undetermined
		CLOCK : IN STD_LOGIC
     );
END MoellerTrigger;

ARCHITECTURE behavior OF MoellerTrigger IS
	-- All tagger channels starting with 0!
   constant NumberOfLeftChannels : integer := 10;
	constant NumberOfPairsPerLeftCh : integer := 5;
	signal ZwischenTaggerChannel : STD_LOGIC_vector(23 downto 0);
	signal EnergiePaar : STD_LOGIC_vector(NumberOfLeftChannels-1 downto 0);
	
	component ChannelCombination is
		Generic (
			Width : integer			);
		PORT (
			EingangLinks : in STD_LOGIC;
			EingaengeRechts : in STD_LOGIC_VECTOR(Width-1 downto 0);
			Ausgang : out STD_LOGIC
		);
	end component;
	
	component InputStretcher is
	Generic (
		Duration : integer := 1		);
		PORT (
			Clock : in STD_LOGIC;
			Input : in STD_LOGIC;
			Output : out STD_LOGIC
		);
	end component;
	
	type TKoinzidenzenLogik is array(0 to NumberOfLeftChannels-1, 0 to 1) of integer;
	constant KoinzidenzenLogik : TKoinzidenzenLogik := 
		( 
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
	
	signal MoellerTrigger_Short : std_logic;
BEGIN
	--Vorbereiten der Eingänge
	TChLD0to23: for i in 0 to 23 generate
	begin
		TChannel : InputStretcher generic map (Duration => 2) port map (Clock, TChannelIn(i), ZwischenTaggerChannel(i));
	end generate;

	--Koinzidenzen herstellen
	Ccomb: for i in 0 to NumberOfLeftChannels-1 generate
	--Ccomb: for i in 0 to 0 generate
	begin
		Ccombi: ChannelCombination 
			generic map (Width => NumberOfPairsPerLeftCh) 
			port map (ZwischenTaggerChannel(KoinzidenzenLogik(i,0)), 
				ZwischenTaggerChannel(KoinzidenzenLogik(i,1)+NumberOfPairsPerLeftCh-1 downto KoinzidenzenLogik(i,1)),
				EnergiePaar(i));
	end generate;
	
	-- Triggersignal ausgeben
	MoellerTrigger_Short <= '1' when ((EnergiePaar /= "0") and (InhibitOutput = '0')) else '0';

	TriggerOutStretcher: InputStretcher generic map (Duration => 2) port map (Clock, MoellerTrigger_Short, TriggerOut);

END behavior;


-- Old: 13.7.2009
--	constant KoinzidenzenLogik : TKoinzidenzenLogik := 
--		( 
--			(130, 252, 255, 4), 
--			(131, 251, 254, 4), 
--			(132, 250, 253, 4), 
--			(133, 249, 252, 4), 
--			(134, 248, 251, 4), 
--			(135, 247, 250, 4), 
--			(136, 246, 249, 4), 
--			(137, 245, 248, 4), 
--			(138, 245, 248, 4), 
--			(139, 244, 247, 4), 
--			(140, 243, 246, 4), 
--			(141, 242, 245, 4), 
--			(142, 241, 244, 4), 
--			(143, 240, 243, 4), 
--			(144, 239, 242, 4), 
--			(145, 238, 241, 4)
--		);
