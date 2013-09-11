<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="ClockOUT" />
        <signal name="ClockIN" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="Enable" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <port polarity="Output" name="ClockOUT" />
        <port polarity="Input" name="ClockIN" />
        <port polarity="Input" name="Enable" />
        <blockdef name="bufgctrl">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-288" height="288" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-256" y2="-256" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <block symbolname="bufgctrl" name="XLXI_1">
            <blockpin signalname="ClockIN" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="Enable" name="S0" />
            <blockpin signalname="XLXN_18" name="S1" />
            <blockpin signalname="XLXN_6" name="CE0" />
            <blockpin signalname="XLXN_6" name="CE1" />
            <blockpin signalname="XLXN_5" name="IGNORE0" />
            <blockpin signalname="XLXN_5" name="IGNORE1" />
            <blockpin signalname="ClockOUT" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_5" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_6">
            <blockpin signalname="XLXN_6" name="P" />
        </block>
        <block symbolname="inv" name="XLXI_7">
            <blockpin signalname="Enable" name="I" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="ClockOUT">
            <wire x2="1072" y1="464" y2="464" x1="1040" />
        </branch>
        <iomarker fontsize="28" x="1072" y="464" name="ClockOUT" orien="R0" />
        <branch name="ClockIN">
            <wire x2="656" y1="464" y2="464" x1="576" />
        </branch>
        <iomarker fontsize="28" x="576" y="464" name="ClockIN" orien="R180" />
        <branch name="XLXN_6">
            <wire x2="544" y1="624" y2="624" x1="464" />
            <wire x2="656" y1="624" y2="624" x1="544" />
            <wire x2="544" y1="592" y2="624" x1="544" />
            <wire x2="656" y1="592" y2="592" x1="544" />
        </branch>
        <branch name="Enable">
            <wire x2="256" y1="512" y2="512" x1="224" />
            <wire x2="640" y1="512" y2="512" x1="256" />
            <wire x2="640" y1="512" y2="528" x1="640" />
            <wire x2="656" y1="528" y2="528" x1="640" />
            <wire x2="256" y1="512" y2="832" x1="256" />
            <wire x2="336" y1="832" y2="832" x1="256" />
        </branch>
        <instance x="656" y="720" name="XLXI_1" orien="R0">
        </instance>
        <instance x="336" y="496" name="XLXI_5" orien="R90" />
        <instance x="464" y="688" name="XLXI_6" orien="R270" />
        <branch name="XLXN_5">
            <wire x2="576" y1="560" y2="560" x1="464" />
            <wire x2="576" y1="560" y2="656" x1="576" />
            <wire x2="656" y1="656" y2="656" x1="576" />
            <wire x2="576" y1="656" y2="688" x1="576" />
            <wire x2="656" y1="688" y2="688" x1="576" />
            <wire x2="656" y1="496" y2="496" x1="576" />
            <wire x2="576" y1="496" y2="560" x1="576" />
        </branch>
        <instance x="336" y="864" name="XLXI_7" orien="R0" />
        <iomarker fontsize="28" x="224" y="512" name="Enable" orien="R180" />
        <branch name="XLXN_18">
            <wire x2="608" y1="832" y2="832" x1="560" />
            <wire x2="608" y1="560" y2="832" x1="608" />
            <wire x2="656" y1="560" y2="560" x1="608" />
        </branch>
    </sheet>
</drawing>