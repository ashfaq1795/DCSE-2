clc
clear 
close all

% e. Design a PID controller and show the response of the system using PID
% controller. compare the result obtained in part d and e.

num=[0.0003 0.0001242 0.000002364];
denum=[1 0.849 0.1274 0.0005188];
G=tf(num,denum);

%pid controller
kp=92.83;
ki=1;
kd=1;
pid_controller=pid(kp,ki,kd);

%step response before PID controller for compersion.
feedback_system=feedback(G,1);
[Y_step,T_step]=step(feedback_system);  

%step response after PID controller.
pid_controlled_feedback_system=feedback(pid_controller*G,1);
[Y_step_pid,T_step_pid]=step(pid_controlled_feedback_system);


%plotting
subplot(2,1,1);
plot(T_step,Y_step,'b','LineWidth',2);
title('step response before PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
grid on

subplot(2,1,2);
plot(T_step_pid,Y_step_pid,'r','LineWidth',2);
title('step response after PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
grid on
