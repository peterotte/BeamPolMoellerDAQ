<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLR" />
        <signal name="C" />
        <signal name="CE" />
        <signal name="Q(0)" />
        <signal name="Q(1)" />
        <signal name="Q(2)" />
        <signal name="Q(3)" />
        <signal name="Q(4)" />
        <signal name="Q(5)" />
        <signal name="Q(6)" />
        <signal name="Q(7)" />
        <signal name="Q(8)" />
        <signal name="Q(9)" />
        <signal name="Q(10)" />
        <signal name="Q(11)" />
        <signal name="Q(12)" />
        <signal name="Q(13)" />
        <signal name="Q(14)" />
        <signal name="Q(15)" />
        <signal name="Q(15:0)" />
        <signal name="D(0)" />
        <signal name="D(1)" />
        <signal name="D(2)" />
        <signal name="D(3)" />
        <signal name="D(4)" />
        <signal name="D(5)" />
        <signal name="D(6)" />
        <signal name="D(7)" />
        <signal name="D(8)" />
        <signal name="D(9)" />
        <signal name="D(10)" />
        <signal name="D(11)" />
        <signal name="D(12)" />
        <signal name="D(13)" />
        <signal name="D(14)" />
        <signal name="D(15)" />
        <signal name="D(15:0)" />
        <port polarity="Input" name="CLR" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="CE" />
        <port polarity="Output" name="Q(15:0)" />
        <port polarity="Input" name="D(15:0)" />
        <blockdef name="fdce">
            <timestamp>2001-5-4T12:38:22</timestamp>
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
        <block symbolname="fdce" name="I_Q0">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(0)" name="D" />
            <blockpin signalname="Q(0)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q5">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(5)" name="D" />
            <blockpin signalname="Q(5)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q1">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(1)" name="D" />
            <blockpin signalname="Q(1)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q2">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(2)" name="D" />
            <blockpin signalname="Q(2)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q3">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(3)" name="D" />
            <blockpin signalname="Q(3)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q4">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(4)" name="D" />
            <blockpin signalname="Q(4)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q6">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(6)" name="D" />
            <blockpin signalname="Q(6)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q7">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(7)" name="D" />
            <blockpin signalname="Q(7)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q8">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(8)" name="D" />
            <blockpin signalname="Q(8)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q9">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(9)" name="D" />
            <blockpin signalname="Q(9)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q10">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(10)" name="D" />
            <blockpin signalname="Q(10)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q11">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(11)" name="D" />
            <blockpin signalname="Q(11)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q12">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(12)" name="D" />
            <blockpin signalname="Q(12)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q13">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(13)" name="D" />
            <blockpin signalname="Q(13)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q14">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(14)" name="D" />
            <blockpin signalname="Q(14)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_Q15">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="D(15)" name="D" />
            <blockpin signalname="Q(15)" name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5760" height="3840">
        <instance x="1600" y="672" name="I_Q0" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="2592" name="I_Q5" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="1056" name="I_Q1" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="1440" name="I_Q2" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="1824" name="I_Q3" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="2208" name="I_Q4" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="2976" name="I_Q6" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="1600" y="3360" name="I_Q7" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="672" name="I_Q8" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="1056" name="I_Q9" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="1440" name="I_Q10" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="1824" name="I_Q11" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="2208" name="I_Q12" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="2592" name="I_Q13" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="2976" name="I_Q14" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3616" y="3360" name="I_Q15" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <branch name="CLR">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="480" y="3584" type="branch" />
            <wire x2="480" y1="3584" y2="3584" x1="448" />
            <wire x2="1472" y1="3584" y2="3584" x1="480" />
            <wire x2="3488" y1="3584" y2="3584" x1="1472" />
            <wire x2="1472" y1="640" y2="1024" x1="1472" />
            <wire x2="1472" y1="1024" y2="1408" x1="1472" />
            <wire x2="1472" y1="1408" y2="1792" x1="1472" />
            <wire x2="1472" y1="1792" y2="2176" x1="1472" />
            <wire x2="1472" y1="2176" y2="2560" x1="1472" />
            <wire x2="1472" y1="2560" y2="2944" x1="1472" />
            <wire x2="1472" y1="2944" y2="3328" x1="1472" />
            <wire x2="1472" y1="3328" y2="3584" x1="1472" />
            <wire x2="1600" y1="3328" y2="3328" x1="1472" />
            <wire x2="1600" y1="2944" y2="2944" x1="1472" />
            <wire x2="1600" y1="2560" y2="2560" x1="1472" />
            <wire x2="1600" y1="2176" y2="2176" x1="1472" />
            <wire x2="1600" y1="1792" y2="1792" x1="1472" />
            <wire x2="1600" y1="1408" y2="1408" x1="1472" />
            <wire x2="1600" y1="1024" y2="1024" x1="1472" />
            <wire x2="1600" y1="640" y2="640" x1="1472" />
            <wire x2="3488" y1="640" y2="1024" x1="3488" />
            <wire x2="3488" y1="1024" y2="1408" x1="3488" />
            <wire x2="3488" y1="1408" y2="1792" x1="3488" />
            <wire x2="3488" y1="1792" y2="2176" x1="3488" />
            <wire x2="3488" y1="2176" y2="2560" x1="3488" />
            <wire x2="3488" y1="2560" y2="2944" x1="3488" />
            <wire x2="3488" y1="2944" y2="3328" x1="3488" />
            <wire x2="3488" y1="3328" y2="3584" x1="3488" />
            <wire x2="3616" y1="3328" y2="3328" x1="3488" />
            <wire x2="3616" y1="2944" y2="2944" x1="3488" />
            <wire x2="3616" y1="2560" y2="2560" x1="3488" />
            <wire x2="3616" y1="2176" y2="2176" x1="3488" />
            <wire x2="3616" y1="1792" y2="1792" x1="3488" />
            <wire x2="3616" y1="1408" y2="1408" x1="3488" />
            <wire x2="3616" y1="1024" y2="1024" x1="3488" />
            <wire x2="3616" y1="640" y2="640" x1="3488" />
        </branch>
        <iomarker fontsize="28" x="448" y="3584" name="CLR" orien="R180" />
        <branch name="C">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="480" y="3520" type="branch" />
            <wire x2="480" y1="3520" y2="3520" x1="448" />
            <wire x2="1408" y1="3520" y2="3520" x1="480" />
            <wire x2="3424" y1="3520" y2="3520" x1="1408" />
            <wire x2="1408" y1="544" y2="928" x1="1408" />
            <wire x2="1408" y1="928" y2="1312" x1="1408" />
            <wire x2="1408" y1="1312" y2="1696" x1="1408" />
            <wire x2="1408" y1="1696" y2="2080" x1="1408" />
            <wire x2="1408" y1="2080" y2="2464" x1="1408" />
            <wire x2="1408" y1="2464" y2="2848" x1="1408" />
            <wire x2="1408" y1="2848" y2="3232" x1="1408" />
            <wire x2="1408" y1="3232" y2="3520" x1="1408" />
            <wire x2="1600" y1="3232" y2="3232" x1="1408" />
            <wire x2="1600" y1="2848" y2="2848" x1="1408" />
            <wire x2="1600" y1="2464" y2="2464" x1="1408" />
            <wire x2="1600" y1="2080" y2="2080" x1="1408" />
            <wire x2="1600" y1="1696" y2="1696" x1="1408" />
            <wire x2="1600" y1="1312" y2="1312" x1="1408" />
            <wire x2="1600" y1="928" y2="928" x1="1408" />
            <wire x2="1600" y1="544" y2="544" x1="1408" />
            <wire x2="3424" y1="544" y2="928" x1="3424" />
            <wire x2="3424" y1="928" y2="1312" x1="3424" />
            <wire x2="3424" y1="1312" y2="1696" x1="3424" />
            <wire x2="3424" y1="1696" y2="2080" x1="3424" />
            <wire x2="3424" y1="2080" y2="2464" x1="3424" />
            <wire x2="3424" y1="2464" y2="2848" x1="3424" />
            <wire x2="3424" y1="2848" y2="3232" x1="3424" />
            <wire x2="3424" y1="3232" y2="3520" x1="3424" />
            <wire x2="3616" y1="3232" y2="3232" x1="3424" />
            <wire x2="3616" y1="2848" y2="2848" x1="3424" />
            <wire x2="3616" y1="2464" y2="2464" x1="3424" />
            <wire x2="3616" y1="2080" y2="2080" x1="3424" />
            <wire x2="3616" y1="1696" y2="1696" x1="3424" />
            <wire x2="3616" y1="1312" y2="1312" x1="3424" />
            <wire x2="3616" y1="928" y2="928" x1="3424" />
            <wire x2="3616" y1="544" y2="544" x1="3424" />
        </branch>
        <iomarker fontsize="28" x="448" y="3520" name="C" orien="R180" />
        <branch name="CE">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="480" y="3456" type="branch" />
            <wire x2="480" y1="3456" y2="3456" x1="448" />
            <wire x2="1344" y1="3456" y2="3456" x1="480" />
            <wire x2="3360" y1="3456" y2="3456" x1="1344" />
            <wire x2="1344" y1="480" y2="864" x1="1344" />
            <wire x2="1344" y1="864" y2="1248" x1="1344" />
            <wire x2="1344" y1="1248" y2="1632" x1="1344" />
            <wire x2="1344" y1="1632" y2="2016" x1="1344" />
            <wire x2="1344" y1="2016" y2="2400" x1="1344" />
            <wire x2="1344" y1="2400" y2="2784" x1="1344" />
            <wire x2="1344" y1="2784" y2="3168" x1="1344" />
            <wire x2="1344" y1="3168" y2="3456" x1="1344" />
            <wire x2="1600" y1="3168" y2="3168" x1="1344" />
            <wire x2="1600" y1="2784" y2="2784" x1="1344" />
            <wire x2="1600" y1="2400" y2="2400" x1="1344" />
            <wire x2="1600" y1="2016" y2="2016" x1="1344" />
            <wire x2="1600" y1="1632" y2="1632" x1="1344" />
            <wire x2="1600" y1="1248" y2="1248" x1="1344" />
            <wire x2="1600" y1="864" y2="864" x1="1344" />
            <wire x2="1600" y1="480" y2="480" x1="1344" />
            <wire x2="3360" y1="480" y2="864" x1="3360" />
            <wire x2="3360" y1="864" y2="1248" x1="3360" />
            <wire x2="3360" y1="1248" y2="1632" x1="3360" />
            <wire x2="3360" y1="1632" y2="2016" x1="3360" />
            <wire x2="3360" y1="2016" y2="2400" x1="3360" />
            <wire x2="3360" y1="2400" y2="2784" x1="3360" />
            <wire x2="3360" y1="2784" y2="3168" x1="3360" />
            <wire x2="3360" y1="3168" y2="3456" x1="3360" />
            <wire x2="3616" y1="3168" y2="3168" x1="3360" />
            <wire x2="3616" y1="2784" y2="2784" x1="3360" />
            <wire x2="3616" y1="2400" y2="2400" x1="3360" />
            <wire x2="3616" y1="2016" y2="2016" x1="3360" />
            <wire x2="3616" y1="1632" y2="1632" x1="3360" />
            <wire x2="3616" y1="1248" y2="1248" x1="3360" />
            <wire x2="3616" y1="864" y2="864" x1="3360" />
            <wire x2="3616" y1="480" y2="480" x1="3360" />
        </branch>
        <iomarker fontsize="28" x="448" y="3456" name="CE" orien="R180" />
        <branch name="Q(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="416" type="branch" />
            <wire x2="2496" y1="416" y2="416" x1="1984" />
            <wire x2="2608" y1="416" y2="416" x1="2496" />
        </branch>
        <bustap x2="2608" y1="416" y2="416" x1="2624" />
        <branch name="Q(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="800" type="branch" />
            <wire x2="2496" y1="800" y2="800" x1="1984" />
            <wire x2="2608" y1="800" y2="800" x1="2496" />
        </branch>
        <bustap x2="2608" y1="800" y2="800" x1="2624" />
        <branch name="Q(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="1184" type="branch" />
            <wire x2="2496" y1="1184" y2="1184" x1="1984" />
            <wire x2="2608" y1="1184" y2="1184" x1="2496" />
        </branch>
        <bustap x2="2608" y1="1184" y2="1184" x1="2624" />
        <branch name="Q(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="1568" type="branch" />
            <wire x2="2496" y1="1568" y2="1568" x1="1984" />
            <wire x2="2608" y1="1568" y2="1568" x1="2496" />
        </branch>
        <bustap x2="2608" y1="1568" y2="1568" x1="2624" />
        <branch name="Q(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="1952" type="branch" />
            <wire x2="2496" y1="1952" y2="1952" x1="1984" />
            <wire x2="2608" y1="1952" y2="1952" x1="2496" />
        </branch>
        <bustap x2="2608" y1="1952" y2="1952" x1="2624" />
        <branch name="Q(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="2336" type="branch" />
            <wire x2="2496" y1="2336" y2="2336" x1="1984" />
            <wire x2="2608" y1="2336" y2="2336" x1="2496" />
        </branch>
        <bustap x2="2608" y1="2336" y2="2336" x1="2624" />
        <branch name="Q(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="2720" type="branch" />
            <wire x2="2496" y1="2720" y2="2720" x1="1984" />
            <wire x2="2608" y1="2720" y2="2720" x1="2496" />
        </branch>
        <bustap x2="2608" y1="2720" y2="2720" x1="2624" />
        <branch name="Q(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2496" y="3104" type="branch" />
            <wire x2="2496" y1="3104" y2="3104" x1="1984" />
            <wire x2="2608" y1="3104" y2="3104" x1="2496" />
        </branch>
        <bustap x2="2608" y1="3104" y2="3104" x1="2624" />
        <branch name="Q(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="416" type="branch" />
            <wire x2="4512" y1="416" y2="416" x1="4000" />
            <wire x2="4624" y1="416" y2="416" x1="4512" />
        </branch>
        <bustap x2="4624" y1="416" y2="416" x1="4640" />
        <branch name="Q(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="800" type="branch" />
            <wire x2="4512" y1="800" y2="800" x1="4000" />
            <wire x2="4624" y1="800" y2="800" x1="4512" />
        </branch>
        <bustap x2="4624" y1="800" y2="800" x1="4640" />
        <branch name="Q(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="1184" type="branch" />
            <wire x2="4512" y1="1184" y2="1184" x1="4000" />
            <wire x2="4624" y1="1184" y2="1184" x1="4512" />
        </branch>
        <bustap x2="4624" y1="1184" y2="1184" x1="4640" />
        <branch name="Q(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="1568" type="branch" />
            <wire x2="4512" y1="1568" y2="1568" x1="4000" />
            <wire x2="4624" y1="1568" y2="1568" x1="4512" />
        </branch>
        <bustap x2="4624" y1="1568" y2="1568" x1="4640" />
        <branch name="Q(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="1952" type="branch" />
            <wire x2="4512" y1="1952" y2="1952" x1="4000" />
            <wire x2="4624" y1="1952" y2="1952" x1="4512" />
        </branch>
        <bustap x2="4624" y1="1952" y2="1952" x1="4640" />
        <branch name="Q(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="2336" type="branch" />
            <wire x2="4512" y1="2336" y2="2336" x1="4000" />
            <wire x2="4624" y1="2336" y2="2336" x1="4512" />
        </branch>
        <bustap x2="4624" y1="2336" y2="2336" x1="4640" />
        <branch name="Q(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="2720" type="branch" />
            <wire x2="4512" y1="2720" y2="2720" x1="4000" />
            <wire x2="4624" y1="2720" y2="2720" x1="4512" />
        </branch>
        <bustap x2="4624" y1="2720" y2="2720" x1="4640" />
        <branch name="Q(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4512" y="3104" type="branch" />
            <wire x2="4512" y1="3104" y2="3104" x1="4000" />
            <wire x2="4624" y1="3104" y2="3104" x1="4512" />
            <wire x2="4624" y1="3072" y2="3104" x1="4624" />
        </branch>
        <bustap x2="4624" y1="3072" y2="3072" x1="4640" />
        <branch name="Q(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4928" y="3104" type="branch" />
            <wire x2="2624" y1="256" y2="416" x1="2624" />
            <wire x2="2624" y1="416" y2="800" x1="2624" />
            <wire x2="2624" y1="800" y2="1184" x1="2624" />
            <wire x2="2624" y1="1184" y2="1568" x1="2624" />
            <wire x2="2624" y1="1568" y2="1952" x1="2624" />
            <wire x2="2624" y1="1952" y2="2336" x1="2624" />
            <wire x2="2624" y1="2336" y2="2720" x1="2624" />
            <wire x2="2624" y1="2720" y2="3104" x1="2624" />
            <wire x2="4640" y1="256" y2="256" x1="2624" />
            <wire x2="4640" y1="256" y2="416" x1="4640" />
            <wire x2="4640" y1="416" y2="800" x1="4640" />
            <wire x2="4640" y1="800" y2="1184" x1="4640" />
            <wire x2="4640" y1="1184" y2="1568" x1="4640" />
            <wire x2="4640" y1="1568" y2="1952" x1="4640" />
            <wire x2="4640" y1="1952" y2="2336" x1="4640" />
            <wire x2="4640" y1="2336" y2="2720" x1="4640" />
            <wire x2="4640" y1="2720" y2="3072" x1="4640" />
            <wire x2="4640" y1="3072" y2="3104" x1="4640" />
            <wire x2="4928" y1="3104" y2="3104" x1="4640" />
            <wire x2="5152" y1="3104" y2="3104" x1="4928" />
        </branch>
        <iomarker fontsize="28" x="5152" y="3104" name="Q(15:0)" orien="R0" />
        <bustap x2="976" y1="416" y2="416" x1="960" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="416" type="branch" />
            <wire x2="992" y1="416" y2="416" x1="976" />
            <wire x2="1600" y1="416" y2="416" x1="992" />
        </branch>
        <bustap x2="976" y1="800" y2="800" x1="960" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="800" type="branch" />
            <wire x2="992" y1="800" y2="800" x1="976" />
            <wire x2="1600" y1="800" y2="800" x1="992" />
        </branch>
        <bustap x2="976" y1="1184" y2="1184" x1="960" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="1184" type="branch" />
            <wire x2="992" y1="1184" y2="1184" x1="976" />
            <wire x2="1600" y1="1184" y2="1184" x1="992" />
        </branch>
        <bustap x2="976" y1="1568" y2="1568" x1="960" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="1568" type="branch" />
            <wire x2="992" y1="1568" y2="1568" x1="976" />
            <wire x2="1600" y1="1568" y2="1568" x1="992" />
        </branch>
        <bustap x2="976" y1="1952" y2="1952" x1="960" />
        <branch name="D(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="1952" type="branch" />
            <wire x2="992" y1="1952" y2="1952" x1="976" />
            <wire x2="1600" y1="1952" y2="1952" x1="992" />
        </branch>
        <bustap x2="976" y1="2336" y2="2336" x1="960" />
        <branch name="D(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="2336" type="branch" />
            <wire x2="992" y1="2336" y2="2336" x1="976" />
            <wire x2="1600" y1="2336" y2="2336" x1="992" />
        </branch>
        <bustap x2="976" y1="2720" y2="2720" x1="960" />
        <branch name="D(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="2720" type="branch" />
            <wire x2="992" y1="2720" y2="2720" x1="976" />
            <wire x2="1600" y1="2720" y2="2720" x1="992" />
        </branch>
        <bustap x2="976" y1="3104" y2="3104" x1="960" />
        <branch name="D(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="992" y="3104" type="branch" />
            <wire x2="992" y1="3104" y2="3104" x1="976" />
            <wire x2="1600" y1="3104" y2="3104" x1="992" />
        </branch>
        <bustap x2="2992" y1="416" y2="416" x1="2976" />
        <branch name="D(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="416" type="branch" />
            <wire x2="3008" y1="416" y2="416" x1="2992" />
            <wire x2="3616" y1="416" y2="416" x1="3008" />
        </branch>
        <bustap x2="2992" y1="800" y2="800" x1="2976" />
        <branch name="D(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="800" type="branch" />
            <wire x2="3008" y1="800" y2="800" x1="2992" />
            <wire x2="3616" y1="800" y2="800" x1="3008" />
        </branch>
        <bustap x2="2992" y1="1184" y2="1184" x1="2976" />
        <branch name="D(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="1184" type="branch" />
            <wire x2="3008" y1="1184" y2="1184" x1="2992" />
            <wire x2="3616" y1="1184" y2="1184" x1="3008" />
        </branch>
        <bustap x2="2992" y1="1568" y2="1568" x1="2976" />
        <branch name="D(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="1568" type="branch" />
            <wire x2="3008" y1="1568" y2="1568" x1="2992" />
            <wire x2="3616" y1="1568" y2="1568" x1="3008" />
        </branch>
        <bustap x2="2992" y1="1952" y2="1952" x1="2976" />
        <branch name="D(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="1952" type="branch" />
            <wire x2="3008" y1="1952" y2="1952" x1="2992" />
            <wire x2="3616" y1="1952" y2="1952" x1="3008" />
        </branch>
        <bustap x2="2992" y1="2336" y2="2336" x1="2976" />
        <branch name="D(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="2336" type="branch" />
            <wire x2="3008" y1="2336" y2="2336" x1="2992" />
            <wire x2="3616" y1="2336" y2="2336" x1="3008" />
        </branch>
        <bustap x2="2992" y1="2720" y2="2720" x1="2976" />
        <branch name="D(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="2720" type="branch" />
            <wire x2="3008" y1="2720" y2="2720" x1="2992" />
            <wire x2="3616" y1="2720" y2="2720" x1="3008" />
        </branch>
        <bustap x2="2992" y1="3104" y2="3104" x1="2976" />
        <branch name="D(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3008" y="3104" type="branch" />
            <wire x2="3008" y1="3104" y2="3104" x1="2992" />
            <wire x2="3616" y1="3104" y2="3104" x1="3008" />
        </branch>
        <branch name="D(15:0)">
            <wire x2="960" y1="3392" y2="3392" x1="448" />
            <wire x2="2976" y1="3392" y2="3392" x1="960" />
            <wire x2="960" y1="416" y2="800" x1="960" />
            <wire x2="960" y1="800" y2="1184" x1="960" />
            <wire x2="960" y1="1184" y2="1568" x1="960" />
            <wire x2="960" y1="1568" y2="1952" x1="960" />
            <wire x2="960" y1="1952" y2="2336" x1="960" />
            <wire x2="960" y1="2336" y2="2720" x1="960" />
            <wire x2="960" y1="2720" y2="3104" x1="960" />
            <wire x2="960" y1="3104" y2="3392" x1="960" />
            <wire x2="2976" y1="416" y2="800" x1="2976" />
            <wire x2="2976" y1="800" y2="1184" x1="2976" />
            <wire x2="2976" y1="1184" y2="1568" x1="2976" />
            <wire x2="2976" y1="1568" y2="1952" x1="2976" />
            <wire x2="2976" y1="1952" y2="2336" x1="2976" />
            <wire x2="2976" y1="2336" y2="2720" x1="2976" />
            <wire x2="2976" y1="2720" y2="3104" x1="2976" />
            <wire x2="2976" y1="3104" y2="3392" x1="2976" />
        </branch>
        <iomarker fontsize="28" x="448" y="3392" name="D(15:0)" orien="R180" />
    </sheet>
</drawing>