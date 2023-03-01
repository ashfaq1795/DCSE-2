clc
clear 
close all

%system
num=[1];
denum=[1 3 1];
sys=tf(num,denum);

%negative feedback system
feedback_system=feedback(sys,1);

%step response before PID controller 
step(feedback_system);

%PID controller 
kp=1;
ki=1;
kd=1;
PID_controller=pid(kp,ki,kd);

%negative feedback system with PID controller in series.
%we will connect the PID controller with system in series.
feedback_system_pid=feedback(sys*PID_controller,1);
%step response after PID controller.
figure
step(feedback_system_pid);


%PID controller using pidtune function
pidtune_controller=pidtune(sys,'pid');

feedback_system_pidtune=feedback(pidtune_controller*sys,1);
%step response after PIDtune controller.
figure
step(feedback_system_pidtune);