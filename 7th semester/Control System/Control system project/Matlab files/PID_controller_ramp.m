clc
clear 
close all

% e. Design a PID controller and show the response of the system using PID
% controller. compare the result obtained in part d and e.

num=[0.0003 0.0001242 0.000002364];
denum=[1 0.849 0.1274 0.0005188];
G=tf(num,denum);

%pid controller
kp=2122332.98335;
ki=0;
kd=0;
pid_controller=pid(kp,ki,kd);

% Ramp response before PID controller
t = 0:0.01:10;
feedback_system=feedback(G,1);
ramp_signal = t;  
[Y_ramp, T_ramp] = lsim(feedback_system, ramp_signal, t);

% Ramp response after PID controller.
pid_controlled_feedback_system=feedback(pid_controller*G,1);
[Y_ramp_pid, T_ramp_pid] = lsim(pid_controlled_feedback_system, ramp_signal, t);

%plotting
subplot(2,1,1);
plot(T_ramp, Y_ramp, 'r', 'LineWidth', 2);
title('Ramp response without PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
grid on

subplot(2,1,2);
plot(T_ramp_pid, Y_ramp_pid, 'r', 'LineWidth', 2);
title('Ramp response with PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
grid on
