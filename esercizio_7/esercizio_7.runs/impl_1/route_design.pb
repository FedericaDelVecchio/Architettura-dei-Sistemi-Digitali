
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
[
%s*common2B
.Phase 1 Build RT Design | Checksum: 10c5b61d3
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:24 ; elapsed = 00:00:28 . Memory (MB): peak = 2078.504 ; gain = 102.2272default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
2.1 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
f
%s*common2M
9Phase 2.1 Fix Topology Constraints | Checksum: 10c5b61d3
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:24 ; elapsed = 00:00:28 . Memory (MB): peak = 2078.504 ; gain = 102.2272default:defaulth px� 
t

Phase %s%s
101*constraints2
2.2 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
_
%s*common2F
2Phase 2.2 Pre Route Cleanup | Checksum: 10c5b61d3
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:24 ; elapsed = 00:00:28 . Memory (MB): peak = 2078.504 ; gain = 102.2272default:defaulth px� 
p

Phase %s%s
101*constraints2
2.3 2default:default2!
Update Timing2default:defaultZ18-101h px� 
[
%s*common2B
.Phase 2.3 Update Timing | Checksum: 154a00bff
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.238 ; gain = 111.9612default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=5.381  | TNS=0.000  | WHS=-0.114 | THS=-1.618 |
2default:defaultZ35-416h px� 
a
%s*common2H
4Phase 2 Router Initialization | Checksum: 1bc1e12b7
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
3.1 2default:default2"
Global Routing2default:defaultZ18-101h px� 
\
%s*common2C
/Phase 3.1 Global Routing | Checksum: 1bc1e12b7
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
[
%s*common2B
.Phase 3 Initial Routing | Checksum: 24817d507
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=5.171  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
_
%s*common2F
2Phase 4.1 Global Iteration 0 | Checksum: a9f783d4
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
]
%s*common2D
0Phase 4 Rip-up And Reroute | Checksum: a9f783d4
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
]
%s*common2D
0Phase 5.1.1 Update Timing | Checksum: 12c0ef4eb
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=5.250  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
[
%s*common2B
.Phase 5.1 Delay CleanUp | Checksum: 12c0ef4eb
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
e
%s*common2L
8Phase 5.2 Clock Skew Optimization | Checksum: 12c0ef4eb
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
g
%s*common2N
:Phase 5 Delay and Skew Optimization | Checksum: 12c0ef4eb
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
\
%s*common2C
/Phase 6.1.1 Update Timing | Checksum: 93d3ccdd
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=5.250  | TNS=0.000  | WHS=0.177  | THS=0.000  |
2default:defaultZ35-416h px� 
[
%s*common2B
.Phase 6.1 Hold Fix Iter | Checksum: 1049b8786
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
Y
%s*common2@
,Phase 6 Post Hold Fix | Checksum: 1049b8786
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
Z
%s*common2A
-Phase 7 Route finalize | Checksum: 11a6eff7b
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
a
%s*common2H
4Phase 8 Verifying routed nets | Checksum: 11a6eff7b
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
\
%s*common2C
/Phase 9 Depositing Routes | Checksum: c3731c0b
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=5.250  | TNS=0.000  | WHS=0.177  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
^
%s*common2E
1Phase 10 Post Router Timing | Checksum: c3731c0b
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
}

Phase %s%s
101*constraints2
11 2default:default2/
Post-Route Event Processing2default:defaultZ18-101h px� 
h
%s*common2O
;Phase 11 Post-Route Event Processing | Checksum: 1eb2f61ab
2default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:28 . Memory (MB): peak = 2088.945 ; gain = 112.6682default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
862default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:262default:default2
00:00:292default:default2
2088.9452default:default2
121.6992default:defaultZ17-268h px� 
�
%s4*runtcl2�
�Executing : report_drc -file molt_booth_on_board_drc_routed.rpt -pb molt_booth_on_board_drc_routed.pb -rpx molt_booth_on_board_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_drc -file molt_booth_on_board_drc_routed.rpt -pb molt_booth_on_board_drc_routed.pb -rpx molt_booth_on_board_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
UC:/VHDL/TESINA/esercizio_7/esercizio_7.runs/impl_1/molt_booth_on_board_drc_routed.rptUC:/VHDL/TESINA/esercizio_7/esercizio_7.runs/impl_1/molt_booth_on_board_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file molt_booth_on_board_methodology_drc_routed.rpt -pb molt_booth_on_board_methodology_drc_routed.pb -rpx molt_booth_on_board_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file molt_booth_on_board_methodology_drc_routed.rpt -pb molt_booth_on_board_methodology_drc_routed.pb -rpx molt_booth_on_board_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
609*	vivadotcl2�
aC:/VHDL/TESINA/esercizio_7/esercizio_7.runs/impl_1/molt_booth_on_board_methodology_drc_routed.rptaC:/VHDL/TESINA/esercizio_7/esercizio_7.runs/impl_1/molt_booth_on_board_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_power -file molt_booth_on_board_power_routed.rpt -pb molt_booth_on_board_power_summary_routed.pb -rpx molt_booth_on_board_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_power -file molt_booth_on_board_power_routed.rpt -pb molt_booth_on_board_power_summary_routed.pb -rpx molt_booth_on_board_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
962default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
%s4*runtcl2�
sExecuting : report_route_status -file molt_booth_on_board_route_status.rpt -pb molt_booth_on_board_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -report_unconstrained -file molt_booth_on_board_timing_summary_routed.rpt -pb molt_booth_on_board_timing_summary_routed.pb -rpx molt_booth_on_board_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
%s4*runtcl2p
\Executing : report_incremental_reuse -file molt_booth_on_board_incremental_reuse_routed.rpt
2default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
�
%s4*runtcl2p
\Executing : report_clock_utilization -file molt_booth_on_board_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file molt_booth_on_board_bus_skew_routed.rpt -pb molt_booth_on_board_bus_skew_routed.pb -rpx molt_booth_on_board_bus_skew_routed.rpx
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0652default:default2
2127.5122default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2e
QC:/VHDL/TESINA/esercizio_7/esercizio_7.runs/impl_1/molt_booth_on_board_routed.dcp2default:defaultZ17-1381h px� 


End Record