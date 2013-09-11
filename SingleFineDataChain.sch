<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="FineDataB(0)" />
        <signal name="Clock" />
        <signal name="FineDataB(1)" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="FineDataB(2)" />
        <signal name="Enable" />
        <signal name="Save" />
        <signal name="Clear" />
        <signal name="FineDataB(31:0)" />
        <signal name="FineDataB(3)" />
        <signal name="XLXN_26" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_33" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="FineDataB(4)" />
        <signal name="FineDataB(5)" />
        <signal name="FineDataB(6)" />
        <signal name="FineDataB(7)" />
        <signal name="FineDataB(8)" />
        <signal name="FineDataB(9)" />
        <signal name="FineDataB(10)" />
        <signal name="FineDataB(11)" />
        <signal name="XLXN_82" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="XLXN_79" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="FineDataB(12)" />
        <signal name="FineDataB(13)" />
        <signal name="FineDataB(14)" />
        <signal name="FineDataB(15)" />
        <signal name="FineDataB(16)" />
        <signal name="FineDataB(17)" />
        <signal name="FineDataB(18)" />
        <signal name="FineDataB(19)" />
        <signal name="XLXN_84" />
        <signal name="XLXN_85" />
        <signal name="XLXN_86" />
        <signal name="FineDataB(20)" />
        <signal name="FineDataB(21)" />
        <signal name="FineDataB(22)" />
        <signal name="FineDataB(23)" />
        <signal name="XLXN_110" />
        <signal name="XLXN_112" />
        <signal name="XLXN_113" />
        <signal name="XLXN_114" />
        <signal name="XLXN_115" />
        <signal name="XLXN_116" />
        <signal name="CarryChain_OLast" />
        <signal name="XLXN_118" />
        <signal name="FineDataB(24)" />
        <signal name="FineDataB(25)" />
        <signal name="FineDataB(26)" />
        <signal name="FineDataB(27)" />
        <signal name="FineDataB(28)" />
        <signal name="FineDataB(29)" />
        <signal name="FineDataB(31)" />
        <signal name="Carryline_End" />
        <signal name="XLXN_158" />
        <signal name="FineDataB(30)" />
        <signal name="CarryChain_O1" />
        <signal name="FineDataA(31:0)" />
        <signal name="FineDataA(1)" />
        <signal name="FineDataA(2)" />
        <signal name="FineDataA(3)" />
        <signal name="FineDataA(0)" />
        <signal name="FineDataA(11)" />
        <signal name="FineDataA(10)" />
        <signal name="FineDataA(9)" />
        <signal name="FineDataA(8)" />
        <signal name="FineDataA(7)" />
        <signal name="FineDataA(6)" />
        <signal name="FineDataA(5)" />
        <signal name="FineDataA(4)" />
        <signal name="FineDataA(23)" />
        <signal name="FineDataA(22)" />
        <signal name="FineDataA(21)" />
        <signal name="FineDataA(20)" />
        <signal name="FineDataA(19)" />
        <signal name="FineDataA(18)" />
        <signal name="FineDataA(17)" />
        <signal name="FineDataA(16)" />
        <signal name="FineDataA(15)" />
        <signal name="FineDataA(14)" />
        <signal name="FineDataA(13)" />
        <signal name="FineDataA(12)" />
        <signal name="FineDataA(31)" />
        <signal name="FineDataA(30)" />
        <signal name="FineDataA(29)" />
        <signal name="FineDataA(28)" />
        <signal name="FineDataA(27)" />
        <signal name="FineDataA(26)" />
        <signal name="FineDataA(25)" />
        <signal name="FineDataA(24)" />
        <port polarity="Input" name="Clock" />
        <port polarity="Input" name="Enable" />
        <port polarity="Input" name="Save" />
        <port polarity="Input" name="Clear" />
        <port polarity="Output" name="FineDataB(31:0)" />
        <port polarity="Output" name="Carryline_End" />
        <port polarity="Output" name="FineDataA(31:0)" />
        <blockdef name="TDCBasicCell">
            <timestamp>2010-1-16T21:38:21</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="TDCBasicCell" name="TDCCell1">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="Clock" name="Carry_In" />
            <blockpin signalname="CarryChain_O1" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(0)" name="FineDataA" />
            <blockpin signalname="FineDataB(0)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell2">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="CarryChain_O1" name="Carry_In" />
            <blockpin signalname="XLXN_13" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(1)" name="FineDataA" />
            <blockpin signalname="FineDataB(1)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell3">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_13" name="Carry_In" />
            <blockpin signalname="XLXN_14" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(2)" name="FineDataA" />
            <blockpin signalname="FineDataB(2)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell4">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_14" name="Carry_In" />
            <blockpin signalname="XLXN_26" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(3)" name="FineDataA" />
            <blockpin signalname="FineDataB(3)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell5">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_26" name="Carry_In" />
            <blockpin signalname="XLXN_30" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(4)" name="FineDataA" />
            <blockpin signalname="FineDataB(4)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell6">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_30" name="Carry_In" />
            <blockpin signalname="XLXN_31" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(5)" name="FineDataA" />
            <blockpin signalname="FineDataB(5)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell7">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_31" name="Carry_In" />
            <blockpin signalname="XLXN_32" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(6)" name="FineDataA" />
            <blockpin signalname="FineDataB(6)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell8">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_32" name="Carry_In" />
            <blockpin signalname="XLXN_33" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(7)" name="FineDataA" />
            <blockpin signalname="FineDataB(7)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell9">
            <attr value="X0Y8" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_33" name="Carry_In" />
            <blockpin signalname="XLXN_34" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(8)" name="FineDataA" />
            <blockpin signalname="FineDataB(8)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell10">
            <attr value="X0Y9" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_34" name="Carry_In" />
            <blockpin signalname="XLXN_35" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(9)" name="FineDataA" />
            <blockpin signalname="FineDataB(9)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell11">
            <attr value="X0Y10" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_35" name="Carry_In" />
            <blockpin signalname="XLXN_36" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(10)" name="FineDataA" />
            <blockpin signalname="FineDataB(10)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell12">
            <attr value="X0Y11" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_36" name="Carry_In" />
            <blockpin signalname="XLXN_82" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(11)" name="FineDataA" />
            <blockpin signalname="FineDataB(11)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell13">
            <attr value="X0Y12" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_82" name="Carry_In" />
            <blockpin signalname="XLXN_81" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(12)" name="FineDataA" />
            <blockpin signalname="FineDataB(12)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell14">
            <attr value="X0Y13" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_81" name="Carry_In" />
            <blockpin signalname="XLXN_80" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(13)" name="FineDataA" />
            <blockpin signalname="FineDataB(13)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell15">
            <attr value="X0Y14" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_80" name="Carry_In" />
            <blockpin signalname="XLXN_79" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(14)" name="FineDataA" />
            <blockpin signalname="FineDataB(14)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell16">
            <attr value="X0Y15" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_79" name="Carry_In" />
            <blockpin signalname="XLXN_78" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(15)" name="FineDataA" />
            <blockpin signalname="FineDataB(15)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell17">
            <attr value="X0Y16" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_78" name="Carry_In" />
            <blockpin signalname="XLXN_77" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(16)" name="FineDataA" />
            <blockpin signalname="FineDataB(16)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell18">
            <attr value="X0Y17" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_77" name="Carry_In" />
            <blockpin signalname="XLXN_76" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(17)" name="FineDataA" />
            <blockpin signalname="FineDataB(17)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell19">
            <attr value="X0Y18" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_76" name="Carry_In" />
            <blockpin signalname="XLXN_75" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(18)" name="FineDataA" />
            <blockpin signalname="FineDataB(18)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell20">
            <attr value="X0Y19" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_75" name="Carry_In" />
            <blockpin signalname="XLXN_110" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(19)" name="FineDataA" />
            <blockpin signalname="FineDataB(19)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell24">
            <attr value="X0Y23" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_86" name="Carry_In" />
            <blockpin signalname="XLXN_158" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(23)" name="FineDataA" />
            <blockpin signalname="FineDataB(23)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell21">
            <attr value="X0Y20" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_110" name="Carry_In" />
            <blockpin signalname="XLXN_84" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(20)" name="FineDataA" />
            <blockpin signalname="FineDataB(20)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell22">
            <attr value="X0Y21" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_84" name="Carry_In" />
            <blockpin signalname="XLXN_85" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(21)" name="FineDataA" />
            <blockpin signalname="FineDataB(21)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell23">
            <attr value="X0Y22" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_85" name="Carry_In" />
            <blockpin signalname="XLXN_86" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(22)" name="FineDataA" />
            <blockpin signalname="FineDataB(22)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell25">
            <attr value="X0Y24" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_158" name="Carry_In" />
            <blockpin signalname="XLXN_112" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(24)" name="FineDataA" />
            <blockpin signalname="FineDataB(24)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell26">
            <attr value="X0Y25" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_112" name="Carry_In" />
            <blockpin signalname="XLXN_113" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(25)" name="FineDataA" />
            <blockpin signalname="FineDataB(25)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell27">
            <attr value="X0Y26" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_113" name="Carry_In" />
            <blockpin signalname="XLXN_114" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(26)" name="FineDataA" />
            <blockpin signalname="FineDataB(26)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell28">
            <attr value="X0Y27" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_114" name="Carry_In" />
            <blockpin signalname="XLXN_115" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(27)" name="FineDataA" />
            <blockpin signalname="FineDataB(27)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell29">
            <attr value="X0Y28" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_115" name="Carry_In" />
            <blockpin signalname="XLXN_116" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(28)" name="FineDataA" />
            <blockpin signalname="FineDataB(28)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell30">
            <attr value="X0Y29" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_116" name="Carry_In" />
            <blockpin signalname="XLXN_118" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(29)" name="FineDataA" />
            <blockpin signalname="FineDataB(29)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell31">
            <attr value="X0Y30" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_118" name="Carry_In" />
            <blockpin signalname="CarryChain_OLast" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(30)" name="FineDataA" />
            <blockpin signalname="FineDataB(30)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
        <block symbolname="TDCBasicCell" name="TDCCell32">
            <attr value="X0Y31" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="CarryChain_OLast" name="Carry_In" />
            <blockpin signalname="Carryline_End" name="Carry_Out" />
            <blockpin signalname="Clear" name="Clear" />
            <blockpin signalname="Enable" name="Enable" />
            <blockpin signalname="FineDataA(31)" name="FineDataA" />
            <blockpin signalname="FineDataB(31)" name="FineDataB" />
            <blockpin signalname="Save" name="Save" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="7609" height="5382">
        <attr value="CM" name="LengthUnitName" />
        <attr value="4" name="GridsPerUnit" />
        <instance x="368" y="512" name="TDCCell1" orien="R0">
        </instance>
        <branch name="FineDataB(0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="800" y="600" type="branch" />
            <wire x2="800" y1="352" y2="352" x1="752" />
            <wire x2="800" y1="352" y2="600" x1="800" />
            <wire x2="800" y1="600" y2="624" x1="800" />
        </branch>
        <instance x="864" y="512" name="TDCCell2" orien="R0">
        </instance>
        <branch name="Clock">
            <wire x2="368" y1="288" y2="288" x1="240" />
        </branch>
        <branch name="FineDataB(1)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1312" y="600" type="branch" />
            <wire x2="1312" y1="352" y2="352" x1="1248" />
            <wire x2="1312" y1="352" y2="600" x1="1312" />
            <wire x2="1312" y1="600" y2="624" x1="1312" />
        </branch>
        <instance x="1392" y="512" name="TDCCell3" orien="R0">
        </instance>
        <instance x="1968" y="512" name="TDCCell4" orien="R0">
        </instance>
        <branch name="XLXN_13">
            <wire x2="1392" y1="288" y2="288" x1="1248" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1968" y1="288" y2="288" x1="1776" />
        </branch>
        <branch name="FineDataB(2)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1824" y="600" type="branch" />
            <wire x2="1824" y1="352" y2="352" x1="1776" />
            <wire x2="1824" y1="352" y2="600" x1="1824" />
            <wire x2="1824" y1="600" y2="624" x1="1824" />
        </branch>
        <bustap x2="1824" y1="720" y2="624" x1="1824" />
        <bustap x2="1312" y1="720" y2="624" x1="1312" />
        <bustap x2="800" y1="720" y2="624" x1="800" />
        <branch name="FineDataB(3)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2416" y="584" type="branch" />
            <wire x2="2416" y1="352" y2="352" x1="2352" />
            <wire x2="2416" y1="352" y2="584" x1="2416" />
            <wire x2="2416" y1="584" y2="624" x1="2416" />
        </branch>
        <bustap x2="2416" y1="720" y2="624" x1="2416" />
        <iomarker fontsize="28" x="240" y="288" name="Clock" orien="R180" />
        <iomarker fontsize="28" x="224" y="128" name="Enable" orien="R180" />
        <iomarker fontsize="28" x="224" y="80" name="Clear" orien="R180" />
        <iomarker fontsize="28" x="224" y="32" name="Save" orien="R180" />
        <branch name="XLXN_26">
            <wire x2="2528" y1="288" y2="288" x1="2352" />
        </branch>
        <instance x="2528" y="512" name="TDCCell5" orien="R0">
        </instance>
        <instance x="3120" y="512" name="TDCCell6" orien="R0">
        </instance>
        <instance x="3728" y="512" name="TDCCell7" orien="R0">
        </instance>
        <instance x="4304" y="512" name="TDCCell8" orien="R0">
        </instance>
        <instance x="4896" y="512" name="TDCCell9" orien="R0">
        </instance>
        <instance x="5520" y="512" name="TDCCell10" orien="R0">
        </instance>
        <instance x="6096" y="512" name="TDCCell11" orien="R0">
        </instance>
        <instance x="6688" y="512" name="TDCCell12" orien="R0">
        </instance>
        <branch name="XLXN_30">
            <wire x2="3120" y1="288" y2="288" x1="2912" />
        </branch>
        <branch name="XLXN_31">
            <wire x2="3728" y1="288" y2="288" x1="3504" />
        </branch>
        <branch name="XLXN_32">
            <wire x2="4304" y1="288" y2="288" x1="4112" />
        </branch>
        <branch name="XLXN_33">
            <wire x2="4896" y1="288" y2="288" x1="4688" />
        </branch>
        <branch name="XLXN_34">
            <wire x2="5520" y1="288" y2="288" x1="5280" />
        </branch>
        <branch name="XLXN_35">
            <wire x2="6096" y1="288" y2="288" x1="5904" />
        </branch>
        <branch name="XLXN_36">
            <wire x2="6688" y1="288" y2="288" x1="6480" />
        </branch>
        <branch name="FineDataB(4)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2976" y="536" type="branch" />
            <wire x2="2976" y1="352" y2="352" x1="2912" />
            <wire x2="2976" y1="352" y2="536" x1="2976" />
            <wire x2="2976" y1="536" y2="624" x1="2976" />
        </branch>
        <branch name="FineDataB(5)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3568" y="536" type="branch" />
            <wire x2="3568" y1="352" y2="352" x1="3504" />
            <wire x2="3568" y1="352" y2="536" x1="3568" />
            <wire x2="3568" y1="536" y2="624" x1="3568" />
        </branch>
        <branch name="FineDataB(6)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4192" y="544" type="branch" />
            <wire x2="4192" y1="352" y2="352" x1="4112" />
            <wire x2="4192" y1="352" y2="544" x1="4192" />
            <wire x2="4192" y1="544" y2="624" x1="4192" />
        </branch>
        <branch name="FineDataB(7)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4768" y="544" type="branch" />
            <wire x2="4768" y1="352" y2="352" x1="4688" />
            <wire x2="4768" y1="352" y2="544" x1="4768" />
            <wire x2="4768" y1="544" y2="624" x1="4768" />
        </branch>
        <branch name="FineDataB(8)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5360" y="544" type="branch" />
            <wire x2="5360" y1="352" y2="352" x1="5280" />
            <wire x2="5360" y1="352" y2="544" x1="5360" />
            <wire x2="5360" y1="544" y2="624" x1="5360" />
        </branch>
        <branch name="FineDataB(9)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5952" y="544" type="branch" />
            <wire x2="5952" y1="352" y2="352" x1="5904" />
            <wire x2="5952" y1="352" y2="544" x1="5952" />
            <wire x2="5952" y1="544" y2="624" x1="5952" />
        </branch>
        <branch name="FineDataB(10)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6592" y="544" type="branch" />
            <wire x2="6592" y1="352" y2="352" x1="6480" />
            <wire x2="6592" y1="352" y2="544" x1="6592" />
            <wire x2="6592" y1="544" y2="624" x1="6592" />
        </branch>
        <branch name="FineDataB(11)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="7152" y="544" type="branch" />
            <wire x2="7152" y1="352" y2="352" x1="7072" />
            <wire x2="7152" y1="352" y2="544" x1="7152" />
            <wire x2="7152" y1="544" y2="624" x1="7152" />
        </branch>
        <bustap x2="2976" y1="720" y2="624" x1="2976" />
        <bustap x2="3568" y1="720" y2="624" x1="3568" />
        <bustap x2="4192" y1="720" y2="624" x1="4192" />
        <bustap x2="4768" y1="720" y2="624" x1="4768" />
        <bustap x2="7152" y1="720" y2="624" x1="7152" />
        <bustap x2="6592" y1="720" y2="624" x1="6592" />
        <bustap x2="5952" y1="720" y2="624" x1="5952" />
        <bustap x2="5360" y1="720" y2="624" x1="5360" />
        <instance x="576" y="1216" name="TDCCell13" orien="R0">
        </instance>
        <instance x="1072" y="1216" name="TDCCell14" orien="R0">
        </instance>
        <instance x="1600" y="1216" name="TDCCell15" orien="R0">
        </instance>
        <instance x="2176" y="1216" name="TDCCell16" orien="R0">
        </instance>
        <instance x="2736" y="1216" name="TDCCell17" orien="R0">
        </instance>
        <instance x="3328" y="1216" name="TDCCell18" orien="R0">
        </instance>
        <instance x="3936" y="1216" name="TDCCell19" orien="R0">
        </instance>
        <instance x="4512" y="1216" name="TDCCell20" orien="R0">
        </instance>
        <branch name="XLXN_75">
            <wire x2="4512" y1="992" y2="992" x1="4320" />
        </branch>
        <branch name="XLXN_76">
            <wire x2="3936" y1="992" y2="992" x1="3712" />
        </branch>
        <branch name="XLXN_77">
            <wire x2="3328" y1="992" y2="992" x1="3120" />
        </branch>
        <branch name="XLXN_78">
            <wire x2="2736" y1="992" y2="992" x1="2560" />
        </branch>
        <branch name="XLXN_79">
            <wire x2="2176" y1="992" y2="992" x1="1984" />
        </branch>
        <branch name="XLXN_80">
            <wire x2="1600" y1="992" y2="992" x1="1456" />
        </branch>
        <branch name="XLXN_81">
            <wire x2="1072" y1="992" y2="992" x1="960" />
        </branch>
        <branch name="FineDataB(12)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1008" y="896" type="branch" />
            <wire x2="1008" y1="1056" y2="1056" x1="960" />
            <wire x2="1008" y1="816" y2="896" x1="1008" />
            <wire x2="1008" y1="896" y2="1056" x1="1008" />
        </branch>
        <branch name="FineDataB(13)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1504" y="896" type="branch" />
            <wire x2="1504" y1="1056" y2="1056" x1="1456" />
            <wire x2="1504" y1="816" y2="896" x1="1504" />
            <wire x2="1504" y1="896" y2="1056" x1="1504" />
        </branch>
        <branch name="FineDataB(14)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2032" y="896" type="branch" />
            <wire x2="2032" y1="1056" y2="1056" x1="1984" />
            <wire x2="2032" y1="816" y2="896" x1="2032" />
            <wire x2="2032" y1="896" y2="1056" x1="2032" />
        </branch>
        <branch name="FineDataB(15)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2608" y="896" type="branch" />
            <wire x2="2608" y1="1056" y2="1056" x1="2560" />
            <wire x2="2608" y1="816" y2="896" x1="2608" />
            <wire x2="2608" y1="896" y2="1056" x1="2608" />
        </branch>
        <branch name="FineDataB(16)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3168" y="896" type="branch" />
            <wire x2="3168" y1="1056" y2="1056" x1="3120" />
            <wire x2="3168" y1="816" y2="896" x1="3168" />
            <wire x2="3168" y1="896" y2="1056" x1="3168" />
        </branch>
        <branch name="FineDataB(17)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3760" y="896" type="branch" />
            <wire x2="3760" y1="1056" y2="1056" x1="3712" />
            <wire x2="3760" y1="816" y2="896" x1="3760" />
            <wire x2="3760" y1="896" y2="1056" x1="3760" />
        </branch>
        <branch name="FineDataB(18)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4368" y="896" type="branch" />
            <wire x2="4368" y1="1056" y2="1056" x1="4320" />
            <wire x2="4368" y1="816" y2="896" x1="4368" />
            <wire x2="4368" y1="896" y2="1056" x1="4368" />
        </branch>
        <branch name="FineDataB(19)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4976" y="896" type="branch" />
            <wire x2="4976" y1="1056" y2="1056" x1="4896" />
            <wire x2="4976" y1="816" y2="896" x1="4976" />
            <wire x2="4976" y1="896" y2="1056" x1="4976" />
        </branch>
        <branch name="XLXN_82">
            <wire x2="528" y1="560" y2="992" x1="528" />
            <wire x2="576" y1="992" y2="992" x1="528" />
            <wire x2="7088" y1="560" y2="560" x1="528" />
            <wire x2="7088" y1="288" y2="288" x1="7072" />
            <wire x2="7088" y1="288" y2="560" x1="7088" />
        </branch>
        <bustap x2="4976" y1="720" y2="816" x1="4976" />
        <bustap x2="4368" y1="720" y2="816" x1="4368" />
        <bustap x2="3760" y1="720" y2="816" x1="3760" />
        <bustap x2="3168" y1="720" y2="816" x1="3168" />
        <bustap x2="2608" y1="720" y2="816" x1="2608" />
        <bustap x2="2032" y1="720" y2="816" x1="2032" />
        <bustap x2="1504" y1="720" y2="816" x1="1504" />
        <bustap x2="1008" y1="720" y2="816" x1="1008" />
        <instance x="5120" y="1216" name="TDCCell21" orien="R0">
        </instance>
        <instance x="5776" y="1216" name="TDCCell22" orien="R0">
        </instance>
        <branch name="XLXN_84">
            <wire x2="5776" y1="992" y2="992" x1="5504" />
        </branch>
        <branch name="XLXN_85">
            <wire x2="6400" y1="992" y2="992" x1="6160" />
        </branch>
        <branch name="XLXN_86">
            <wire x2="6992" y1="992" y2="992" x1="6784" />
        </branch>
        <instance x="6400" y="1216" name="TDCCell23" orien="R0">
        </instance>
        <instance x="6992" y="1216" name="TDCCell24" orien="R0">
        </instance>
        <branch name="FineDataB(20)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5568" y="928" type="branch" />
            <wire x2="5568" y1="1056" y2="1056" x1="5504" />
            <wire x2="5568" y1="816" y2="928" x1="5568" />
            <wire x2="5568" y1="928" y2="1056" x1="5568" />
        </branch>
        <branch name="FineDataB(21)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6240" y="928" type="branch" />
            <wire x2="6240" y1="1056" y2="1056" x1="6160" />
            <wire x2="6240" y1="816" y2="928" x1="6240" />
            <wire x2="6240" y1="928" y2="1056" x1="6240" />
        </branch>
        <branch name="FineDataB(22)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6864" y="928" type="branch" />
            <wire x2="6864" y1="1056" y2="1056" x1="6784" />
            <wire x2="6864" y1="816" y2="928" x1="6864" />
            <wire x2="6864" y1="928" y2="1056" x1="6864" />
        </branch>
        <branch name="FineDataB(23)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="7440" y="928" type="branch" />
            <wire x2="7440" y1="1056" y2="1056" x1="7376" />
            <wire x2="7440" y1="816" y2="928" x1="7440" />
            <wire x2="7440" y1="928" y2="1056" x1="7440" />
        </branch>
        <bustap x2="7440" y1="720" y2="816" x1="7440" />
        <bustap x2="6864" y1="720" y2="816" x1="6864" />
        <bustap x2="6240" y1="720" y2="816" x1="6240" />
        <bustap x2="5568" y1="720" y2="816" x1="5568" />
        <branch name="XLXN_110">
            <wire x2="5120" y1="992" y2="992" x1="4896" />
        </branch>
        <branch name="Enable">
            <wire x2="288" y1="128" y2="128" x1="224" />
            <wire x2="288" y1="128" y2="352" x1="288" />
            <wire x2="368" y1="352" y2="352" x1="288" />
            <wire x2="288" y1="352" y2="1328" x1="288" />
            <wire x2="528" y1="1328" y2="1328" x1="288" />
            <wire x2="960" y1="1328" y2="1328" x1="528" />
            <wire x2="1024" y1="1328" y2="1328" x1="960" />
            <wire x2="1536" y1="1328" y2="1328" x1="1024" />
            <wire x2="1552" y1="1328" y2="1328" x1="1536" />
            <wire x2="2128" y1="1328" y2="1328" x1="1552" />
            <wire x2="2176" y1="1328" y2="1328" x1="2128" />
            <wire x2="2688" y1="1328" y2="1328" x1="2176" />
            <wire x2="2848" y1="1328" y2="1328" x1="2688" />
            <wire x2="3280" y1="1328" y2="1328" x1="2848" />
            <wire x2="3536" y1="1328" y2="1328" x1="3280" />
            <wire x2="3888" y1="1328" y2="1328" x1="3536" />
            <wire x2="4176" y1="1328" y2="1328" x1="3888" />
            <wire x2="4464" y1="1328" y2="1328" x1="4176" />
            <wire x2="4832" y1="1328" y2="1328" x1="4464" />
            <wire x2="5072" y1="1328" y2="1328" x1="4832" />
            <wire x2="5728" y1="1328" y2="1328" x1="5072" />
            <wire x2="6352" y1="1328" y2="1328" x1="5728" />
            <wire x2="6944" y1="1328" y2="1328" x1="6352" />
            <wire x2="4832" y1="1328" y2="1760" x1="4832" />
            <wire x2="4880" y1="1760" y2="1760" x1="4832" />
            <wire x2="4176" y1="1328" y2="1760" x1="4176" />
            <wire x2="4224" y1="1760" y2="1760" x1="4176" />
            <wire x2="3536" y1="1328" y2="1760" x1="3536" />
            <wire x2="3584" y1="1760" y2="1760" x1="3536" />
            <wire x2="2848" y1="1328" y2="1760" x1="2848" />
            <wire x2="2896" y1="1760" y2="1760" x1="2848" />
            <wire x2="2176" y1="1328" y2="1760" x1="2176" />
            <wire x2="2224" y1="1760" y2="1760" x1="2176" />
            <wire x2="1536" y1="1328" y2="1760" x1="1536" />
            <wire x2="1584" y1="1760" y2="1760" x1="1536" />
            <wire x2="960" y1="1328" y2="1760" x1="960" />
            <wire x2="1008" y1="1760" y2="1760" x1="960" />
            <wire x2="288" y1="1328" y2="1760" x1="288" />
            <wire x2="368" y1="1760" y2="1760" x1="288" />
            <wire x2="816" y1="128" y2="128" x1="288" />
            <wire x2="816" y1="128" y2="352" x1="816" />
            <wire x2="864" y1="352" y2="352" x1="816" />
            <wire x2="1344" y1="128" y2="128" x1="816" />
            <wire x2="1840" y1="128" y2="128" x1="1344" />
            <wire x2="1840" y1="128" y2="352" x1="1840" />
            <wire x2="1968" y1="352" y2="352" x1="1840" />
            <wire x2="2464" y1="128" y2="128" x1="1840" />
            <wire x2="2464" y1="128" y2="352" x1="2464" />
            <wire x2="2528" y1="352" y2="352" x1="2464" />
            <wire x2="3056" y1="128" y2="128" x1="2464" />
            <wire x2="3056" y1="128" y2="352" x1="3056" />
            <wire x2="3120" y1="352" y2="352" x1="3056" />
            <wire x2="3664" y1="128" y2="128" x1="3056" />
            <wire x2="3664" y1="128" y2="352" x1="3664" />
            <wire x2="3728" y1="352" y2="352" x1="3664" />
            <wire x2="4256" y1="128" y2="128" x1="3664" />
            <wire x2="4256" y1="128" y2="352" x1="4256" />
            <wire x2="4304" y1="352" y2="352" x1="4256" />
            <wire x2="4848" y1="128" y2="128" x1="4256" />
            <wire x2="4848" y1="128" y2="352" x1="4848" />
            <wire x2="4896" y1="352" y2="352" x1="4848" />
            <wire x2="5472" y1="128" y2="128" x1="4848" />
            <wire x2="5472" y1="128" y2="352" x1="5472" />
            <wire x2="5520" y1="352" y2="352" x1="5472" />
            <wire x2="6032" y1="128" y2="128" x1="5472" />
            <wire x2="6032" y1="128" y2="352" x1="6032" />
            <wire x2="6096" y1="352" y2="352" x1="6032" />
            <wire x2="6624" y1="128" y2="128" x1="6032" />
            <wire x2="6624" y1="128" y2="352" x1="6624" />
            <wire x2="6688" y1="352" y2="352" x1="6624" />
            <wire x2="1344" y1="128" y2="352" x1="1344" />
            <wire x2="1392" y1="352" y2="352" x1="1344" />
            <wire x2="576" y1="1056" y2="1056" x1="528" />
            <wire x2="528" y1="1056" y2="1328" x1="528" />
            <wire x2="1072" y1="1056" y2="1056" x1="1024" />
            <wire x2="1024" y1="1056" y2="1328" x1="1024" />
            <wire x2="1600" y1="1056" y2="1056" x1="1552" />
            <wire x2="1552" y1="1056" y2="1328" x1="1552" />
            <wire x2="2176" y1="1056" y2="1056" x1="2128" />
            <wire x2="2128" y1="1056" y2="1328" x1="2128" />
            <wire x2="2736" y1="1056" y2="1056" x1="2688" />
            <wire x2="2688" y1="1056" y2="1328" x1="2688" />
            <wire x2="3328" y1="1056" y2="1056" x1="3280" />
            <wire x2="3280" y1="1056" y2="1328" x1="3280" />
            <wire x2="3936" y1="1056" y2="1056" x1="3888" />
            <wire x2="3888" y1="1056" y2="1328" x1="3888" />
            <wire x2="4512" y1="1056" y2="1056" x1="4464" />
            <wire x2="4464" y1="1056" y2="1328" x1="4464" />
            <wire x2="5120" y1="1056" y2="1056" x1="5072" />
            <wire x2="5072" y1="1056" y2="1328" x1="5072" />
            <wire x2="5776" y1="1056" y2="1056" x1="5728" />
            <wire x2="5728" y1="1056" y2="1328" x1="5728" />
            <wire x2="6400" y1="1056" y2="1056" x1="6352" />
            <wire x2="6352" y1="1056" y2="1328" x1="6352" />
            <wire x2="6992" y1="1056" y2="1056" x1="6944" />
            <wire x2="6944" y1="1056" y2="1328" x1="6944" />
        </branch>
        <branch name="Save">
            <wire x2="320" y1="32" y2="32" x1="224" />
            <wire x2="320" y1="32" y2="416" x1="320" />
            <wire x2="368" y1="416" y2="416" x1="320" />
            <wire x2="320" y1="416" y2="1344" x1="320" />
            <wire x2="320" y1="1344" y2="1824" x1="320" />
            <wire x2="368" y1="1824" y2="1824" x1="320" />
            <wire x2="544" y1="1344" y2="1344" x1="320" />
            <wire x2="976" y1="1344" y2="1344" x1="544" />
            <wire x2="1040" y1="1344" y2="1344" x1="976" />
            <wire x2="1552" y1="1344" y2="1344" x1="1040" />
            <wire x2="1568" y1="1344" y2="1344" x1="1552" />
            <wire x2="2144" y1="1344" y2="1344" x1="1568" />
            <wire x2="2192" y1="1344" y2="1344" x1="2144" />
            <wire x2="2704" y1="1344" y2="1344" x1="2192" />
            <wire x2="2864" y1="1344" y2="1344" x1="2704" />
            <wire x2="3296" y1="1344" y2="1344" x1="2864" />
            <wire x2="3552" y1="1344" y2="1344" x1="3296" />
            <wire x2="3904" y1="1344" y2="1344" x1="3552" />
            <wire x2="4192" y1="1344" y2="1344" x1="3904" />
            <wire x2="4480" y1="1344" y2="1344" x1="4192" />
            <wire x2="4848" y1="1344" y2="1344" x1="4480" />
            <wire x2="5088" y1="1344" y2="1344" x1="4848" />
            <wire x2="5744" y1="1344" y2="1344" x1="5088" />
            <wire x2="6368" y1="1344" y2="1344" x1="5744" />
            <wire x2="6960" y1="1344" y2="1344" x1="6368" />
            <wire x2="4848" y1="1344" y2="1824" x1="4848" />
            <wire x2="4880" y1="1824" y2="1824" x1="4848" />
            <wire x2="4192" y1="1344" y2="1824" x1="4192" />
            <wire x2="4224" y1="1824" y2="1824" x1="4192" />
            <wire x2="3552" y1="1344" y2="1824" x1="3552" />
            <wire x2="3584" y1="1824" y2="1824" x1="3552" />
            <wire x2="2864" y1="1344" y2="1824" x1="2864" />
            <wire x2="2896" y1="1824" y2="1824" x1="2864" />
            <wire x2="2192" y1="1344" y2="1824" x1="2192" />
            <wire x2="2224" y1="1824" y2="1824" x1="2192" />
            <wire x2="1552" y1="1344" y2="1824" x1="1552" />
            <wire x2="1584" y1="1824" y2="1824" x1="1552" />
            <wire x2="976" y1="1344" y2="1824" x1="976" />
            <wire x2="1008" y1="1824" y2="1824" x1="976" />
            <wire x2="848" y1="32" y2="32" x1="320" />
            <wire x2="848" y1="32" y2="416" x1="848" />
            <wire x2="864" y1="416" y2="416" x1="848" />
            <wire x2="1376" y1="32" y2="32" x1="848" />
            <wire x2="1376" y1="32" y2="416" x1="1376" />
            <wire x2="1392" y1="416" y2="416" x1="1376" />
            <wire x2="1936" y1="32" y2="32" x1="1376" />
            <wire x2="1936" y1="32" y2="416" x1="1936" />
            <wire x2="1968" y1="416" y2="416" x1="1936" />
            <wire x2="2496" y1="32" y2="32" x1="1936" />
            <wire x2="2496" y1="32" y2="416" x1="2496" />
            <wire x2="2528" y1="416" y2="416" x1="2496" />
            <wire x2="3088" y1="32" y2="32" x1="2496" />
            <wire x2="3088" y1="32" y2="416" x1="3088" />
            <wire x2="3120" y1="416" y2="416" x1="3088" />
            <wire x2="3696" y1="32" y2="32" x1="3088" />
            <wire x2="3696" y1="32" y2="416" x1="3696" />
            <wire x2="3728" y1="416" y2="416" x1="3696" />
            <wire x2="4288" y1="32" y2="32" x1="3696" />
            <wire x2="4288" y1="32" y2="416" x1="4288" />
            <wire x2="4304" y1="416" y2="416" x1="4288" />
            <wire x2="4880" y1="32" y2="32" x1="4288" />
            <wire x2="4880" y1="32" y2="416" x1="4880" />
            <wire x2="4896" y1="416" y2="416" x1="4880" />
            <wire x2="5504" y1="32" y2="32" x1="4880" />
            <wire x2="5504" y1="32" y2="416" x1="5504" />
            <wire x2="5520" y1="416" y2="416" x1="5504" />
            <wire x2="6064" y1="32" y2="32" x1="5504" />
            <wire x2="6064" y1="32" y2="416" x1="6064" />
            <wire x2="6096" y1="416" y2="416" x1="6064" />
            <wire x2="6656" y1="32" y2="32" x1="6064" />
            <wire x2="6656" y1="32" y2="416" x1="6656" />
            <wire x2="6688" y1="416" y2="416" x1="6656" />
            <wire x2="576" y1="1120" y2="1120" x1="544" />
            <wire x2="544" y1="1120" y2="1344" x1="544" />
            <wire x2="1072" y1="1120" y2="1120" x1="1040" />
            <wire x2="1040" y1="1120" y2="1344" x1="1040" />
            <wire x2="1600" y1="1120" y2="1120" x1="1568" />
            <wire x2="1568" y1="1120" y2="1344" x1="1568" />
            <wire x2="2176" y1="1120" y2="1120" x1="2144" />
            <wire x2="2144" y1="1120" y2="1344" x1="2144" />
            <wire x2="2736" y1="1120" y2="1120" x1="2704" />
            <wire x2="2704" y1="1120" y2="1344" x1="2704" />
            <wire x2="3328" y1="1120" y2="1120" x1="3296" />
            <wire x2="3296" y1="1120" y2="1344" x1="3296" />
            <wire x2="3936" y1="1120" y2="1120" x1="3904" />
            <wire x2="3904" y1="1120" y2="1344" x1="3904" />
            <wire x2="4512" y1="1120" y2="1120" x1="4480" />
            <wire x2="4480" y1="1120" y2="1344" x1="4480" />
            <wire x2="5120" y1="1120" y2="1120" x1="5088" />
            <wire x2="5088" y1="1120" y2="1344" x1="5088" />
            <wire x2="5776" y1="1120" y2="1120" x1="5744" />
            <wire x2="5744" y1="1120" y2="1344" x1="5744" />
            <wire x2="6400" y1="1120" y2="1120" x1="6368" />
            <wire x2="6368" y1="1120" y2="1344" x1="6368" />
            <wire x2="6992" y1="1120" y2="1120" x1="6960" />
            <wire x2="6960" y1="1120" y2="1344" x1="6960" />
        </branch>
        <branch name="Clear">
            <wire x2="304" y1="80" y2="80" x1="224" />
            <wire x2="304" y1="80" y2="480" x1="304" />
            <wire x2="368" y1="480" y2="480" x1="304" />
            <wire x2="304" y1="480" y2="1360" x1="304" />
            <wire x2="352" y1="1360" y2="1360" x1="304" />
            <wire x2="560" y1="1360" y2="1360" x1="352" />
            <wire x2="992" y1="1360" y2="1360" x1="560" />
            <wire x2="1056" y1="1360" y2="1360" x1="992" />
            <wire x2="1568" y1="1360" y2="1360" x1="1056" />
            <wire x2="1584" y1="1360" y2="1360" x1="1568" />
            <wire x2="2160" y1="1360" y2="1360" x1="1584" />
            <wire x2="2208" y1="1360" y2="1360" x1="2160" />
            <wire x2="2720" y1="1360" y2="1360" x1="2208" />
            <wire x2="2880" y1="1360" y2="1360" x1="2720" />
            <wire x2="3312" y1="1360" y2="1360" x1="2880" />
            <wire x2="3568" y1="1360" y2="1360" x1="3312" />
            <wire x2="3920" y1="1360" y2="1360" x1="3568" />
            <wire x2="4208" y1="1360" y2="1360" x1="3920" />
            <wire x2="4496" y1="1360" y2="1360" x1="4208" />
            <wire x2="4864" y1="1360" y2="1360" x1="4496" />
            <wire x2="5104" y1="1360" y2="1360" x1="4864" />
            <wire x2="5760" y1="1360" y2="1360" x1="5104" />
            <wire x2="6384" y1="1360" y2="1360" x1="5760" />
            <wire x2="6976" y1="1360" y2="1360" x1="6384" />
            <wire x2="4864" y1="1360" y2="1888" x1="4864" />
            <wire x2="4880" y1="1888" y2="1888" x1="4864" />
            <wire x2="4208" y1="1360" y2="1888" x1="4208" />
            <wire x2="4224" y1="1888" y2="1888" x1="4208" />
            <wire x2="3568" y1="1360" y2="1888" x1="3568" />
            <wire x2="3584" y1="1888" y2="1888" x1="3568" />
            <wire x2="2880" y1="1360" y2="1888" x1="2880" />
            <wire x2="2896" y1="1888" y2="1888" x1="2880" />
            <wire x2="2208" y1="1360" y2="1888" x1="2208" />
            <wire x2="2224" y1="1888" y2="1888" x1="2208" />
            <wire x2="1568" y1="1360" y2="1888" x1="1568" />
            <wire x2="1584" y1="1888" y2="1888" x1="1568" />
            <wire x2="992" y1="1360" y2="1888" x1="992" />
            <wire x2="1008" y1="1888" y2="1888" x1="992" />
            <wire x2="352" y1="1360" y2="1888" x1="352" />
            <wire x2="368" y1="1888" y2="1888" x1="352" />
            <wire x2="832" y1="80" y2="80" x1="304" />
            <wire x2="832" y1="80" y2="480" x1="832" />
            <wire x2="864" y1="480" y2="480" x1="832" />
            <wire x2="1360" y1="80" y2="80" x1="832" />
            <wire x2="1360" y1="80" y2="480" x1="1360" />
            <wire x2="1392" y1="480" y2="480" x1="1360" />
            <wire x2="1888" y1="80" y2="80" x1="1360" />
            <wire x2="1888" y1="80" y2="480" x1="1888" />
            <wire x2="1968" y1="480" y2="480" x1="1888" />
            <wire x2="2480" y1="80" y2="80" x1="1888" />
            <wire x2="2480" y1="80" y2="480" x1="2480" />
            <wire x2="2528" y1="480" y2="480" x1="2480" />
            <wire x2="3072" y1="80" y2="80" x1="2480" />
            <wire x2="3072" y1="80" y2="480" x1="3072" />
            <wire x2="3120" y1="480" y2="480" x1="3072" />
            <wire x2="3680" y1="80" y2="80" x1="3072" />
            <wire x2="3680" y1="80" y2="480" x1="3680" />
            <wire x2="3728" y1="480" y2="480" x1="3680" />
            <wire x2="4272" y1="80" y2="80" x1="3680" />
            <wire x2="4272" y1="80" y2="480" x1="4272" />
            <wire x2="4304" y1="480" y2="480" x1="4272" />
            <wire x2="4864" y1="80" y2="80" x1="4272" />
            <wire x2="4864" y1="80" y2="480" x1="4864" />
            <wire x2="4896" y1="480" y2="480" x1="4864" />
            <wire x2="5488" y1="80" y2="80" x1="4864" />
            <wire x2="5488" y1="80" y2="480" x1="5488" />
            <wire x2="5520" y1="480" y2="480" x1="5488" />
            <wire x2="6048" y1="80" y2="80" x1="5488" />
            <wire x2="6048" y1="80" y2="480" x1="6048" />
            <wire x2="6096" y1="480" y2="480" x1="6048" />
            <wire x2="6640" y1="80" y2="80" x1="6048" />
            <wire x2="6640" y1="80" y2="480" x1="6640" />
            <wire x2="6688" y1="480" y2="480" x1="6640" />
            <wire x2="576" y1="1184" y2="1184" x1="560" />
            <wire x2="560" y1="1184" y2="1360" x1="560" />
            <wire x2="1072" y1="1184" y2="1184" x1="1056" />
            <wire x2="1056" y1="1184" y2="1360" x1="1056" />
            <wire x2="1600" y1="1184" y2="1184" x1="1584" />
            <wire x2="1584" y1="1184" y2="1360" x1="1584" />
            <wire x2="2176" y1="1184" y2="1184" x1="2160" />
            <wire x2="2160" y1="1184" y2="1360" x1="2160" />
            <wire x2="2736" y1="1184" y2="1184" x1="2720" />
            <wire x2="2720" y1="1184" y2="1360" x1="2720" />
            <wire x2="3328" y1="1184" y2="1184" x1="3312" />
            <wire x2="3312" y1="1184" y2="1360" x1="3312" />
            <wire x2="3936" y1="1184" y2="1184" x1="3920" />
            <wire x2="3920" y1="1184" y2="1360" x1="3920" />
            <wire x2="4512" y1="1184" y2="1184" x1="4496" />
            <wire x2="4496" y1="1184" y2="1360" x1="4496" />
            <wire x2="5120" y1="1184" y2="1184" x1="5104" />
            <wire x2="5104" y1="1184" y2="1360" x1="5104" />
            <wire x2="5776" y1="1184" y2="1184" x1="5760" />
            <wire x2="5760" y1="1184" y2="1360" x1="5760" />
            <wire x2="6400" y1="1184" y2="1184" x1="6384" />
            <wire x2="6384" y1="1184" y2="1360" x1="6384" />
            <wire x2="6992" y1="1184" y2="1184" x1="6976" />
            <wire x2="6976" y1="1184" y2="1360" x1="6976" />
        </branch>
        <instance x="368" y="1920" name="TDCCell25" orien="R0">
        </instance>
        <instance x="1008" y="1920" name="TDCCell26" orien="R0">
        </instance>
        <instance x="1584" y="1920" name="TDCCell27" orien="R0">
        </instance>
        <instance x="2224" y="1920" name="TDCCell28" orien="R0">
        </instance>
        <instance x="2896" y="1920" name="TDCCell29" orien="R0">
        </instance>
        <instance x="3584" y="1920" name="TDCCell30" orien="R0">
        </instance>
        <instance x="4224" y="1920" name="TDCCell31" orien="R0">
        </instance>
        <instance x="4880" y="1920" name="TDCCell32" orien="R0">
        </instance>
        <iomarker fontsize="28" x="352" y="2160" name="FineDataB(31:0)" orien="R180" />
        <branch name="XLXN_112">
            <wire x2="1008" y1="1696" y2="1696" x1="752" />
        </branch>
        <branch name="XLXN_113">
            <wire x2="1584" y1="1696" y2="1696" x1="1392" />
        </branch>
        <branch name="XLXN_114">
            <wire x2="2224" y1="1696" y2="1696" x1="1968" />
        </branch>
        <branch name="XLXN_115">
            <wire x2="2896" y1="1696" y2="1696" x1="2608" />
        </branch>
        <branch name="XLXN_116">
            <wire x2="3584" y1="1696" y2="1696" x1="3280" />
        </branch>
        <branch name="XLXN_118">
            <wire x2="4224" y1="1696" y2="1696" x1="3968" />
        </branch>
        <branch name="FineDataB(24)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="816" y="1952" type="branch" />
            <wire x2="816" y1="1760" y2="1760" x1="752" />
            <wire x2="816" y1="1760" y2="1952" x1="816" />
            <wire x2="816" y1="1952" y2="2064" x1="816" />
        </branch>
        <branch name="FineDataB(25)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1456" y="1952" type="branch" />
            <wire x2="1456" y1="1760" y2="1760" x1="1392" />
            <wire x2="1456" y1="1760" y2="1952" x1="1456" />
            <wire x2="1456" y1="1952" y2="2064" x1="1456" />
        </branch>
        <branch name="FineDataB(26)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2032" y="1952" type="branch" />
            <wire x2="2032" y1="1760" y2="1760" x1="1968" />
            <wire x2="2032" y1="1760" y2="1952" x1="2032" />
            <wire x2="2032" y1="1952" y2="2064" x1="2032" />
        </branch>
        <branch name="FineDataB(27)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2704" y="1952" type="branch" />
            <wire x2="2704" y1="1760" y2="1760" x1="2608" />
            <wire x2="2704" y1="1760" y2="1952" x1="2704" />
            <wire x2="2704" y1="1952" y2="2064" x1="2704" />
        </branch>
        <branch name="FineDataB(28)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3360" y="1952" type="branch" />
            <wire x2="3360" y1="1760" y2="1760" x1="3280" />
            <wire x2="3360" y1="1760" y2="1952" x1="3360" />
            <wire x2="3360" y1="1952" y2="2064" x1="3360" />
        </branch>
        <branch name="FineDataB(29)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4048" y="1952" type="branch" />
            <wire x2="4048" y1="1760" y2="1760" x1="3968" />
            <wire x2="4048" y1="1760" y2="1952" x1="4048" />
            <wire x2="4048" y1="1952" y2="2064" x1="4048" />
        </branch>
        <branch name="FineDataB(31)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5360" y="1952" type="branch" />
            <wire x2="5360" y1="1760" y2="1760" x1="5264" />
            <wire x2="5360" y1="1760" y2="1952" x1="5360" />
            <wire x2="5360" y1="1952" y2="2064" x1="5360" />
        </branch>
        <branch name="Carryline_End">
            <wire x2="5568" y1="1696" y2="1696" x1="5264" />
        </branch>
        <iomarker fontsize="28" x="5568" y="1696" name="Carryline_End" orien="R0" />
        <branch name="XLXN_158">
            <wire x2="160" y1="1424" y2="1696" x1="160" />
            <wire x2="368" y1="1696" y2="1696" x1="160" />
            <wire x2="7456" y1="1424" y2="1424" x1="160" />
            <wire x2="7456" y1="992" y2="992" x1="7376" />
            <wire x2="7456" y1="992" y2="1424" x1="7456" />
        </branch>
        <bustap x2="5360" y1="2160" y2="2064" x1="5360" />
        <branch name="FineDataB(30)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4672" y="1952" type="branch" />
            <wire x2="4672" y1="1760" y2="1760" x1="4608" />
            <wire x2="4672" y1="1760" y2="1952" x1="4672" />
            <wire x2="4672" y1="1952" y2="2064" x1="4672" />
        </branch>
        <bustap x2="4672" y1="2160" y2="2064" x1="4672" />
        <bustap x2="4048" y1="2160" y2="2064" x1="4048" />
        <bustap x2="3360" y1="2160" y2="2064" x1="3360" />
        <bustap x2="2704" y1="2160" y2="2064" x1="2704" />
        <bustap x2="2032" y1="2160" y2="2064" x1="2032" />
        <bustap x2="1456" y1="2160" y2="2064" x1="1456" />
        <bustap x2="816" y1="2160" y2="2064" x1="816" />
        <branch name="FineDataB(31:0)">
            <wire x2="816" y1="2160" y2="2160" x1="352" />
            <wire x2="1456" y1="2160" y2="2160" x1="816" />
            <wire x2="2032" y1="2160" y2="2160" x1="1456" />
            <wire x2="2704" y1="2160" y2="2160" x1="2032" />
            <wire x2="3360" y1="2160" y2="2160" x1="2704" />
            <wire x2="4048" y1="2160" y2="2160" x1="3360" />
            <wire x2="4672" y1="2160" y2="2160" x1="4048" />
            <wire x2="5360" y1="2160" y2="2160" x1="4672" />
            <wire x2="7520" y1="2160" y2="2160" x1="5360" />
            <wire x2="1008" y1="720" y2="720" x1="800" />
            <wire x2="1312" y1="720" y2="720" x1="1008" />
            <wire x2="1504" y1="720" y2="720" x1="1312" />
            <wire x2="1824" y1="720" y2="720" x1="1504" />
            <wire x2="2032" y1="720" y2="720" x1="1824" />
            <wire x2="2416" y1="720" y2="720" x1="2032" />
            <wire x2="2608" y1="720" y2="720" x1="2416" />
            <wire x2="2976" y1="720" y2="720" x1="2608" />
            <wire x2="3168" y1="720" y2="720" x1="2976" />
            <wire x2="3568" y1="720" y2="720" x1="3168" />
            <wire x2="3760" y1="720" y2="720" x1="3568" />
            <wire x2="4192" y1="720" y2="720" x1="3760" />
            <wire x2="4368" y1="720" y2="720" x1="4192" />
            <wire x2="4768" y1="720" y2="720" x1="4368" />
            <wire x2="4976" y1="720" y2="720" x1="4768" />
            <wire x2="5360" y1="720" y2="720" x1="4976" />
            <wire x2="5568" y1="720" y2="720" x1="5360" />
            <wire x2="5952" y1="720" y2="720" x1="5568" />
            <wire x2="6240" y1="720" y2="720" x1="5952" />
            <wire x2="6592" y1="720" y2="720" x1="6240" />
            <wire x2="6864" y1="720" y2="720" x1="6592" />
            <wire x2="7152" y1="720" y2="720" x1="6864" />
            <wire x2="7440" y1="720" y2="720" x1="7152" />
            <wire x2="7520" y1="720" y2="720" x1="7440" />
            <wire x2="7520" y1="720" y2="2160" x1="7520" />
        </branch>
        <branch name="CarryChain_O1">
            <wire x2="864" y1="288" y2="288" x1="752" />
        </branch>
        <branch name="CarryChain_OLast">
            <wire x2="4880" y1="1696" y2="1696" x1="4608" />
        </branch>
        <branch name="FineDataA(1)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1280" y="520" type="branch" />
            <wire x2="1280" y1="416" y2="416" x1="1248" />
            <wire x2="1280" y1="416" y2="520" x1="1280" />
            <wire x2="1280" y1="520" y2="576" x1="1280" />
        </branch>
        <branch name="FineDataA(2)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1792" y="520" type="branch" />
            <wire x2="1792" y1="416" y2="416" x1="1776" />
            <wire x2="1792" y1="416" y2="520" x1="1792" />
            <wire x2="1792" y1="520" y2="576" x1="1792" />
        </branch>
        <bustap x2="1280" y1="672" y2="576" x1="1280" />
        <bustap x2="1792" y1="672" y2="576" x1="1792" />
        <bustap x2="2352" y1="672" y2="576" x1="2352" />
        <branch name="FineDataA(3)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2352" y="496" type="branch" />
            <wire x2="2352" y1="416" y2="496" x1="2352" />
            <wire x2="2352" y1="496" y2="576" x1="2352" />
        </branch>
        <bustap x2="752" y1="672" y2="576" x1="752" />
        <branch name="FineDataA(0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="752" y="496" type="branch" />
            <wire x2="752" y1="416" y2="496" x1="752" />
            <wire x2="752" y1="496" y2="576" x1="752" />
        </branch>
        <branch name="FineDataA(31:0)">
            <wire x2="752" y1="2192" y2="2192" x1="352" />
            <wire x2="1392" y1="2192" y2="2192" x1="752" />
            <wire x2="1968" y1="2192" y2="2192" x1="1392" />
            <wire x2="2544" y1="2192" y2="2192" x1="1968" />
            <wire x2="2608" y1="2192" y2="2192" x1="2544" />
            <wire x2="3280" y1="2192" y2="2192" x1="2608" />
            <wire x2="3968" y1="2192" y2="2192" x1="3280" />
            <wire x2="4608" y1="2192" y2="2192" x1="3968" />
            <wire x2="5264" y1="2192" y2="2192" x1="4608" />
            <wire x2="7552" y1="2192" y2="2192" x1="5264" />
            <wire x2="960" y1="672" y2="672" x1="752" />
            <wire x2="1280" y1="672" y2="672" x1="960" />
            <wire x2="1456" y1="672" y2="672" x1="1280" />
            <wire x2="1792" y1="672" y2="672" x1="1456" />
            <wire x2="1984" y1="672" y2="672" x1="1792" />
            <wire x2="2352" y1="672" y2="672" x1="1984" />
            <wire x2="2560" y1="672" y2="672" x1="2352" />
            <wire x2="2912" y1="672" y2="672" x1="2560" />
            <wire x2="3120" y1="672" y2="672" x1="2912" />
            <wire x2="3504" y1="672" y2="672" x1="3120" />
            <wire x2="3520" y1="672" y2="672" x1="3504" />
            <wire x2="3712" y1="672" y2="672" x1="3520" />
            <wire x2="4112" y1="672" y2="672" x1="3712" />
            <wire x2="4320" y1="672" y2="672" x1="4112" />
            <wire x2="4688" y1="672" y2="672" x1="4320" />
            <wire x2="4896" y1="672" y2="672" x1="4688" />
            <wire x2="5280" y1="672" y2="672" x1="4896" />
            <wire x2="5504" y1="672" y2="672" x1="5280" />
            <wire x2="5904" y1="672" y2="672" x1="5504" />
            <wire x2="6160" y1="672" y2="672" x1="5904" />
            <wire x2="6480" y1="672" y2="672" x1="6160" />
            <wire x2="6784" y1="672" y2="672" x1="6480" />
            <wire x2="7072" y1="672" y2="672" x1="6784" />
            <wire x2="7376" y1="672" y2="672" x1="7072" />
            <wire x2="7552" y1="672" y2="672" x1="7376" />
            <wire x2="7552" y1="672" y2="2192" x1="7552" />
        </branch>
        <bustap x2="7072" y1="672" y2="576" x1="7072" />
        <branch name="FineDataA(11)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="7072" y="496" type="branch" />
            <wire x2="7072" y1="416" y2="496" x1="7072" />
            <wire x2="7072" y1="496" y2="576" x1="7072" />
        </branch>
        <bustap x2="6480" y1="672" y2="576" x1="6480" />
        <branch name="FineDataA(10)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6480" y="496" type="branch" />
            <wire x2="6480" y1="416" y2="496" x1="6480" />
            <wire x2="6480" y1="496" y2="576" x1="6480" />
        </branch>
        <bustap x2="5904" y1="672" y2="576" x1="5904" />
        <branch name="FineDataA(9)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5904" y="496" type="branch" />
            <wire x2="5904" y1="416" y2="496" x1="5904" />
            <wire x2="5904" y1="496" y2="576" x1="5904" />
        </branch>
        <bustap x2="5280" y1="672" y2="576" x1="5280" />
        <branch name="FineDataA(8)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5280" y="496" type="branch" />
            <wire x2="5280" y1="416" y2="496" x1="5280" />
            <wire x2="5280" y1="496" y2="576" x1="5280" />
        </branch>
        <bustap x2="4688" y1="672" y2="576" x1="4688" />
        <branch name="FineDataA(7)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4688" y="496" type="branch" />
            <wire x2="4688" y1="416" y2="496" x1="4688" />
            <wire x2="4688" y1="496" y2="576" x1="4688" />
        </branch>
        <bustap x2="4112" y1="672" y2="576" x1="4112" />
        <branch name="FineDataA(6)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4112" y="496" type="branch" />
            <wire x2="4112" y1="416" y2="496" x1="4112" />
            <wire x2="4112" y1="496" y2="576" x1="4112" />
        </branch>
        <bustap x2="3504" y1="672" y2="576" x1="3504" />
        <branch name="FineDataA(5)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3504" y="496" type="branch" />
            <wire x2="3504" y1="416" y2="496" x1="3504" />
            <wire x2="3504" y1="496" y2="576" x1="3504" />
        </branch>
        <bustap x2="2912" y1="672" y2="576" x1="2912" />
        <branch name="FineDataA(4)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2912" y="496" type="branch" />
            <wire x2="2912" y1="416" y2="496" x1="2912" />
            <wire x2="2912" y1="496" y2="576" x1="2912" />
        </branch>
        <bustap x2="7376" y1="672" y2="768" x1="7376" />
        <branch name="FineDataA(23)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="7376" y="944" type="branch" />
            <wire x2="7376" y1="768" y2="944" x1="7376" />
            <wire x2="7376" y1="944" y2="1120" x1="7376" />
        </branch>
        <bustap x2="6784" y1="672" y2="768" x1="6784" />
        <branch name="FineDataA(22)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6784" y="944" type="branch" />
            <wire x2="6784" y1="768" y2="944" x1="6784" />
            <wire x2="6784" y1="944" y2="1120" x1="6784" />
        </branch>
        <bustap x2="6160" y1="672" y2="768" x1="6160" />
        <branch name="FineDataA(21)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6160" y="944" type="branch" />
            <wire x2="6160" y1="768" y2="944" x1="6160" />
            <wire x2="6160" y1="944" y2="1120" x1="6160" />
        </branch>
        <bustap x2="5504" y1="672" y2="768" x1="5504" />
        <branch name="FineDataA(20)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5504" y="944" type="branch" />
            <wire x2="5504" y1="768" y2="944" x1="5504" />
            <wire x2="5504" y1="944" y2="1120" x1="5504" />
        </branch>
        <bustap x2="4896" y1="672" y2="768" x1="4896" />
        <branch name="FineDataA(19)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4896" y="944" type="branch" />
            <wire x2="4896" y1="768" y2="944" x1="4896" />
            <wire x2="4896" y1="944" y2="1120" x1="4896" />
        </branch>
        <bustap x2="4320" y1="672" y2="768" x1="4320" />
        <branch name="FineDataA(18)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4320" y="944" type="branch" />
            <wire x2="4320" y1="768" y2="944" x1="4320" />
            <wire x2="4320" y1="944" y2="1120" x1="4320" />
        </branch>
        <bustap x2="3712" y1="672" y2="768" x1="3712" />
        <branch name="FineDataA(17)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3712" y="944" type="branch" />
            <wire x2="3712" y1="768" y2="944" x1="3712" />
            <wire x2="3712" y1="944" y2="1120" x1="3712" />
        </branch>
        <bustap x2="3120" y1="672" y2="768" x1="3120" />
        <branch name="FineDataA(16)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3120" y="944" type="branch" />
            <wire x2="3120" y1="768" y2="944" x1="3120" />
            <wire x2="3120" y1="944" y2="1120" x1="3120" />
        </branch>
        <bustap x2="2560" y1="672" y2="768" x1="2560" />
        <branch name="FineDataA(15)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2560" y="944" type="branch" />
            <wire x2="2560" y1="768" y2="944" x1="2560" />
            <wire x2="2560" y1="944" y2="1120" x1="2560" />
        </branch>
        <bustap x2="1984" y1="672" y2="768" x1="1984" />
        <branch name="FineDataA(14)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1984" y="944" type="branch" />
            <wire x2="1984" y1="768" y2="944" x1="1984" />
            <wire x2="1984" y1="944" y2="1120" x1="1984" />
        </branch>
        <bustap x2="1456" y1="672" y2="768" x1="1456" />
        <branch name="FineDataA(13)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1456" y="944" type="branch" />
            <wire x2="1456" y1="768" y2="944" x1="1456" />
            <wire x2="1456" y1="944" y2="1120" x1="1456" />
        </branch>
        <bustap x2="960" y1="672" y2="768" x1="960" />
        <branch name="FineDataA(12)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="960" y="944" type="branch" />
            <wire x2="960" y1="768" y2="944" x1="960" />
            <wire x2="960" y1="944" y2="1120" x1="960" />
        </branch>
        <bustap x2="5264" y1="2192" y2="2096" x1="5264" />
        <branch name="FineDataA(31)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="5264" y="1960" type="branch" />
            <wire x2="5264" y1="1824" y2="1960" x1="5264" />
            <wire x2="5264" y1="1960" y2="2096" x1="5264" />
        </branch>
        <bustap x2="4608" y1="2192" y2="2096" x1="4608" />
        <branch name="FineDataA(30)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="4608" y="1960" type="branch" />
            <wire x2="4608" y1="1824" y2="1960" x1="4608" />
            <wire x2="4608" y1="1960" y2="2096" x1="4608" />
        </branch>
        <bustap x2="3968" y1="2192" y2="2096" x1="3968" />
        <branch name="FineDataA(29)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3968" y="1960" type="branch" />
            <wire x2="3968" y1="1824" y2="1960" x1="3968" />
            <wire x2="3968" y1="1960" y2="2096" x1="3968" />
        </branch>
        <bustap x2="3280" y1="2192" y2="2096" x1="3280" />
        <branch name="FineDataA(28)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3280" y="1960" type="branch" />
            <wire x2="3280" y1="1824" y2="1960" x1="3280" />
            <wire x2="3280" y1="1960" y2="2096" x1="3280" />
        </branch>
        <bustap x2="2608" y1="2192" y2="2096" x1="2608" />
        <branch name="FineDataA(27)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2608" y="1960" type="branch" />
            <wire x2="2608" y1="1824" y2="1960" x1="2608" />
            <wire x2="2608" y1="1960" y2="2096" x1="2608" />
        </branch>
        <bustap x2="1968" y1="2192" y2="2096" x1="1968" />
        <branch name="FineDataA(26)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1968" y="1960" type="branch" />
            <wire x2="1968" y1="1824" y2="1960" x1="1968" />
            <wire x2="1968" y1="1960" y2="2096" x1="1968" />
        </branch>
        <bustap x2="1392" y1="2192" y2="2096" x1="1392" />
        <branch name="FineDataA(25)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1392" y="1960" type="branch" />
            <wire x2="1392" y1="1824" y2="1960" x1="1392" />
            <wire x2="1392" y1="1960" y2="2096" x1="1392" />
        </branch>
        <bustap x2="752" y1="2192" y2="2096" x1="752" />
        <branch name="FineDataA(24)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="752" y="1960" type="branch" />
            <wire x2="752" y1="1824" y2="1960" x1="752" />
            <wire x2="752" y1="1960" y2="2096" x1="752" />
        </branch>
        <iomarker fontsize="28" x="352" y="2192" name="FineDataA(31:0)" orien="R180" />
    </sheet>
</drawing>