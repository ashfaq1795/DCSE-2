clc
clear 
close all

num=[0.0003 0.0001242 0.000002364];
denum=[1 0.849 0.1274 0.0005188];
G=tf(num,denum);

%Design a tracking controller for step tracking of amplitude 5u(t) and ramp
%tracking of 5tu(t).

% Define the step reference signal
step_reference = 5*ones(1, 1001);

% Define the ramp reference signal
t = (1:1001);
ramp_reference = 5*t;

% Design a PID controller for the step reference signal
kp_s=200000;
ki_s=0;
kd_s=-3000;
pid_step_controller=pid(kp_s,ki_s,kd_s);
% Create the closed-loop system for the step reference signal
pid_controlled_feedback_step_system=feedback(pid_step_controller*G,1);

% Design a PID controller for the ramp reference signal
kp_r = 200000;
ki_r = 0;
kd_r = 0;
pid_ramp_controller = pid(kp_r, ki_r, kd_r);
% Create the closed-loop system for the ramp reference signal
pid_controlled_feedback_ramp_system = feedback(pid_ramp_controller*G, 1);


% Simulate the system response to the step reference signal
t1=0:0.01:10;
[step_y, t_step] = lsim(pid_controlled_feedback_step_system, step_reference,t1 );

% Simulate the system response to the ramp reference signal
[ramp_y, t_ramp] = lsim(pid_controlled_feedback_ramp_system, ramp_reference,t1);

%Plot the step reference signal and the system response
plot(t_step, step_reference, 'r','Linewidth',7);
hold on
plot(t_step, step_y, 'b',  'Linewidth',3)
xlabel('Time(s)');
ylabel('Amplitude');
legend('Step reference signal', 'System response with tracking controller');
title('Step reference signal before and after tracking controller');
axis([0 12 0 7]);

%Plot the ramp reference signal and the system response
figure
plot(t_ramp, ramp_reference,'r','Linewidth',7);
hold on 
plot( t_ramp , ramp_y, 'b','Linewidth',4)
xlabel('Time(s)');
ylabel('Amplitude');
legend('Ramp reference signal', 'System response with tracking controller');
title('Ramp reference signal before and after tracking controller');
axis([0 11 0 6000]);




