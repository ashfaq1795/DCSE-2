
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name DSD_labexam -dir "C:/Users/AshfaqAhmad/Documents/DSD_lab_exam_2022/DSD_labexam/planAhead_run_1" -part xc6slx9csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/AshfaqAhmad/Documents/DSD_lab_exam_2022/DSD_labexam/parking_sys.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/AshfaqAhmad/Documents/DSD_lab_exam_2022/DSD_labexam} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "parking_sys.ucf" [current_fileset -constrset]
add_files [list {parking_sys.ucf}] -fileset [get_property constrset [current_run]]
link_design
