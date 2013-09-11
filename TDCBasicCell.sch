<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Carry_In" />
        <signal name="Const_0" />
        <signal name="Carry_On" />
        <signal name="Clear" />
        <signal name="Enable" />
        <signal name="Save" />
        <signal name="FineDataB" />
        <signal name="Carry_Out" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="FineDataA" />
        <port polarity="Input" name="Carry_In" />
        <port polarity="Input" name="Clear" />
        <port polarity="Input" name="Enable" />
        <port polarity="Input" name="Save" />
        <port polarity="Output" name="FineDataB" />
        <port polarity="Output" name="Carry_Out" />
        <port polarity="Output" name="FineDataA" />
        <blockdef name="muxcy_l">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="192" y1="0" y2="-64" x1="192" />
            <line x2="128" y1="-224" y2="-160" x1="128" />
            <line x2="32" y1="-160" y2="-64" x1="96" />
            <line x2="96" y1="-160" y2="-160" x1="224" />
            <line x2="224" y1="-64" y2="-160" x1="288" />
            <line x2="288" y1="-64" y2="-64" x1="32" />
            <line x2="128" y1="0" y2="-64" x1="128" />
            <line x2="56" y1="-96" y2="-96" x1="0" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="fdce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <block symbolname="muxcy_l" name="MuxCy_0">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="Carry_In" name="CI" />
            <blockpin signalname="Const_0" name="DI" />
            <blockpin signalname="Enable" name="S" />
            <blockpin signalname="Carry_On" name="LO" />
        </block>
        <block symbolname="constant" name="XLXI_11">
            <attr value="0" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="Const_0" name="O" />
        </block>
        <block symbolname="muxcy_l" name="MuxCy_1">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="Carry_On" name="CI" />
            <blockpin signalname="Const_0" name="DI" />
            <blockpin signalname="Enable" name="S" />
            <blockpin signalname="Carry_Out" name="LO" />
        </block>
        <block symbolname="fdce" name="FDCE_1">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="Save" name="C" />
            <blockpin signalname="Enable" name="CE" />
            <blockpin signalname="Clear" name="CLR" />
            <blockpin signalname="Carry_Out" name="D" />
            <blockpin signalname="FineDataB" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_12">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="Save" name="C" />
            <blockpin signalname="Enable" name="CE" />
            <blockpin signalname="Clear" name="CLR" />
            <blockpin signalname="Carry_On" name="D" />
            <blockpin signalname="FineDataA" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5382" height="3801">
        <attr value="CM" name="LengthUnitName" />
        <attr value="4" name="GridsPerUnit" />
        <instance x="784" y="2992" name="MuxCy_0" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <branch name="Const_0">
            <wire x2="768" y1="3008" y2="3008" x1="720" />
            <wire x2="912" y1="3008" y2="3008" x1="768" />
            <wire x2="912" y1="2640" y2="2640" x1="768" />
            <wire x2="768" y1="2640" y2="3008" x1="768" />
            <wire x2="912" y1="2592" y2="2640" x1="912" />
            <wire x2="912" y1="2992" y2="3008" x1="912" />
        </branch>
        <branch name="FineDataB">
            <wire x2="1632" y1="2048" y2="2048" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="976" y="3136" name="Carry_In" orien="R90" />
        <branch name="Carry_Out">
            <wire x2="912" y1="1936" y2="2048" x1="912" />
            <wire x2="912" y1="2048" y2="2368" x1="912" />
            <wire x2="1200" y1="2048" y2="2048" x1="912" />
        </branch>
        <instance x="576" y="2976" name="XLXI_11" orien="R0">
        </instance>
        <branch name="Carry_In">
            <wire x2="976" y1="2992" y2="3136" x1="976" />
        </branch>
        <iomarker fontsize="28" x="912" y="1936" name="Carry_Out" orien="R270" />
        <instance x="784" y="2592" name="MuxCy_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <branch name="Carry_On">
            <wire x2="912" y1="2752" y2="2768" x1="912" />
            <wire x2="976" y1="2752" y2="2752" x1="912" />
            <wire x2="976" y1="2592" y2="2656" x1="976" />
            <wire x2="976" y1="2656" y2="2752" x1="976" />
            <wire x2="1200" y1="2656" y2="2656" x1="976" />
        </branch>
        <branch name="Enable">
            <wire x2="736" y1="2112" y2="2112" x1="592" />
            <wire x2="736" y1="2112" y2="2496" x1="736" />
            <wire x2="784" y1="2496" y2="2496" x1="736" />
            <wire x2="736" y1="2496" y2="2896" x1="736" />
            <wire x2="784" y1="2896" y2="2896" x1="736" />
            <wire x2="1184" y1="2112" y2="2112" x1="736" />
            <wire x2="1200" y1="2112" y2="2112" x1="1184" />
            <wire x2="1184" y1="2112" y2="2720" x1="1184" />
            <wire x2="1200" y1="2720" y2="2720" x1="1184" />
        </branch>
        <branch name="Save">
            <wire x2="1168" y1="2176" y2="2176" x1="592" />
            <wire x2="1200" y1="2176" y2="2176" x1="1168" />
            <wire x2="1168" y1="2176" y2="2784" x1="1168" />
            <wire x2="1200" y1="2784" y2="2784" x1="1168" />
        </branch>
        <branch name="Clear">
            <wire x2="1152" y1="2272" y2="2272" x1="608" />
            <wire x2="1200" y1="2272" y2="2272" x1="1152" />
            <wire x2="1152" y1="2272" y2="2880" x1="1152" />
            <wire x2="1200" y1="2880" y2="2880" x1="1152" />
        </branch>
        <instance x="1200" y="2304" name="FDCE_1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <iomarker fontsize="28" x="592" y="2112" name="Enable" orien="R180" />
        <iomarker fontsize="28" x="592" y="2176" name="Save" orien="R180" />
        <iomarker fontsize="28" x="608" y="2272" name="Clear" orien="R180" />
        <iomarker fontsize="28" x="1632" y="2048" name="FineDataB" orien="R0" />
        <instance x="1200" y="2912" name="XLXI_12" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <branch name="FineDataA">
            <wire x2="1616" y1="2656" y2="2656" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="1616" y="2656" name="FineDataA" orien="R0" />
    </sheet>
</drawing>