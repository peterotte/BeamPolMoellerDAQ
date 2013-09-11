<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="virtex4" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CE" />
        <signal name="CLR" />
        <signal name="TQ5" />
        <signal name="C7" />
        <signal name="C6" />
        <signal name="TQ0" />
        <signal name="TQ1" />
        <signal name="C1" />
        <signal name="C2" />
        <signal name="C0" />
        <signal name="TQ14" />
        <signal name="TQ15" />
        <signal name="CEO" />
        <signal name="TC" />
        <signal name="TQ13" />
        <signal name="TQ12" />
        <signal name="TQ11" />
        <signal name="TQ10" />
        <signal name="TQ9" />
        <signal name="TQ8" />
        <signal name="TQ7" />
        <signal name="TQ6" />
        <signal name="TQ4" />
        <signal name="TQ3" />
        <signal name="TQ2" />
        <signal name="C12" />
        <signal name="C11" />
        <signal name="C15" />
        <signal name="C14" />
        <signal name="C13" />
        <signal name="C10" />
        <signal name="C9" />
        <signal name="C8" />
        <signal name="C5" />
        <signal name="C4" />
        <signal name="C3" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
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
        <signal name="XLXN_40" />
        <signal name="TC_1" />
        <signal name="C" />
        <port polarity="Input" name="CE" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="CEO" />
        <port polarity="Output" name="TC" />
        <port polarity="Output" name="Q(15:0)" />
        <port polarity="Input" name="C" />
        <blockdef name="and2">
            <timestamp>2001-5-4T10:11:28</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2001-5-4T10:11:28</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2001-5-4T10:11:28</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="fdce">
            <timestamp>2001-5-4T10:11:28</timestamp>
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
        <blockdef name="muxcy_l">
            <timestamp>2001-5-4T10:11:28</timestamp>
            <line x2="192" y1="0" y2="-64" x1="192" />
            <line x2="128" y1="-224" y2="-160" x1="128" />
            <line x2="32" y1="-160" y2="-64" x1="96" />
            <line x2="96" y1="-160" y2="-160" x1="224" />
            <line x2="224" y1="-64" y2="-160" x1="288" />
            <line x2="288" y1="-64" y2="-64" x1="32" />
            <line x2="128" y1="0" y2="-64" x1="128" />
            <line x2="56" y1="-96" y2="-96" x1="0" />
        </blockdef>
        <blockdef name="xorcy">
            <timestamp>2001-5-4T10:11:28</timestamp>
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
        </blockdef>
        <blockdef name="muxcy">
            <timestamp>2001-5-4T10:11:28</timestamp>
            <line x2="192" y1="0" y2="-64" x1="192" />
            <line x2="192" y1="-224" y2="-160" x1="192" />
            <line x2="32" y1="-160" y2="-64" x1="96" />
            <line x2="96" y1="-160" y2="-160" x1="224" />
            <line x2="224" y1="-64" y2="-160" x1="288" />
            <line x2="288" y1="-64" y2="-64" x1="32" />
            <line x2="128" y1="0" y2="-64" x1="128" />
            <line x2="56" y1="-96" y2="-96" x1="0" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2001-2-2T12:38:38</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2001-2-2T12:38:38</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="vcc" name="I_36_923">
            <blockpin signalname="C0" name="P" />
        </block>
        <block symbolname="gnd" name="I_36_886">
            <blockpin signalname="XLXN_38" name="G" />
        </block>
        <block symbolname="gnd" name="I_36_1269">
            <blockpin signalname="XLXN_39" name="G" />
        </block>
        <block symbolname="fdce" name="I_36_263">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ5" name="D" />
            <blockpin signalname="Q(5)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_36">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ0" name="D" />
            <blockpin signalname="Q(0)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_35">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ1" name="D" />
            <blockpin signalname="Q(1)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1101">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ14" name="D" />
            <blockpin signalname="Q(14)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1113">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ15" name="D" />
            <blockpin signalname="Q(15)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1114">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ13" name="D" />
            <blockpin signalname="Q(13)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1102">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ12" name="D" />
            <blockpin signalname="Q(12)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1116">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ11" name="D" />
            <blockpin signalname="Q(11)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1104">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ10" name="D" />
            <blockpin signalname="Q(10)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1118">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ9" name="D" />
            <blockpin signalname="Q(9)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_1095">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ8" name="D" />
            <blockpin signalname="Q(8)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_289">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ7" name="D" />
            <blockpin signalname="Q(7)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_276">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ6" name="D" />
            <blockpin signalname="Q(6)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_250">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ4" name="D" />
            <blockpin signalname="Q(4)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_237">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ3" name="D" />
            <blockpin signalname="Q(3)" name="Q" />
        </block>
        <block symbolname="fdce" name="I_36_224">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C" name="C" />
            <blockpin signalname="CE" name="CE" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="TQ2" name="D" />
            <blockpin signalname="Q(2)" name="Q" />
        </block>
        <block symbolname="muxcy_l" name="I_36_285">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C6" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(6)" name="S" />
            <blockpin signalname="C7" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_26">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C1" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(1)" name="S" />
            <blockpin signalname="C2" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_4">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C0" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(0)" name="S" />
            <blockpin signalname="C1" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1144">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C11" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(11)" name="S" />
            <blockpin signalname="C12" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1141">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C14" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(14)" name="S" />
            <blockpin signalname="C15" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1142">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C13" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(13)" name="S" />
            <blockpin signalname="C14" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1143">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C12" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(12)" name="S" />
            <blockpin signalname="C13" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1145">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C10" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(10)" name="S" />
            <blockpin signalname="C11" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1146">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C9" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(9)" name="S" />
            <blockpin signalname="C10" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_1147">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C8" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(8)" name="S" />
            <blockpin signalname="C9" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_298">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C7" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(7)" name="S" />
            <blockpin signalname="C8" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_272">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C5" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(5)" name="S" />
            <blockpin signalname="C6" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_259">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C4" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(4)" name="S" />
            <blockpin signalname="C5" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_246">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C3" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(3)" name="S" />
            <blockpin signalname="C4" name="LO" />
        </block>
        <block symbolname="muxcy_l" name="I_36_233">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C2" name="CI" />
            <blockpin signalname="XLXN_38" name="DI" />
            <blockpin signalname="Q(2)" name="S" />
            <blockpin signalname="C3" name="LO" />
        </block>
        <block symbolname="xorcy" name="I_36_28">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C1" name="CI" />
            <blockpin signalname="Q(1)" name="LI" />
            <blockpin signalname="TQ1" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_6">
            <attr value="X0Y0" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C0" name="CI" />
            <blockpin signalname="Q(0)" name="LI" />
            <blockpin signalname="TQ0" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_291">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C7" name="CI" />
            <blockpin signalname="Q(7)" name="LI" />
            <blockpin signalname="TQ7" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_278">
            <attr value="X0Y3" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C6" name="CI" />
            <blockpin signalname="Q(6)" name="LI" />
            <blockpin signalname="TQ6" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_265">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C5" name="CI" />
            <blockpin signalname="Q(5)" name="LI" />
            <blockpin signalname="TQ5" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_252">
            <attr value="X0Y2" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C4" name="CI" />
            <blockpin signalname="Q(4)" name="LI" />
            <blockpin signalname="TQ4" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_239">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C3" name="CI" />
            <blockpin signalname="Q(3)" name="LI" />
            <blockpin signalname="TQ3" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_226">
            <attr value="X0Y1" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C2" name="CI" />
            <blockpin signalname="Q(2)" name="LI" />
            <blockpin signalname="TQ2" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1112">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C15" name="CI" />
            <blockpin signalname="Q(15)" name="LI" />
            <blockpin signalname="TQ15" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1100">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C14" name="CI" />
            <blockpin signalname="Q(14)" name="LI" />
            <blockpin signalname="TQ14" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1115">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C13" name="CI" />
            <blockpin signalname="Q(13)" name="LI" />
            <blockpin signalname="TQ13" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1103">
            <attr value="X0Y6" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C12" name="CI" />
            <blockpin signalname="Q(12)" name="LI" />
            <blockpin signalname="TQ12" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1117">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C11" name="CI" />
            <blockpin signalname="Q(11)" name="LI" />
            <blockpin signalname="TQ11" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1105">
            <attr value="X0Y5" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C10" name="CI" />
            <blockpin signalname="Q(10)" name="LI" />
            <blockpin signalname="TQ10" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1119">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C9" name="CI" />
            <blockpin signalname="Q(9)" name="LI" />
            <blockpin signalname="TQ9" name="O" />
        </block>
        <block symbolname="xorcy" name="I_36_1106">
            <attr value="X0Y4" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C8" name="CI" />
            <blockpin signalname="Q(8)" name="LI" />
            <blockpin signalname="TQ8" name="O" />
        </block>
        <block symbolname="muxcy" name="I_36_1140">
            <attr value="X0Y7" name="RLOC">
                <trait verilog="all:0 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="MUXCY_L" name="VhdlModel">
                <trait verilog="all:0 wsynop:1 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <attr value="MUXCY_L" name="VeriModel">
                <trait verilog="all:0 wsynop:1 wsynth:1" />
                <trait vhdl="all:0 wa:1 wd:1" />
            </attr>
            <blockpin signalname="C15" name="CI" />
            <blockpin signalname="XLXN_39" name="DI" />
            <blockpin signalname="Q(15)" name="S" />
            <blockpin signalname="TC_1" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="TC_1" name="I1" />
            <blockpin signalname="TC" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_2">
            <blockpin signalname="XLXN_40" name="I0" />
            <blockpin signalname="CE" name="I1" />
            <blockpin signalname="TC_1" name="I2" />
            <blockpin signalname="CEO" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="CLR" name="I" />
            <blockpin signalname="XLXN_40" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="11200" height="7360">
        <instance x="2976" y="5696" name="I_36_923" orien="R0" />
        <instance x="2976" y="5552" name="I_36_886" orien="R0" />
        <instance x="6304" y="5568" name="I_36_1269" orien="R0" />
        <instance x="4432" y="3200" name="I_36_263" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="5664" name="I_36_36" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="5184" name="I_36_35" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="2704" name="I_36_1101" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="2208" name="I_36_1113" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="3200" name="I_36_1114" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="3680" name="I_36_1102" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="4192" name="I_36_1116" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="4672" name="I_36_1104" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="5184" name="I_36_1118" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="7760" y="5664" name="I_36_1095" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="2208" name="I_36_289" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="2704" name="I_36_276" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="3680" name="I_36_250" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="4192" name="I_36_237" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="4432" y="4672" name="I_36_224" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-404" type="instance" />
        </instance>
        <instance x="3200" y="2336" name="I_36_285" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="4832" name="I_36_26" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="5312" name="I_36_4" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="3840" name="I_36_1144" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="2336" name="I_36_1141" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="2848" name="I_36_1142" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="3328" name="I_36_1143" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="4320" name="I_36_1145" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="4832" name="I_36_1146" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="6528" y="5312" name="I_36_1147" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="1856" name="I_36_298" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="2848" name="I_36_272" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="3328" name="I_36_259" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="3840" name="I_36_246" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3200" y="4320" name="I_36_233" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <instance x="3776" y="5024" name="I_36_28" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="5504" name="I_36_6" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="2048" name="I_36_291" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="2544" name="I_36_278" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="3040" name="I_36_265" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="3520" name="I_36_252" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="4032" name="I_36_239" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="3776" y="4512" name="I_36_226" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="2048" name="I_36_1112" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="2544" name="I_36_1100" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="3040" name="I_36_1115" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="3520" name="I_36_1103" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="4032" name="I_36_1117" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="4512" name="I_36_1105" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="5024" name="I_36_1119" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="7104" y="5504" name="I_36_1106" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-164" type="instance" />
        </instance>
        <instance x="6528" y="1856" name="I_36_1140" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="RLOC" x="0" y="-224" type="instance" />
        </instance>
        <iomarker fontsize="28" x="1440" y="5920" name="CE" orien="R180" />
        <branch name="CLR">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1456" y="6048" type="branch" />
            <wire x2="1456" y1="6048" y2="6048" x1="1440" />
            <wire x2="4352" y1="6048" y2="6048" x1="1456" />
            <wire x2="7680" y1="6048" y2="6048" x1="4352" />
            <wire x2="4352" y1="2176" y2="2672" x1="4352" />
            <wire x2="4352" y1="2672" y2="3168" x1="4352" />
            <wire x2="4352" y1="3168" y2="3648" x1="4352" />
            <wire x2="4352" y1="3648" y2="4160" x1="4352" />
            <wire x2="4352" y1="4160" y2="4640" x1="4352" />
            <wire x2="4352" y1="4640" y2="5152" x1="4352" />
            <wire x2="4352" y1="5152" y2="5632" x1="4352" />
            <wire x2="4352" y1="5632" y2="6048" x1="4352" />
            <wire x2="4432" y1="5632" y2="5632" x1="4352" />
            <wire x2="4432" y1="5152" y2="5152" x1="4352" />
            <wire x2="4432" y1="4640" y2="4640" x1="4352" />
            <wire x2="4432" y1="4160" y2="4160" x1="4352" />
            <wire x2="4432" y1="3648" y2="3648" x1="4352" />
            <wire x2="4432" y1="3168" y2="3168" x1="4352" />
            <wire x2="4432" y1="2672" y2="2672" x1="4352" />
            <wire x2="4432" y1="2176" y2="2176" x1="4352" />
            <wire x2="7680" y1="1360" y2="2176" x1="7680" />
            <wire x2="7680" y1="2176" y2="2672" x1="7680" />
            <wire x2="7680" y1="2672" y2="3168" x1="7680" />
            <wire x2="7680" y1="3168" y2="3648" x1="7680" />
            <wire x2="7680" y1="3648" y2="4160" x1="7680" />
            <wire x2="7680" y1="4160" y2="4640" x1="7680" />
            <wire x2="7680" y1="4640" y2="5152" x1="7680" />
            <wire x2="7680" y1="5152" y2="5632" x1="7680" />
            <wire x2="7680" y1="5632" y2="6048" x1="7680" />
            <wire x2="7760" y1="5632" y2="5632" x1="7680" />
            <wire x2="7760" y1="5152" y2="5152" x1="7680" />
            <wire x2="7760" y1="4640" y2="4640" x1="7680" />
            <wire x2="7760" y1="4160" y2="4160" x1="7680" />
            <wire x2="7760" y1="3648" y2="3648" x1="7680" />
            <wire x2="7760" y1="3168" y2="3168" x1="7680" />
            <wire x2="7760" y1="2672" y2="2672" x1="7680" />
            <wire x2="7760" y1="2176" y2="2176" x1="7680" />
            <wire x2="7856" y1="1360" y2="1360" x1="7680" />
        </branch>
        <iomarker fontsize="28" x="1440" y="6048" name="CLR" orien="R180" />
        <iomarker fontsize="28" x="1440" y="5984" name="C" orien="R180" />
        <branch name="TQ5">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4048" y="2944" type="branch" />
            <wire x2="4048" y1="2944" y2="2944" x1="4032" />
            <wire x2="4432" y1="2944" y2="2944" x1="4048" />
        </branch>
        <branch name="C7">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="2080" type="branch" />
            <wire x2="3328" y1="2016" y2="2080" x1="3328" />
            <wire x2="3328" y1="2080" y2="2112" x1="3328" />
            <wire x2="3392" y1="2016" y2="2016" x1="3328" />
            <wire x2="3392" y1="1856" y2="1984" x1="3392" />
            <wire x2="3392" y1="1984" y2="2016" x1="3392" />
            <wire x2="3776" y1="1984" y2="1984" x1="3392" />
        </branch>
        <branch name="C6">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="2592" type="branch" />
            <wire x2="3328" y1="2528" y2="2592" x1="3328" />
            <wire x2="3328" y1="2592" y2="2624" x1="3328" />
            <wire x2="3392" y1="2528" y2="2528" x1="3328" />
            <wire x2="3392" y1="2336" y2="2480" x1="3392" />
            <wire x2="3392" y1="2480" y2="2528" x1="3392" />
            <wire x2="3776" y1="2480" y2="2480" x1="3392" />
        </branch>
        <branch name="TQ0">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4048" y="5408" type="branch" />
            <wire x2="4048" y1="5408" y2="5408" x1="4032" />
            <wire x2="4432" y1="5408" y2="5408" x1="4048" />
        </branch>
        <branch name="TQ1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4064" y="4928" type="branch" />
            <wire x2="4064" y1="4928" y2="4928" x1="4032" />
            <wire x2="4432" y1="4928" y2="4928" x1="4064" />
        </branch>
        <branch name="C1">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="5056" type="branch" />
            <wire x2="3328" y1="4992" y2="5056" x1="3328" />
            <wire x2="3328" y1="5056" y2="5088" x1="3328" />
            <wire x2="3392" y1="4992" y2="4992" x1="3328" />
            <wire x2="3392" y1="4832" y2="4960" x1="3392" />
            <wire x2="3392" y1="4960" y2="4992" x1="3392" />
            <wire x2="3776" y1="4960" y2="4960" x1="3392" />
        </branch>
        <branch name="C2">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="4576" type="branch" />
            <wire x2="3328" y1="4512" y2="4576" x1="3328" />
            <wire x2="3328" y1="4576" y2="4608" x1="3328" />
            <wire x2="3392" y1="4512" y2="4512" x1="3328" />
            <wire x2="3392" y1="4320" y2="4448" x1="3392" />
            <wire x2="3392" y1="4448" y2="4512" x1="3392" />
            <wire x2="3776" y1="4448" y2="4448" x1="3392" />
        </branch>
        <branch name="C0">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3392" y="5536" type="branch" />
            <wire x2="3040" y1="5696" y2="5728" x1="3040" />
            <wire x2="3392" y1="5728" y2="5728" x1="3040" />
            <wire x2="3392" y1="5312" y2="5440" x1="3392" />
            <wire x2="3392" y1="5440" y2="5536" x1="3392" />
            <wire x2="3392" y1="5536" y2="5728" x1="3392" />
            <wire x2="3776" y1="5440" y2="5440" x1="3392" />
        </branch>
        <branch name="TQ14">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7376" y="2448" type="branch" />
            <wire x2="7376" y1="2448" y2="2448" x1="7360" />
            <wire x2="7760" y1="2448" y2="2448" x1="7376" />
        </branch>
        <branch name="TQ15">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7376" y="1952" type="branch" />
            <wire x2="7376" y1="1952" y2="1952" x1="7360" />
            <wire x2="7760" y1="1952" y2="1952" x1="7376" />
        </branch>
        <branch name="TQ13">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7376" y="2944" type="branch" />
            <wire x2="7376" y1="2944" y2="2944" x1="7360" />
            <wire x2="7760" y1="2944" y2="2944" x1="7376" />
        </branch>
        <branch name="TQ12">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7376" y="3424" type="branch" />
            <wire x2="7376" y1="3424" y2="3424" x1="7360" />
            <wire x2="7760" y1="3424" y2="3424" x1="7376" />
        </branch>
        <branch name="TQ11">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7376" y="3936" type="branch" />
            <wire x2="7376" y1="3936" y2="3936" x1="7360" />
            <wire x2="7760" y1="3936" y2="3936" x1="7376" />
        </branch>
        <branch name="TQ10">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7392" y="4416" type="branch" />
            <wire x2="7392" y1="4416" y2="4416" x1="7360" />
            <wire x2="7760" y1="4416" y2="4416" x1="7392" />
        </branch>
        <branch name="TQ9">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7392" y="4928" type="branch" />
            <wire x2="7392" y1="4928" y2="4928" x1="7360" />
            <wire x2="7760" y1="4928" y2="4928" x1="7392" />
        </branch>
        <branch name="TQ8">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="7376" y="5408" type="branch" />
            <wire x2="7376" y1="5408" y2="5408" x1="7360" />
            <wire x2="7760" y1="5408" y2="5408" x1="7376" />
        </branch>
        <branch name="TQ7">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4048" y="1952" type="branch" />
            <wire x2="4048" y1="1952" y2="1952" x1="4032" />
            <wire x2="4432" y1="1952" y2="1952" x1="4048" />
        </branch>
        <branch name="TQ6">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4048" y="2448" type="branch" />
            <wire x2="4048" y1="2448" y2="2448" x1="4032" />
            <wire x2="4432" y1="2448" y2="2448" x1="4048" />
        </branch>
        <branch name="TQ4">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4048" y="3424" type="branch" />
            <wire x2="4048" y1="3424" y2="3424" x1="4032" />
            <wire x2="4432" y1="3424" y2="3424" x1="4048" />
        </branch>
        <branch name="TQ3">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4048" y="3936" type="branch" />
            <wire x2="4048" y1="3936" y2="3936" x1="4032" />
            <wire x2="4432" y1="3936" y2="3936" x1="4048" />
        </branch>
        <branch name="TQ2">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="4064" y="4416" type="branch" />
            <wire x2="4064" y1="4416" y2="4416" x1="4032" />
            <wire x2="4432" y1="4416" y2="4416" x1="4064" />
        </branch>
        <branch name="C12">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="3584" type="branch" />
            <wire x2="6656" y1="3520" y2="3584" x1="6656" />
            <wire x2="6656" y1="3584" y2="3616" x1="6656" />
            <wire x2="6720" y1="3520" y2="3520" x1="6656" />
            <wire x2="6720" y1="3328" y2="3456" x1="6720" />
            <wire x2="6720" y1="3456" y2="3520" x1="6720" />
            <wire x2="7104" y1="3456" y2="3456" x1="6720" />
        </branch>
        <branch name="C11">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="4064" type="branch" />
            <wire x2="6656" y1="4000" y2="4064" x1="6656" />
            <wire x2="6656" y1="4064" y2="4096" x1="6656" />
            <wire x2="6720" y1="4000" y2="4000" x1="6656" />
            <wire x2="6720" y1="3840" y2="3968" x1="6720" />
            <wire x2="6720" y1="3968" y2="4000" x1="6720" />
            <wire x2="7104" y1="3968" y2="3968" x1="6720" />
        </branch>
        <branch name="C15">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="2080" type="branch" />
            <wire x2="6656" y1="2016" y2="2080" x1="6656" />
            <wire x2="6656" y1="2080" y2="2112" x1="6656" />
            <wire x2="6720" y1="2016" y2="2016" x1="6656" />
            <wire x2="6720" y1="1856" y2="1984" x1="6720" />
            <wire x2="6720" y1="1984" y2="2016" x1="6720" />
            <wire x2="7104" y1="1984" y2="1984" x1="6720" />
        </branch>
        <branch name="C14">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="2592" type="branch" />
            <wire x2="6656" y1="2528" y2="2592" x1="6656" />
            <wire x2="6656" y1="2592" y2="2624" x1="6656" />
            <wire x2="6720" y1="2528" y2="2528" x1="6656" />
            <wire x2="6720" y1="2336" y2="2480" x1="6720" />
            <wire x2="6720" y1="2480" y2="2528" x1="6720" />
            <wire x2="7104" y1="2480" y2="2480" x1="6720" />
        </branch>
        <branch name="C13">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="3072" type="branch" />
            <wire x2="6656" y1="3008" y2="3072" x1="6656" />
            <wire x2="6656" y1="3072" y2="3104" x1="6656" />
            <wire x2="6720" y1="3008" y2="3008" x1="6656" />
            <wire x2="6720" y1="2848" y2="2976" x1="6720" />
            <wire x2="6720" y1="2976" y2="3008" x1="6720" />
            <wire x2="7104" y1="2976" y2="2976" x1="6720" />
        </branch>
        <branch name="C10">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="4576" type="branch" />
            <wire x2="6656" y1="4512" y2="4576" x1="6656" />
            <wire x2="6656" y1="4576" y2="4608" x1="6656" />
            <wire x2="6720" y1="4512" y2="4512" x1="6656" />
            <wire x2="6720" y1="4320" y2="4448" x1="6720" />
            <wire x2="6720" y1="4448" y2="4512" x1="6720" />
            <wire x2="7104" y1="4448" y2="4448" x1="6720" />
        </branch>
        <branch name="C9">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6656" y="5072" type="branch" />
            <wire x2="6656" y1="5024" y2="5072" x1="6656" />
            <wire x2="6656" y1="5072" y2="5088" x1="6656" />
            <wire x2="6720" y1="5024" y2="5024" x1="6656" />
            <wire x2="6720" y1="4832" y2="4960" x1="6720" />
            <wire x2="6720" y1="4960" y2="5024" x1="6720" />
            <wire x2="7104" y1="4960" y2="4960" x1="6720" />
        </branch>
        <branch name="C8">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="6720" y="5504" type="branch" />
            <wire x2="3328" y1="1312" y2="1632" x1="3328" />
            <wire x2="5248" y1="1312" y2="1312" x1="3328" />
            <wire x2="5248" y1="1312" y2="5600" x1="5248" />
            <wire x2="6720" y1="5600" y2="5600" x1="5248" />
            <wire x2="6720" y1="5312" y2="5440" x1="6720" />
            <wire x2="6720" y1="5440" y2="5504" x1="6720" />
            <wire x2="6720" y1="5504" y2="5600" x1="6720" />
            <wire x2="7104" y1="5440" y2="5440" x1="6720" />
        </branch>
        <branch name="C5">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="3072" type="branch" />
            <wire x2="3328" y1="3008" y2="3072" x1="3328" />
            <wire x2="3328" y1="3072" y2="3104" x1="3328" />
            <wire x2="3392" y1="3008" y2="3008" x1="3328" />
            <wire x2="3392" y1="2848" y2="2976" x1="3392" />
            <wire x2="3392" y1="2976" y2="3008" x1="3392" />
            <wire x2="3776" y1="2976" y2="2976" x1="3392" />
        </branch>
        <branch name="C4">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="3584" type="branch" />
            <wire x2="3328" y1="3520" y2="3584" x1="3328" />
            <wire x2="3328" y1="3584" y2="3616" x1="3328" />
            <wire x2="3392" y1="3520" y2="3520" x1="3328" />
            <wire x2="3392" y1="3328" y2="3456" x1="3392" />
            <wire x2="3392" y1="3456" y2="3520" x1="3392" />
            <wire x2="3776" y1="3456" y2="3456" x1="3392" />
        </branch>
        <branch name="C3">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3328" y="4064" type="branch" />
            <wire x2="3328" y1="4000" y2="4064" x1="3328" />
            <wire x2="3328" y1="4064" y2="4096" x1="3328" />
            <wire x2="3392" y1="4000" y2="4000" x1="3328" />
            <wire x2="3392" y1="3840" y2="3968" x1="3392" />
            <wire x2="3392" y1="3968" y2="4000" x1="3392" />
            <wire x2="3776" y1="3968" y2="3968" x1="3392" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="3040" y1="1968" y2="2464" x1="3040" />
            <wire x2="3040" y1="2464" y2="2960" x1="3040" />
            <wire x2="3040" y1="2960" y2="3488" x1="3040" />
            <wire x2="3040" y1="3488" y2="3888" x1="3040" />
            <wire x2="3040" y1="3888" y2="4416" x1="3040" />
            <wire x2="3040" y1="4416" y2="4944" x1="3040" />
            <wire x2="3040" y1="4944" y2="5408" x1="3040" />
            <wire x2="3040" y1="5408" y2="5424" x1="3040" />
            <wire x2="3328" y1="5408" y2="5408" x1="3040" />
            <wire x2="3328" y1="4944" y2="4944" x1="3040" />
            <wire x2="3328" y1="4416" y2="4416" x1="3040" />
            <wire x2="3328" y1="3888" y2="3888" x1="3040" />
            <wire x2="3328" y1="3488" y2="3488" x1="3040" />
            <wire x2="3328" y1="2960" y2="2960" x1="3040" />
            <wire x2="3328" y1="2464" y2="2464" x1="3040" />
            <wire x2="3328" y1="1968" y2="1968" x1="3040" />
            <wire x2="3328" y1="1856" y2="1968" x1="3328" />
            <wire x2="3328" y1="2336" y2="2464" x1="3328" />
            <wire x2="3328" y1="2848" y2="2960" x1="3328" />
            <wire x2="3328" y1="3328" y2="3488" x1="3328" />
            <wire x2="3328" y1="3840" y2="3888" x1="3328" />
            <wire x2="3328" y1="4320" y2="4416" x1="3328" />
            <wire x2="3328" y1="4832" y2="4944" x1="3328" />
            <wire x2="3328" y1="5312" y2="5408" x1="3328" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="6368" y1="1968" y2="2464" x1="6368" />
            <wire x2="6368" y1="2464" y2="2960" x1="6368" />
            <wire x2="6368" y1="2960" y2="3456" x1="6368" />
            <wire x2="6368" y1="3456" y2="3952" x1="6368" />
            <wire x2="6368" y1="3952" y2="4448" x1="6368" />
            <wire x2="6368" y1="4448" y2="4944" x1="6368" />
            <wire x2="6368" y1="4944" y2="5408" x1="6368" />
            <wire x2="6368" y1="5408" y2="5440" x1="6368" />
            <wire x2="6656" y1="5408" y2="5408" x1="6368" />
            <wire x2="6656" y1="4944" y2="4944" x1="6368" />
            <wire x2="6656" y1="4448" y2="4448" x1="6368" />
            <wire x2="6656" y1="3952" y2="3952" x1="6368" />
            <wire x2="6656" y1="3456" y2="3456" x1="6368" />
            <wire x2="6656" y1="2960" y2="2960" x1="6368" />
            <wire x2="6656" y1="2464" y2="2464" x1="6368" />
            <wire x2="6656" y1="1968" y2="1968" x1="6368" />
            <wire x2="6656" y1="1856" y2="1968" x1="6656" />
            <wire x2="6656" y1="2336" y2="2464" x1="6656" />
            <wire x2="6656" y1="2848" y2="2960" x1="6656" />
            <wire x2="6656" y1="3328" y2="3456" x1="6656" />
            <wire x2="6656" y1="3840" y2="3952" x1="6656" />
            <wire x2="6656" y1="4320" y2="4448" x1="6656" />
            <wire x2="6656" y1="4832" y2="4944" x1="6656" />
            <wire x2="6656" y1="5312" y2="5408" x1="6656" />
        </branch>
        <branch name="Q(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="5216" type="branch" />
            <wire x2="2816" y1="5216" y2="5216" x1="2800" />
            <wire x2="3104" y1="5216" y2="5216" x1="2816" />
            <wire x2="3104" y1="5216" y2="5376" x1="3104" />
            <wire x2="3776" y1="5376" y2="5376" x1="3104" />
            <wire x2="3200" y1="5216" y2="5216" x1="3104" />
        </branch>
        <bustap x2="2800" y1="5216" y2="5216" x1="2784" />
        <branch name="Q(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="5408" type="branch" />
            <wire x2="5040" y1="5408" y2="5408" x1="4816" />
            <wire x2="5136" y1="5408" y2="5408" x1="5040" />
        </branch>
        <bustap x2="5136" y1="5408" y2="5408" x1="5152" />
        <branch name="Q(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="4736" type="branch" />
            <wire x2="2816" y1="4736" y2="4736" x1="2800" />
            <wire x2="3104" y1="4736" y2="4736" x1="2816" />
            <wire x2="3104" y1="4736" y2="4896" x1="3104" />
            <wire x2="3776" y1="4896" y2="4896" x1="3104" />
            <wire x2="3200" y1="4736" y2="4736" x1="3104" />
        </branch>
        <bustap x2="2800" y1="4736" y2="4736" x1="2784" />
        <branch name="Q(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="4928" type="branch" />
            <wire x2="5040" y1="4928" y2="4928" x1="4816" />
            <wire x2="5136" y1="4928" y2="4928" x1="5040" />
        </branch>
        <bustap x2="5136" y1="4928" y2="4928" x1="5152" />
        <branch name="Q(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="4224" type="branch" />
            <wire x2="2816" y1="4224" y2="4224" x1="2800" />
            <wire x2="3136" y1="4224" y2="4224" x1="2816" />
            <wire x2="3136" y1="4224" y2="4384" x1="3136" />
            <wire x2="3776" y1="4384" y2="4384" x1="3136" />
            <wire x2="3200" y1="4224" y2="4224" x1="3136" />
        </branch>
        <bustap x2="2800" y1="4224" y2="4224" x1="2784" />
        <branch name="Q(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="4416" type="branch" />
            <wire x2="5040" y1="4416" y2="4416" x1="4816" />
            <wire x2="5136" y1="4416" y2="4416" x1="5040" />
        </branch>
        <bustap x2="5136" y1="4416" y2="4416" x1="5152" />
        <branch name="Q(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="3744" type="branch" />
            <wire x2="2816" y1="3744" y2="3744" x1="2800" />
            <wire x2="3136" y1="3744" y2="3744" x1="2816" />
            <wire x2="3136" y1="3744" y2="3904" x1="3136" />
            <wire x2="3776" y1="3904" y2="3904" x1="3136" />
            <wire x2="3200" y1="3744" y2="3744" x1="3136" />
        </branch>
        <bustap x2="2800" y1="3744" y2="3744" x1="2784" />
        <branch name="Q(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="3936" type="branch" />
            <wire x2="5040" y1="3936" y2="3936" x1="4816" />
            <wire x2="5136" y1="3936" y2="3936" x1="5040" />
        </branch>
        <bustap x2="5136" y1="3936" y2="3936" x1="5152" />
        <branch name="Q(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="3232" type="branch" />
            <wire x2="2816" y1="3232" y2="3232" x1="2800" />
            <wire x2="3104" y1="3232" y2="3232" x1="2816" />
            <wire x2="3104" y1="3232" y2="3392" x1="3104" />
            <wire x2="3776" y1="3392" y2="3392" x1="3104" />
            <wire x2="3200" y1="3232" y2="3232" x1="3104" />
        </branch>
        <bustap x2="2800" y1="3232" y2="3232" x1="2784" />
        <branch name="Q(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="3424" type="branch" />
            <wire x2="5040" y1="3424" y2="3424" x1="4816" />
            <wire x2="5136" y1="3424" y2="3424" x1="5040" />
        </branch>
        <bustap x2="5136" y1="3424" y2="3424" x1="5152" />
        <branch name="Q(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="2752" type="branch" />
            <wire x2="2816" y1="2752" y2="2752" x1="2800" />
            <wire x2="3136" y1="2752" y2="2752" x1="2816" />
            <wire x2="3136" y1="2752" y2="2912" x1="3136" />
            <wire x2="3776" y1="2912" y2="2912" x1="3136" />
            <wire x2="3200" y1="2752" y2="2752" x1="3136" />
        </branch>
        <bustap x2="2800" y1="2752" y2="2752" x1="2784" />
        <branch name="Q(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="2944" type="branch" />
            <wire x2="5040" y1="2944" y2="2944" x1="4816" />
            <wire x2="5136" y1="2944" y2="2944" x1="5040" />
        </branch>
        <bustap x2="5136" y1="2944" y2="2944" x1="5152" />
        <branch name="Q(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="2240" type="branch" />
            <wire x2="2816" y1="2240" y2="2240" x1="2800" />
            <wire x2="3136" y1="2240" y2="2240" x1="2816" />
            <wire x2="3136" y1="2240" y2="2416" x1="3136" />
            <wire x2="3776" y1="2416" y2="2416" x1="3136" />
            <wire x2="3200" y1="2240" y2="2240" x1="3136" />
        </branch>
        <bustap x2="2800" y1="2240" y2="2240" x1="2784" />
        <branch name="Q(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="2448" type="branch" />
            <wire x2="5040" y1="2448" y2="2448" x1="4816" />
            <wire x2="5136" y1="2448" y2="2448" x1="5040" />
        </branch>
        <bustap x2="5136" y1="2448" y2="2448" x1="5152" />
        <branch name="Q(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2816" y="1760" type="branch" />
            <wire x2="2816" y1="1760" y2="1760" x1="2800" />
            <wire x2="3104" y1="1760" y2="1760" x1="2816" />
            <wire x2="3104" y1="1760" y2="1920" x1="3104" />
            <wire x2="3776" y1="1920" y2="1920" x1="3104" />
            <wire x2="3200" y1="1760" y2="1760" x1="3104" />
        </branch>
        <bustap x2="2800" y1="1760" y2="1760" x1="2784" />
        <branch name="Q(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="5040" y="1952" type="branch" />
            <wire x2="5040" y1="1952" y2="1952" x1="4816" />
            <wire x2="5136" y1="1952" y2="1952" x1="5040" />
        </branch>
        <bustap x2="5136" y1="1952" y2="1952" x1="5152" />
        <branch name="Q(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="5216" type="branch" />
            <wire x2="6144" y1="5216" y2="5216" x1="6128" />
            <wire x2="6464" y1="5216" y2="5216" x1="6144" />
            <wire x2="6464" y1="5216" y2="5376" x1="6464" />
            <wire x2="7104" y1="5376" y2="5376" x1="6464" />
            <wire x2="6528" y1="5216" y2="5216" x1="6464" />
        </branch>
        <bustap x2="6128" y1="5216" y2="5216" x1="6112" />
        <branch name="Q(8)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="5408" type="branch" />
            <wire x2="8368" y1="5408" y2="5408" x1="8144" />
            <wire x2="8464" y1="5408" y2="5408" x1="8368" />
        </branch>
        <bustap x2="8464" y1="5408" y2="5408" x1="8480" />
        <branch name="Q(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="4928" type="branch" />
            <wire x2="8368" y1="4928" y2="4928" x1="8144" />
            <wire x2="8464" y1="4928" y2="4928" x1="8368" />
        </branch>
        <bustap x2="8464" y1="4928" y2="4928" x1="8480" />
        <branch name="Q(9)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="4736" type="branch" />
            <wire x2="6144" y1="4736" y2="4736" x1="6128" />
            <wire x2="6432" y1="4736" y2="4736" x1="6144" />
            <wire x2="6432" y1="4736" y2="4896" x1="6432" />
            <wire x2="7104" y1="4896" y2="4896" x1="6432" />
            <wire x2="6528" y1="4736" y2="4736" x1="6432" />
        </branch>
        <bustap x2="6128" y1="4736" y2="4736" x1="6112" />
        <branch name="Q(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="4416" type="branch" />
            <wire x2="8368" y1="4416" y2="4416" x1="8144" />
            <wire x2="8464" y1="4416" y2="4416" x1="8368" />
        </branch>
        <bustap x2="8464" y1="4416" y2="4416" x1="8480" />
        <branch name="Q(10)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="4224" type="branch" />
            <wire x2="6144" y1="4224" y2="4224" x1="6128" />
            <wire x2="6432" y1="4224" y2="4224" x1="6144" />
            <wire x2="6432" y1="4224" y2="4384" x1="6432" />
            <wire x2="7104" y1="4384" y2="4384" x1="6432" />
            <wire x2="6528" y1="4224" y2="4224" x1="6432" />
        </branch>
        <bustap x2="6128" y1="4224" y2="4224" x1="6112" />
        <branch name="Q(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="3936" type="branch" />
            <wire x2="8368" y1="3936" y2="3936" x1="8144" />
            <wire x2="8464" y1="3936" y2="3936" x1="8368" />
        </branch>
        <bustap x2="8464" y1="3936" y2="3936" x1="8480" />
        <branch name="Q(11)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="3744" type="branch" />
            <wire x2="6144" y1="3744" y2="3744" x1="6128" />
            <wire x2="6432" y1="3744" y2="3744" x1="6144" />
            <wire x2="6432" y1="3744" y2="3904" x1="6432" />
            <wire x2="7104" y1="3904" y2="3904" x1="6432" />
            <wire x2="6528" y1="3744" y2="3744" x1="6432" />
        </branch>
        <bustap x2="6128" y1="3744" y2="3744" x1="6112" />
        <branch name="Q(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="3232" type="branch" />
            <wire x2="6144" y1="3232" y2="3232" x1="6128" />
            <wire x2="6432" y1="3232" y2="3232" x1="6144" />
            <wire x2="6432" y1="3232" y2="3392" x1="6432" />
            <wire x2="7104" y1="3392" y2="3392" x1="6432" />
            <wire x2="6528" y1="3232" y2="3232" x1="6432" />
        </branch>
        <bustap x2="6128" y1="3232" y2="3232" x1="6112" />
        <branch name="Q(12)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="3424" type="branch" />
            <wire x2="8368" y1="3424" y2="3424" x1="8144" />
            <wire x2="8464" y1="3424" y2="3424" x1="8368" />
        </branch>
        <bustap x2="8464" y1="3424" y2="3424" x1="8480" />
        <branch name="Q(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="2752" type="branch" />
            <wire x2="6144" y1="2752" y2="2752" x1="6128" />
            <wire x2="6464" y1="2752" y2="2752" x1="6144" />
            <wire x2="6464" y1="2752" y2="2912" x1="6464" />
            <wire x2="7104" y1="2912" y2="2912" x1="6464" />
            <wire x2="6528" y1="2752" y2="2752" x1="6464" />
        </branch>
        <bustap x2="6128" y1="2752" y2="2752" x1="6112" />
        <branch name="Q(13)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="2944" type="branch" />
            <wire x2="8368" y1="2944" y2="2944" x1="8144" />
            <wire x2="8464" y1="2944" y2="2944" x1="8368" />
        </branch>
        <bustap x2="8464" y1="2944" y2="2944" x1="8480" />
        <branch name="Q(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="2240" type="branch" />
            <wire x2="6144" y1="2240" y2="2240" x1="6128" />
            <wire x2="6464" y1="2240" y2="2240" x1="6144" />
            <wire x2="6464" y1="2240" y2="2416" x1="6464" />
            <wire x2="7104" y1="2416" y2="2416" x1="6464" />
            <wire x2="6528" y1="2240" y2="2240" x1="6464" />
        </branch>
        <bustap x2="6128" y1="2240" y2="2240" x1="6112" />
        <branch name="Q(14)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="2448" type="branch" />
            <wire x2="8368" y1="2448" y2="2448" x1="8144" />
            <wire x2="8464" y1="2448" y2="2448" x1="8368" />
        </branch>
        <bustap x2="8464" y1="2448" y2="2448" x1="8480" />
        <branch name="Q(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="6144" y="1760" type="branch" />
            <wire x2="6144" y1="1760" y2="1760" x1="6128" />
            <wire x2="6432" y1="1760" y2="1760" x1="6144" />
            <wire x2="6432" y1="1760" y2="1920" x1="6432" />
            <wire x2="7104" y1="1920" y2="1920" x1="6432" />
            <wire x2="6528" y1="1760" y2="1760" x1="6432" />
        </branch>
        <bustap x2="6128" y1="1760" y2="1760" x1="6112" />
        <branch name="Q(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8368" y="1952" type="branch" />
            <wire x2="8368" y1="1952" y2="1952" x1="8144" />
            <wire x2="8464" y1="1952" y2="1952" x1="8368" />
        </branch>
        <bustap x2="8464" y1="1952" y2="1952" x1="8480" />
        <branch name="Q(15:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8768" y="1408" type="branch" />
            <wire x2="2784" y1="1408" y2="1760" x1="2784" />
            <wire x2="2784" y1="1760" y2="2240" x1="2784" />
            <wire x2="2784" y1="2240" y2="2752" x1="2784" />
            <wire x2="2784" y1="2752" y2="3232" x1="2784" />
            <wire x2="2784" y1="3232" y2="3744" x1="2784" />
            <wire x2="2784" y1="3744" y2="4224" x1="2784" />
            <wire x2="2784" y1="4224" y2="4736" x1="2784" />
            <wire x2="2784" y1="4736" y2="5216" x1="2784" />
            <wire x2="5152" y1="1408" y2="1408" x1="2784" />
            <wire x2="5152" y1="1408" y2="1952" x1="5152" />
            <wire x2="5152" y1="1952" y2="2448" x1="5152" />
            <wire x2="5152" y1="2448" y2="2944" x1="5152" />
            <wire x2="5152" y1="2944" y2="3424" x1="5152" />
            <wire x2="5152" y1="3424" y2="3936" x1="5152" />
            <wire x2="5152" y1="3936" y2="4416" x1="5152" />
            <wire x2="5152" y1="4416" y2="4928" x1="5152" />
            <wire x2="5152" y1="4928" y2="5408" x1="5152" />
            <wire x2="6112" y1="1408" y2="1408" x1="5152" />
            <wire x2="6112" y1="1408" y2="1760" x1="6112" />
            <wire x2="6112" y1="1760" y2="2240" x1="6112" />
            <wire x2="6112" y1="2240" y2="2752" x1="6112" />
            <wire x2="6112" y1="2752" y2="3232" x1="6112" />
            <wire x2="6112" y1="3232" y2="3744" x1="6112" />
            <wire x2="6112" y1="3744" y2="4224" x1="6112" />
            <wire x2="6112" y1="4224" y2="4736" x1="6112" />
            <wire x2="6112" y1="4736" y2="5216" x1="6112" />
            <wire x2="8480" y1="1408" y2="1408" x1="6112" />
            <wire x2="8480" y1="1408" y2="1952" x1="8480" />
            <wire x2="8480" y1="1952" y2="2448" x1="8480" />
            <wire x2="8480" y1="2448" y2="2944" x1="8480" />
            <wire x2="8480" y1="2944" y2="3424" x1="8480" />
            <wire x2="8480" y1="3424" y2="3936" x1="8480" />
            <wire x2="8480" y1="3936" y2="4416" x1="8480" />
            <wire x2="8480" y1="4416" y2="4928" x1="8480" />
            <wire x2="8480" y1="4928" y2="5408" x1="8480" />
            <wire x2="8768" y1="1408" y2="1408" x1="8480" />
            <wire x2="8848" y1="1408" y2="1408" x1="8768" />
        </branch>
        <iomarker fontsize="28" x="8848" y="1408" name="Q(15:0)" orien="R0" />
        <branch name="TC">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8800" y="1120" type="branch" />
            <wire x2="8800" y1="1120" y2="1120" x1="8416" />
            <wire x2="8832" y1="1120" y2="1120" x1="8800" />
        </branch>
        <branch name="CEO">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="8784" y="1296" type="branch" />
            <wire x2="8784" y1="1296" y2="1296" x1="8416" />
            <wire x2="8832" y1="1296" y2="1296" x1="8784" />
        </branch>
        <instance x="8160" y="1424" name="XLXI_2" orien="R0" />
        <iomarker fontsize="28" x="8832" y="1296" name="CEO" orien="R0" />
        <instance x="7856" y="1392" name="XLXI_3" orien="R0" />
        <branch name="TC_1">
            <wire x2="6720" y1="1088" y2="1632" x1="6720" />
            <wire x2="8000" y1="1088" y2="1088" x1="6720" />
            <wire x2="8000" y1="1088" y2="1232" x1="8000" />
            <wire x2="8160" y1="1232" y2="1232" x1="8000" />
            <wire x2="8160" y1="1088" y2="1088" x1="8000" />
        </branch>
        <instance x="8160" y="1216" name="XLXI_1" orien="R0" />
        <branch name="XLXN_40">
            <wire x2="8096" y1="1360" y2="1360" x1="8080" />
            <wire x2="8160" y1="1360" y2="1360" x1="8096" />
            <wire x2="8096" y1="1152" y2="1360" x1="8096" />
            <wire x2="8160" y1="1152" y2="1152" x1="8096" />
        </branch>
        <iomarker fontsize="28" x="8832" y="1120" name="TC" orien="R0" />
        <branch name="C">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1456" y="5984" type="branch" />
            <wire x2="1456" y1="5984" y2="5984" x1="1440" />
            <wire x2="4272" y1="5984" y2="5984" x1="1456" />
            <wire x2="7600" y1="5984" y2="5984" x1="4272" />
            <wire x2="4272" y1="2080" y2="2576" x1="4272" />
            <wire x2="4432" y1="2576" y2="2576" x1="4272" />
            <wire x2="4272" y1="2576" y2="3072" x1="4272" />
            <wire x2="4432" y1="3072" y2="3072" x1="4272" />
            <wire x2="4272" y1="3072" y2="3552" x1="4272" />
            <wire x2="4272" y1="3552" y2="4064" x1="4272" />
            <wire x2="4432" y1="4064" y2="4064" x1="4272" />
            <wire x2="4272" y1="4064" y2="4544" x1="4272" />
            <wire x2="4272" y1="4544" y2="5056" x1="4272" />
            <wire x2="4272" y1="5056" y2="5536" x1="4272" />
            <wire x2="4272" y1="5536" y2="5984" x1="4272" />
            <wire x2="4432" y1="5536" y2="5536" x1="4272" />
            <wire x2="4432" y1="5056" y2="5056" x1="4272" />
            <wire x2="4432" y1="4544" y2="4544" x1="4272" />
            <wire x2="4432" y1="3552" y2="3552" x1="4272" />
            <wire x2="4432" y1="2080" y2="2080" x1="4272" />
            <wire x2="7600" y1="2080" y2="2576" x1="7600" />
            <wire x2="7600" y1="2576" y2="3072" x1="7600" />
            <wire x2="7600" y1="3072" y2="3552" x1="7600" />
            <wire x2="7760" y1="3552" y2="3552" x1="7600" />
            <wire x2="7600" y1="3552" y2="4064" x1="7600" />
            <wire x2="7600" y1="4064" y2="4544" x1="7600" />
            <wire x2="7600" y1="4544" y2="5056" x1="7600" />
            <wire x2="7760" y1="5056" y2="5056" x1="7600" />
            <wire x2="7600" y1="5056" y2="5536" x1="7600" />
            <wire x2="7600" y1="5536" y2="5984" x1="7600" />
            <wire x2="7760" y1="5536" y2="5536" x1="7600" />
            <wire x2="7760" y1="4544" y2="4544" x1="7600" />
            <wire x2="7760" y1="4064" y2="4064" x1="7600" />
            <wire x2="7760" y1="3072" y2="3072" x1="7600" />
            <wire x2="7760" y1="2576" y2="2576" x1="7600" />
            <wire x2="7760" y1="2080" y2="2080" x1="7600" />
        </branch>
        <branch name="CE">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1472" y="5920" type="branch" />
            <wire x2="1472" y1="5920" y2="5920" x1="1440" />
            <wire x2="4224" y1="5920" y2="5920" x1="1472" />
            <wire x2="7552" y1="5920" y2="5920" x1="4224" />
            <wire x2="4432" y1="2016" y2="2016" x1="4224" />
            <wire x2="4224" y1="2016" y2="2512" x1="4224" />
            <wire x2="4432" y1="2512" y2="2512" x1="4224" />
            <wire x2="4224" y1="2512" y2="3008" x1="4224" />
            <wire x2="4432" y1="3008" y2="3008" x1="4224" />
            <wire x2="4224" y1="3008" y2="3488" x1="4224" />
            <wire x2="4432" y1="3488" y2="3488" x1="4224" />
            <wire x2="4224" y1="3488" y2="4000" x1="4224" />
            <wire x2="4432" y1="4000" y2="4000" x1="4224" />
            <wire x2="4224" y1="4000" y2="4480" x1="4224" />
            <wire x2="4432" y1="4480" y2="4480" x1="4224" />
            <wire x2="4224" y1="4480" y2="4992" x1="4224" />
            <wire x2="4432" y1="4992" y2="4992" x1="4224" />
            <wire x2="4224" y1="4992" y2="5472" x1="4224" />
            <wire x2="4432" y1="5472" y2="5472" x1="4224" />
            <wire x2="4224" y1="5472" y2="5920" x1="4224" />
            <wire x2="7552" y1="1296" y2="2016" x1="7552" />
            <wire x2="7552" y1="2016" y2="2512" x1="7552" />
            <wire x2="7552" y1="2512" y2="3008" x1="7552" />
            <wire x2="7552" y1="3008" y2="3488" x1="7552" />
            <wire x2="7552" y1="3488" y2="4000" x1="7552" />
            <wire x2="7552" y1="4000" y2="4480" x1="7552" />
            <wire x2="7552" y1="4480" y2="4992" x1="7552" />
            <wire x2="7552" y1="4992" y2="5472" x1="7552" />
            <wire x2="7552" y1="5472" y2="5920" x1="7552" />
            <wire x2="7760" y1="5472" y2="5472" x1="7552" />
            <wire x2="7760" y1="4992" y2="4992" x1="7552" />
            <wire x2="7760" y1="4480" y2="4480" x1="7552" />
            <wire x2="7760" y1="4000" y2="4000" x1="7552" />
            <wire x2="7760" y1="3488" y2="3488" x1="7552" />
            <wire x2="7760" y1="3008" y2="3008" x1="7552" />
            <wire x2="7760" y1="2512" y2="2512" x1="7552" />
            <wire x2="7760" y1="2016" y2="2016" x1="7552" />
            <wire x2="8160" y1="1296" y2="1296" x1="7552" />
        </branch>
    </sheet>
</drawing>