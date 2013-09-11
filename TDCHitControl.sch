<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="HitSave" />
        <signal name="HitBeforeBuffer" />
        <signal name="TDCGate" />
        <signal name="XLXN_84" />
        <signal name="HitClear" />
        <signal name="HitAfterBuffer" />
        <signal name="XLXN_313" />
        <signal name="XLXN_340" />
        <signal name="XLXN_341" />
        <port polarity="Input" name="HitSave" />
        <port polarity="Output" name="HitBeforeBuffer" />
        <port polarity="Input" name="TDCGate" />
        <port polarity="Input" name="HitClear" />
        <port polarity="Output" name="HitAfterBuffer" />
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
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="bufr">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="fdce" name="HitControl">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="HitSave" name="C" />
            <blockpin signalname="TDCGate" name="CE" />
            <blockpin signalname="HitClear" name="CLR" />
            <blockpin signalname="XLXN_84" name="D" />
            <blockpin signalname="HitBeforeBuffer" name="Q" />
        </block>
        <block symbolname="constant" name="XLXI_18">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_84" name="O" />
        </block>
        <block symbolname="bufr" name="Save_Bufr">
            <blockpin signalname="HitBeforeBuffer" name="I" />
            <blockpin signalname="XLXN_340" name="CLR" />
            <blockpin signalname="XLXN_313" name="CE" />
            <blockpin signalname="HitAfterBuffer" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_104">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_313" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_110">
            <attr value="0" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_340" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="HitSave">
            <wire x2="992" y1="800" y2="800" x1="576" />
        </branch>
        <branch name="HitBeforeBuffer">
            <wire x2="1536" y1="672" y2="672" x1="1376" />
            <wire x2="1872" y1="672" y2="672" x1="1536" />
            <wire x2="1664" y1="432" y2="432" x1="1536" />
            <wire x2="1536" y1="432" y2="672" x1="1536" />
        </branch>
        <branch name="TDCGate">
            <wire x2="976" y1="736" y2="736" x1="592" />
            <wire x2="992" y1="736" y2="736" x1="976" />
        </branch>
        <branch name="XLXN_84">
            <wire x2="992" y1="672" y2="672" x1="944" />
        </branch>
        <branch name="HitClear">
            <wire x2="784" y1="896" y2="896" x1="576" />
            <wire x2="992" y1="896" y2="896" x1="784" />
        </branch>
        <branch name="HitAfterBuffer">
            <wire x2="2368" y1="672" y2="672" x1="2256" />
        </branch>
        <branch name="XLXN_313">
            <wire x2="1872" y1="736" y2="736" x1="1840" />
        </branch>
        <branch name="XLXN_340">
            <wire x2="1872" y1="704" y2="704" x1="1744" />
            <wire x2="1744" y1="704" y2="736" x1="1744" />
        </branch>
        <instance x="992" y="928" name="HitControl" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="800" y="640" name="XLXI_18" orien="R0">
        </instance>
        <instance x="1872" y="768" name="Save_Bufr" orien="R0">
        </instance>
        <instance x="1808" y="880" name="XLXI_104" orien="R270">
        </instance>
        <instance x="1712" y="880" name="XLXI_110" orien="R270">
        </instance>
        <iomarker fontsize="28" x="576" y="800" name="HitSave" orien="R180" />
        <iomarker fontsize="28" x="576" y="896" name="HitClear" orien="R180" />
        <iomarker fontsize="28" x="2368" y="672" name="HitAfterBuffer" orien="R0" />
        <iomarker fontsize="28" x="592" y="736" name="TDCGate" orien="R180" />
        <iomarker fontsize="28" x="1664" y="432" name="HitBeforeBuffer" orien="R0" />
    </sheet>
</drawing>