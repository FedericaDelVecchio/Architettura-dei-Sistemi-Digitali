
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:052default:default2
00:00:072default:default2
471.1052default:default2
198.3832default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/utils_1/imports/synth_1/interconnect_16_4_board.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2s
_C:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/utils_1/imports/synth_1/interconnect_16_4_board.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
�
Command: %s
53*	vivadotcl2T
@synth_design -top interconnect_16_4_board -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
_
#Helper process launched with PID %s4824*oasys2
45122default:defaultZ8-7075h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:05 . Memory (MB): peak = 1303.281 ; gain = 411.219
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2+
interconnect_16_4_board2default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
152default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2%
interconnect_16_42default:default2c
OC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4.vhd2default:default2
42default:default2 
intconn_16_42default:default2%
interconnect_16_42default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
312default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2%
interconnect_16_42default:default2e
OC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4.vhd2default:default2
132default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
mux_16_12default:default2Z
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
62default:default2
mux_16_inst2default:default2
mux_16_12default:default2e
OC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4.vhd2default:default2
362default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
mux_16_12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
122default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

mux_4_to_12default:default2Y
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
62default:default2
MUX02default:default2

mux_4_to_12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
232default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

mux_4_to_12default:default2[
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
122default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

mux_4_to_12default:default2
02default:default2
12default:default2[
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
122default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

mux_4_to_12default:default2Y
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
62default:default2
MUX12default:default2

mux_4_to_12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
292default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

mux_4_to_12default:default2Y
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
62default:default2
MUX22default:default2

mux_4_to_12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
352default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

mux_4_to_12default:default2Y
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
62default:default2
MUX32default:default2

mux_4_to_12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
412default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

mux_4_to_12default:default2Y
EC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_4_1.vhd2default:default2
62default:default2
	MUX_final2default:default2

mux_4_to_12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
472default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
mux_16_12default:default2
02default:default2
12default:default2\
FC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/mux_16_1.vhd2default:default2
122default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	demux_1_42default:default2[
GC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/demux_1_4.vhd2default:default2
62default:default2 
demux_4_inst2default:default2
	demux_1_42default:default2e
OC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4.vhd2default:default2
432default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	demux_1_42default:default2]
GC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/demux_1_4.vhd2default:default2
122default:default8@Z8-638h px� 
�
default block is never used226*oasys2]
GC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/demux_1_4.vhd2default:default2
162default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	demux_1_42default:default2
02default:default2
12default:default2]
GC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/demux_1_4.vhd2default:default2
122default:default8@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2%
interconnect_16_42default:default2
02default:default2
12default:default2e
OC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4.vhd2default:default2
132default:default8@Z8-256h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

value14_in2default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
392default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2+
interconnect_16_4_board2default:default2
02default:default2
12default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
152default:default8@Z8-256h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 1392.996 ; gain = 500.934
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1392.996 ; gain = 500.934
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1392.996 ; gain = 500.934
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1392.9962default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2I
3C:/VHDL/TESINA/esercizio_1/Nexys-A7-100T-Master.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2I
3C:/VHDL/TESINA/esercizio_1/Nexys-A7-100T-Master.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2G
3C:/VHDL/TESINA/esercizio_1/Nexys-A7-100T-Master.xdc2default:default2=
).Xil/interconnect_16_4_board_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1472.7732default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1472.7732default:default2
0.0002default:defaultZ17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:16 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:16 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:16 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
!inferring latch for variable '%s'327*oasys2 
inter_in_reg2default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
332default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

sel_in_reg2default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
342default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
sel_out_reg2default:default2k
UC:/VHDL/TESINA/esercizio_1/esercizio_1.srcs/sources_1/new/interconnect_16_4_board.vhd2default:default2
352default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:10 ; elapsed = 00:00:16 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 15    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 4     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:12 ; elapsed = 00:00:20 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:31 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:00:19 ; elapsed = 00:00:31 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:00:19 ; elapsed = 00:00:31 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
C
%s*synth2+
+------+------+------+
2default:defaulth px� 
C
%s*synth2+
|      |Cell  |Count |
2default:defaulth px� 
C
%s*synth2+
+------+------+------+
2default:defaulth px� 
C
%s*synth2+
|1     |LUT2  |     2|
2default:defaulth px� 
C
%s*synth2+
|2     |LUT3  |     1|
2default:defaulth px� 
C
%s*synth2+
|3     |LUT5  |     4|
2default:defaulth px� 
C
%s*synth2+
|4     |LUT6  |     4|
2default:defaulth px� 
C
%s*synth2+
|5     |MUXF7 |     2|
2default:defaulth px� 
C
%s*synth2+
|6     |LD    |     6|
2default:defaulth px� 
C
%s*synth2+
|7     |LDC   |    16|
2default:defaulth px� 
C
%s*synth2+
|8     |IBUF  |    18|
2default:defaulth px� 
C
%s*synth2+
|9     |OBUF  |     4|
2default:defaulth px� 
C
%s*synth2+
+------+------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 4 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:17 ; elapsed = 00:00:36 . Memory (MB): peak = 1472.773 ; gain = 500.934
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:38 . Memory (MB): peak = 1472.773 ; gain = 580.711
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1472.7732default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
242default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1472.7732default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2v
b  A total of 22 instances were transformed.
  LD => LDCE: 6 instances
  LDC => LDCE: 16 instances
2default:defaultZ1-111h px� 
h
%Synth Design complete | Checksum: %s
562*	vivadotcl2
ba638cc22default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
402default:default2
52default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:272default:default2
00:00:432default:default2
1472.7732default:default2
976.7932default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2c
OC:/VHDL/TESINA/esercizio_1/esercizio_1.runs/synth_1/interconnect_16_4_board.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
�Executing : report_utilization -file interconnect_16_4_board_utilization_synth.rpt -pb interconnect_16_4_board_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Jan 21 11:43:34 20242default:defaultZ17-206h px� 


End Record