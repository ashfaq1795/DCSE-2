
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name DSDlab09 -dir "C:/Users/AshfaqAhmad/Documents/practice/DSDlab09/planAhead_run_1" -part xc6slx9csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "TrafficLight.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Traffic_light.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top TrafficLight $srcset
add_files [list {TrafficLight.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9csg324-2
