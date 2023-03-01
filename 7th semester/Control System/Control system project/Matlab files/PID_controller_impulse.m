clc
clear 
close all
% e. Design a PID controller and show the response of the system using PID
% controller. compare the result obtained in part d and e.

num=[0.0003 0.0001242 0.000002364];
denum=[1 0.849 0.1274 0.0005188];
G=tf(num,denum);

%pid controller
kp=9122576.98335;
ki=1;
kd=1;
pid_controller=pid(kp,ki,kd);

% Impulse response before PID controller for compersion.
t = 0:0.01:10;
feedback_system=feedback(G,1);
impulse_signal = [1, zeros(1, length(t)-1)];  
[Y_impulse, T_impulse] = lsim(feedback_system, impulse_signal, t);

% Impulse response after PID controller.
pid_controlled_feedback_system_i=feedback(pid_controller*G,1);
[Y_impulse_pid, T_impulse_pid] = lsim(pid_controlled_feedback_system_i, impulse_signal, t);

%plotting
subplot(2,1,1);
plot(T_impulse, Y_impulse, 'r', 'LineWidth', 2);
title('Impulse response without PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
axis([-2 12 0 0.0000044]);
grid on


subplot(2,1,2);
plot(T_impulse_pid, Y_impulse_pid, 'r', 'LineWidth', 2);
title('Impulse respnse with PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
axis([-2 12 0 2]);
grid on
