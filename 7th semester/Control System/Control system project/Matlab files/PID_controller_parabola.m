clc
clear 
close all

% e. Design a PID controller and show the response of the system using PID
% controller. compare the result obtained in part d and e.

% Transfer function of the system
num=[0.0003 0.0001242 0.000002364];
denum=[1 0.849 0.1274 0.0005188];
G=tf(num,denum);

% Design PID controller
kp=2122337.98335;
ki=0;
kd=0;
pid_controller=pid(kp,ki,kd);


% Response to parabola signal without PID controller
t = 0:0.01:10;
parabola_signal = t.^2;
feedback_system=feedback(G,1);
[Y_parabola, T_parabola] = lsim(feedback_system, parabola_signal, t);



% Response to parabola signal with PID controller
pid_controlled_feedback_system=feedback(pid_controller*G,1);
[Y_parabola_pid, T_parabola_pid] = lsim(pid_controlled_feedback_system, parabola_signal, t);

% Plot responses
figure
subplot(2,1,1);
plot(T_parabola, Y_parabola, 'r', 'LineWidth', 2);
title('parabola response without PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
grid on

subplot(2,1,2);
plot(T_parabola_pid, Y_parabola_pid, 'r', 'LineWidth', 2);
title('Parabola response with PID controller');
xlabel('Time(s)');
ylabel('Amplitude');
grid on
