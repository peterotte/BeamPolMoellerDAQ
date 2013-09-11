<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="InvHitClear" />
        <signal name="XLXN_188(15:0)" />
        <signal name="XLXN_191(15:0)" />
        <signal name="Clock400" />
        <signal name="XLXN_193" />
        <signal name="XLXN_194" />
        <signal name="FineData(31:0)" />
        <signal name="FineData(31:16)" />
        <signal name="FineData(15:0)" />
        <signal name="XLXN_220" />
        <signal name="XLXN_223" />
        <signal name="XLXN_224" />
        <signal name="BigDataBeforeSave(15:0)" />
        <signal name="XLXN_226(15:0)" />
        <signal name="BigDataLater(15:0)" />
        <signal name="BigData(15:0)" />
        <signal name="FineDataSaved(31:0)" />
        <signal name="FineDataSaved(31:16)" />
        <signal name="FineDataSaved(15:0)" />
        <signal name="XLXN_234" />
        <signal name="XLXN_235" />
        <signal name="XLXN_236" />
        <signal name="XLXN_238" />
        <signal name="XLXN_239" />
        <signal name="XLXN_240" />
        <signal name="XLXN_241" />
        <signal name="XLXN_242" />
        <signal name="XLXN_245" />
        <signal name="XLXN_195" />
        <signal name="XLXN_243" />
        <signal name="HitClear" />
        <signal name="HitAfterBuffer" />
        <signal name="CountersClear" />
        <signal name="HitPresent" />
        <signal name="XLXN_337" />
        <signal name="FineDataB(31:0)" />
        <signal name="FineDataA(31:0)" />
        <signal name="SelectSingleFineData(31:0)" />
        <signal name="XLXN_341" />
        <port polarity="Input" name="Clock400" />
        <port polarity="Output" name="BigDataLater(15:0)" />
        <port polarity="Output" name="BigData(15:0)" />
        <port polarity="Output" name="FineDataSaved(31:0)" />
        <port polarity="Input" name="HitClear" />
        <port polarity="Input" name="HitAfterBuffer" />
        <port polarity="Input" name="CountersClear" />
        <port polarity="Output" name="HitPresent" />
        <port polarity="Input" name="SelectSingleFineData(31:0)" />
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <blockdef name="SingleFineDataChain">
            <timestamp>2010-1-16T21:49:59</timestamp>
            <rect width="288" x="64" y="-256" height="256" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="416" y1="-224" y2="-224" x1="352" />
            <rect width="64" x="352" y="-236" height="24" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
            <rect width="64" x="352" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="Mycc16ce">
            <timestamp>2009-12-22T17:31:1</timestamp>
            <rect width="224" x="64" y="-192" height="192" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="352" y1="-96" y2="-96" x1="288" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="352" y1="-160" y2="-160" x1="288" />
            <rect width="64" x="288" y="-172" height="24" />
            <line x2="352" y1="-32" y2="-32" x1="288" />
        </blockdef>
        <blockdef name="Myfd16ce">
            <timestamp>2010-2-14T21:12:52</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
        </blockdef>
        <blockdef name="Myfd16ce2Space">
            <timestamp>2010-2-15T7:49:58</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="Selector32Bit">
            <timestamp>2010-2-26T13:43:6</timestamp>
            <rect width="320" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-172" height="24" />
        </blockdef>
        <block symbolname="Myfd16ce" name="HitBigTDC">
            <attr value="X3Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="HitAfterBuffer" name="C" />
            <blockpin signalname="XLXN_241" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_188(15:0)" name="D(15:0)" />
            <blockpin signalname="BigDataBeforeSave(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="Myfd16ce" name="HitBigTDCLater">
            <attr value="X3Y24" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="HitAfterBuffer" name="C" />
            <blockpin signalname="XLXN_242" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_191(15:0)" name="D(15:0)" />
            <blockpin signalname="XLXN_226(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="inv" name="XLXI_49">
            <blockpin signalname="Clock400" name="I" />
            <blockpin signalname="XLXN_193" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_45">
            <attr value="X3Y9" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="InvHitClear" name="C" />
            <blockpin signalname="XLXN_239" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_194" name="D" />
            <blockpin signalname="XLXN_234" name="Q" />
        </block>
        <block symbolname="fdce" name="XLXI_46">
            <attr value="X3Y9" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="InvHitClear" name="C" />
            <blockpin signalname="XLXN_240" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_234" name="D" />
            <blockpin signalname="XLXN_245" name="Q" />
        </block>
        <block symbolname="Myfd16ce2Space" name="SavedFineData1">
            <attr value="X1Y16" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="InvHitClear" name="C" />
            <blockpin signalname="XLXN_235" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="FineData(31:16)" name="D(15:0)" />
            <blockpin signalname="FineDataSaved(31:16)" name="Q(15:0)" />
        </block>
        <block symbolname="Myfd16ce2Space" name="SavedFineData0">
            <attr value="X1Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="InvHitClear" name="C" />
            <blockpin signalname="XLXN_236" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="FineData(15:0)" name="D(15:0)" />
            <blockpin signalname="FineDataSaved(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="constant" name="XLXI_51">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_220" name="O" />
        </block>
        <block symbolname="SingleFineDataChain" name="FineTDC">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin name="Carryline_End" />
            <blockpin signalname="CountersClear" name="Clear" />
            <blockpin signalname="Clock400" name="Clock" />
            <blockpin signalname="XLXN_220" name="Enable" />
            <blockpin signalname="FineDataA(31:0)" name="FineDataA(31:0)" />
            <blockpin signalname="FineDataB(31:0)" name="FineDataB(31:0)" />
            <blockpin signalname="HitAfterBuffer" name="Save" />
        </block>
        <block symbolname="Mycc16ce" name="BigTDC">
            <attr value="X2Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="Clock400" name="C" />
            <blockpin signalname="XLXN_223" name="CE" />
            <blockpin name="CEO" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_188(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="Mycc16ce" name="BigTDCLater">
            <attr value="X2Y24" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="XLXN_193" name="C" />
            <blockpin signalname="XLXN_224" name="CE" />
            <blockpin name="CEO" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_191(15:0)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="constant" name="XLXI_52">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_223" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_53">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_224" name="O" />
        </block>
        <block symbolname="Myfd16ce" name="XLXI_55">
            <attr value="X4Y24" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="InvHitClear" name="C" />
            <blockpin signalname="XLXN_238" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_226(15:0)" name="D(15:0)" />
            <blockpin signalname="BigDataLater(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="Myfd16ce" name="SavedBigTDC">
            <attr value="X4Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="InvHitClear" name="C" />
            <blockpin signalname="XLXN_337" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="BigDataBeforeSave(15:0)" name="D(15:0)" />
            <blockpin signalname="BigData(15:0)" name="Q(15:0)" />
        </block>
        <block symbolname="constant" name="XLXI_56">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_235" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_57">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_236" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_58">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_337" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_59">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_238" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_61">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_239" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_62">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_240" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_63">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_241" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_64">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_242" name="O" />
        </block>
        <block symbolname="fdce" name="XLXI_44">
            <attr value="X3Y8" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="HitAfterBuffer" name="C" />
            <blockpin signalname="XLXN_243" name="CE" />
            <blockpin signalname="CountersClear" name="CLR" />
            <blockpin signalname="XLXN_195" name="D" />
            <blockpin signalname="XLXN_194" name="Q" />
        </block>
        <block symbolname="constant" name="XLXI_65">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_243" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_50">
            <blockpin signalname="XLXN_194" name="I" />
            <blockpin signalname="XLXN_195" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_105">
            <blockpin signalname="HitClear" name="I" />
            <blockpin signalname="InvHitClear" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_66">
            <blockpin signalname="XLXN_234" name="I0" />
            <blockpin signalname="XLXN_245" name="I1" />
            <blockpin signalname="HitPresent" name="O" />
        </block>
        <block symbolname="Selector32Bit" name="XLXI_106">
            <blockpin signalname="FineDataA(31:0)" name="D0(31:0)" />
            <blockpin signalname="FineDataB(31:0)" name="D1(31:0)" />
            <blockpin signalname="SelectSingleFineData(31:0)" name="SelectD(31:0)" />
            <blockpin signalname="FineData(31:0)" name="SelectedOut(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="1744" y="1504" name="HitBigTDC" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="-376" y="0" type="instance" />
        </instance>
        <branch name="XLXN_188(15:0)">
            <wire x2="1968" y1="1088" y2="1504" x1="1968" />
        </branch>
        <instance x="2576" y="1504" name="HitBigTDCLater" orien="R90">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="192" y="-188" type="instance" />
        </instance>
        <branch name="XLXN_191(15:0)">
            <wire x2="2800" y1="1088" y2="1504" x1="2800" />
        </branch>
        <branch name="Clock400">
            <wire x2="1088" y1="608" y2="608" x1="592" />
            <wire x2="1904" y1="608" y2="608" x1="1088" />
            <wire x2="2480" y1="608" y2="608" x1="1904" />
            <wire x2="1904" y1="608" y2="736" x1="1904" />
            <wire x2="1088" y1="608" y2="752" x1="1088" />
        </branch>
        <branch name="XLXN_193">
            <wire x2="2736" y1="608" y2="608" x1="2704" />
            <wire x2="2736" y1="608" y2="736" x1="2736" />
        </branch>
        <instance x="2480" y="640" name="XLXI_49" orien="R0" />
        <instance x="3280" y="2560" name="XLXI_45" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3744" y="2544" name="XLXI_46" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="672" y="2560" name="SavedFineData1" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="144" y="-232" type="instance" />
        </instance>
        <instance x="1152" y="2544" name="SavedFineData0" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="144" y="-232" type="instance" />
        </instance>
        <branch name="FineData(31:16)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="896" y="2496" type="branch" />
            <wire x2="896" y1="2432" y2="2496" x1="896" />
            <wire x2="896" y1="2496" y2="2560" x1="896" />
        </branch>
        <branch name="FineData(15:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1376" y="2488" type="branch" />
            <wire x2="1376" y1="2432" y2="2488" x1="1376" />
            <wire x2="1376" y1="2488" y2="2544" x1="1376" />
        </branch>
        <instance x="1344" y="752" name="XLXI_51" orien="R180">
        </instance>
        <branch name="XLXN_220">
            <wire x2="1024" y1="720" y2="752" x1="1024" />
            <wire x2="1200" y1="720" y2="720" x1="1024" />
        </branch>
        <instance x="864" y="752" name="FineTDC" orien="R90">
        </instance>
        <instance x="1808" y="736" name="BigTDC" orien="R90">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-312" type="instance" />
        </instance>
        <instance x="2640" y="736" name="BigTDCLater" orien="R90">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-312" type="instance" />
        </instance>
        <branch name="XLXN_223">
            <wire x2="2000" y1="736" y2="736" x1="1968" />
        </branch>
        <instance x="2144" y="768" name="XLXI_52" orien="R180">
        </instance>
        <instance x="2576" y="2576" name="XLXI_55" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="192" y="-188" type="instance" />
        </instance>
        <branch name="XLXN_226(15:0)">
            <wire x2="2800" y1="1888" y2="2576" x1="2800" />
        </branch>
        <branch name="BigDataLater(15:0)">
            <wire x2="2800" y1="2960" y2="2992" x1="2800" />
        </branch>
        <branch name="BigData(15:0)">
            <wire x2="1968" y1="2960" y2="3008" x1="1968" />
        </branch>
        <instance x="1744" y="2576" name="SavedBigTDC" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="192" y="-188" type="instance" />
        </instance>
        <branch name="FineDataSaved(31:0)">
            <wire x2="1136" y1="3120" y2="3120" x1="896" />
            <wire x2="1376" y1="3120" y2="3120" x1="1136" />
            <wire x2="1136" y1="3120" y2="3152" x1="1136" />
        </branch>
        <bustap x2="896" y1="3120" y2="3024" x1="896" />
        <branch name="FineDataSaved(31:16)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="896" y="2984" type="branch" />
            <wire x2="896" y1="2944" y2="2984" x1="896" />
            <wire x2="896" y1="2984" y2="3024" x1="896" />
        </branch>
        <bustap x2="1376" y1="3120" y2="3024" x1="1376" />
        <branch name="FineDataSaved(15:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="1376" y="2976" type="branch" />
            <wire x2="1376" y1="2928" y2="2976" x1="1376" />
            <wire x2="1376" y1="2976" y2="3024" x1="1376" />
        </branch>
        <branch name="XLXN_234">
            <wire x2="3536" y1="2944" y2="3168" x1="3536" />
            <wire x2="4192" y1="3168" y2="3168" x1="3536" />
            <wire x2="4288" y1="3168" y2="3168" x1="4192" />
            <wire x2="4000" y1="2528" y2="2544" x1="4000" />
            <wire x2="4192" y1="2528" y2="2528" x1="4000" />
            <wire x2="4192" y1="2528" y2="3168" x1="4192" />
        </branch>
        <branch name="XLXN_235">
            <wire x2="832" y1="2496" y2="2560" x1="832" />
        </branch>
        <branch name="XLXN_236">
            <wire x2="1312" y1="2496" y2="2544" x1="1312" />
        </branch>
        <branch name="XLXN_238">
            <wire x2="2736" y1="2448" y2="2576" x1="2736" />
        </branch>
        <branch name="XLXN_239">
            <wire x2="3472" y1="2448" y2="2560" x1="3472" />
        </branch>
        <branch name="XLXN_240">
            <wire x2="3936" y1="2448" y2="2544" x1="3936" />
        </branch>
        <branch name="XLXN_242">
            <wire x2="2736" y1="1376" y2="1504" x1="2736" />
        </branch>
        <iomarker fontsize="28" x="2800" y="2992" name="BigDataLater(15:0)" orien="R90" />
        <iomarker fontsize="28" x="1968" y="3008" name="BigData(15:0)" orien="R90" />
        <iomarker fontsize="28" x="1136" y="3152" name="FineDataSaved(31:0)" orien="R90" />
        <iomarker fontsize="28" x="640" y="672" name="CountersClear" orien="R180" />
        <iomarker fontsize="28" x="592" y="608" name="Clock400" orien="R180" />
        <branch name="XLXN_243">
            <wire x2="3472" y1="1392" y2="1488" x1="3472" />
        </branch>
        <branch name="InvHitClear">
            <wire x2="1248" y1="2272" y2="2272" x1="768" />
            <wire x2="1840" y1="2272" y2="2272" x1="1248" />
            <wire x2="2672" y1="2272" y2="2272" x1="1840" />
            <wire x2="3408" y1="2272" y2="2272" x1="2672" />
            <wire x2="3872" y1="2272" y2="2272" x1="3408" />
            <wire x2="3872" y1="2272" y2="2544" x1="3872" />
            <wire x2="3408" y1="2272" y2="2560" x1="3408" />
            <wire x2="2672" y1="2272" y2="2576" x1="2672" />
            <wire x2="1840" y1="2272" y2="2576" x1="1840" />
            <wire x2="1248" y1="2272" y2="2544" x1="1248" />
            <wire x2="768" y1="2272" y2="2560" x1="768" />
        </branch>
        <instance x="736" y="2048" name="XLXI_105" orien="R90" />
        <instance x="2768" y="1232" name="XLXI_64" orien="R90">
        </instance>
        <iomarker fontsize="28" x="560" y="432" name="HitClear" orien="R180" />
        <instance x="3280" y="1488" name="XLXI_44" orien="R90">
            <attrtext style="alignment:VLEFT;fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3504" y="1248" name="XLXI_65" orien="R90">
        </instance>
        <instance x="3792" y="1776" name="XLXI_50" orien="R270" />
        <branch name="XLXN_195">
            <wire x2="3536" y1="1472" y2="1488" x1="3536" />
            <wire x2="3760" y1="1472" y2="1472" x1="3536" />
            <wire x2="3760" y1="1472" y2="1552" x1="3760" />
        </branch>
        <branch name="XLXN_194">
            <wire x2="3536" y1="1872" y2="1904" x1="3536" />
            <wire x2="3536" y1="1904" y2="2560" x1="3536" />
            <wire x2="3760" y1="1904" y2="1904" x1="3536" />
            <wire x2="3760" y1="1776" y2="1904" x1="3760" />
        </branch>
        <branch name="XLXN_224">
            <wire x2="2800" y1="720" y2="736" x1="2800" />
        </branch>
        <instance x="2832" y="576" name="XLXI_53" orien="R90">
        </instance>
        <branch name="XLXN_241">
            <wire x2="1904" y1="1376" y2="1504" x1="1904" />
        </branch>
        <instance x="1936" y="1232" name="XLXI_63" orien="R90">
        </instance>
        <branch name="CountersClear">
            <wire x2="704" y1="672" y2="672" x1="640" />
            <wire x2="896" y1="672" y2="672" x1="704" />
            <wire x2="896" y1="672" y2="752" x1="896" />
            <wire x2="1840" y1="672" y2="672" x1="896" />
            <wire x2="1840" y1="672" y2="736" x1="1840" />
            <wire x2="2672" y1="672" y2="672" x1="1840" />
            <wire x2="2672" y1="672" y2="736" x1="2672" />
            <wire x2="704" y1="672" y2="1456" x1="704" />
            <wire x2="704" y1="1456" y2="2480" x1="704" />
            <wire x2="704" y1="2480" y2="2560" x1="704" />
            <wire x2="1184" y1="2480" y2="2480" x1="704" />
            <wire x2="1184" y1="2480" y2="2544" x1="1184" />
            <wire x2="1776" y1="2480" y2="2480" x1="1184" />
            <wire x2="1776" y1="2480" y2="2576" x1="1776" />
            <wire x2="2608" y1="2480" y2="2480" x1="1776" />
            <wire x2="2608" y1="2480" y2="2576" x1="2608" />
            <wire x2="3312" y1="2480" y2="2480" x1="2608" />
            <wire x2="3312" y1="2480" y2="2560" x1="3312" />
            <wire x2="3776" y1="2480" y2="2480" x1="3312" />
            <wire x2="3776" y1="2480" y2="2544" x1="3776" />
            <wire x2="1776" y1="1456" y2="1456" x1="704" />
            <wire x2="1776" y1="1456" y2="1504" x1="1776" />
            <wire x2="2608" y1="1456" y2="1456" x1="1776" />
            <wire x2="2608" y1="1456" y2="1504" x1="2608" />
            <wire x2="3312" y1="1456" y2="1456" x1="2608" />
            <wire x2="3312" y1="1456" y2="1488" x1="3312" />
        </branch>
        <instance x="1936" y="2304" name="XLXI_58" orien="R90">
        </instance>
        <instance x="2768" y="2304" name="XLXI_59" orien="R90">
        </instance>
        <bustap x2="896" y1="2336" y2="2432" x1="896" />
        <bustap x2="1376" y1="2336" y2="2432" x1="1376" />
        <instance x="1344" y="2352" name="XLXI_57" orien="R90">
        </instance>
        <instance x="864" y="2352" name="XLXI_56" orien="R90">
        </instance>
        <instance x="3504" y="2304" name="XLXI_61" orien="R90">
        </instance>
        <branch name="HitPresent">
            <wire x2="4672" y1="3136" y2="3136" x1="4544" />
        </branch>
        <instance x="4288" y="3232" name="XLXI_66" orien="R0" />
        <iomarker fontsize="28" x="4672" y="3136" name="HitPresent" orien="R0" />
        <branch name="XLXN_245">
            <wire x2="4000" y1="2928" y2="3104" x1="4000" />
            <wire x2="4288" y1="3104" y2="3104" x1="4000" />
        </branch>
        <instance x="3968" y="2304" name="XLXI_62" orien="R90">
        </instance>
        <branch name="XLXN_337">
            <wire x2="1904" y1="2448" y2="2576" x1="1904" />
        </branch>
        <branch name="HitClear">
            <wire x2="768" y1="432" y2="432" x1="560" />
            <wire x2="768" y1="432" y2="2048" x1="768" />
        </branch>
        <branch name="HitAfterBuffer">
            <wire x2="960" y1="528" y2="528" x1="560" />
            <wire x2="960" y1="528" y2="752" x1="960" />
            <wire x2="2352" y1="528" y2="528" x1="960" />
            <wire x2="2352" y1="528" y2="1392" x1="2352" />
            <wire x2="2672" y1="1392" y2="1392" x1="2352" />
            <wire x2="2672" y1="1392" y2="1504" x1="2672" />
            <wire x2="3408" y1="1392" y2="1392" x1="2672" />
            <wire x2="3408" y1="1392" y2="1488" x1="3408" />
            <wire x2="1840" y1="1392" y2="1504" x1="1840" />
            <wire x2="2352" y1="1392" y2="1392" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="560" y="528" name="HitAfterBuffer" orien="R180" />
        <branch name="BigDataBeforeSave(15:0)">
            <wire x2="1968" y1="1888" y2="2576" x1="1968" />
        </branch>
        <branch name="FineData(31:0)">
            <wire x2="1088" y1="2336" y2="2336" x1="896" />
            <wire x2="1376" y1="2336" y2="2336" x1="1088" />
            <wire x2="1088" y1="2016" y2="2336" x1="1088" />
        </branch>
        <instance x="928" y="1568" name="XLXI_106" orien="R90">
        </instance>
        <branch name="FineDataB(31:0)">
            <wire x2="1024" y1="1168" y2="1568" x1="1024" />
        </branch>
        <branch name="FineDataA(31:0)">
            <wire x2="1088" y1="1168" y2="1568" x1="1088" />
        </branch>
        <branch name="SelectSingleFineData(31:0)">
            <wire x2="960" y1="1344" y2="1344" x1="896" />
            <wire x2="960" y1="1344" y2="1552" x1="960" />
            <wire x2="960" y1="1552" y2="1568" x1="960" />
        </branch>
        <iomarker fontsize="28" x="896" y="1344" name="SelectSingleFineData(31:0)" orien="R180" />
    </sheet>
</drawing>