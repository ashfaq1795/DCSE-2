clc
clear
close all

num=[0.0003 0.0001242 0.000002364];
denum=[1 0.849 0.1274 0.0005188];
G=tf(num,denum);

% f. Compute the steady state error before and after designing controller.
feedback_system=feedback(G,1);

%step steady state error...
fprintf('Steady state error for step response before and after PID controller:\n'); 
kp_s=92.83;
ki_s=1;
kd_s=1;
pid_controller_s=pid(kp_s,ki_s,kd_s);
pid_controlled_feedback_system_s=feedback(pid_controller_s*G,1);

[Y_step,T_step]=step(feedback_system); 
[Y_step_pid,T_step_pid]=step(pid_controlled_feedback_system_s);

step_desired_value=1;
sse_step_before_pid=step_desired_value - Y_step(end);
fprintf('steady state error of step function before PID is: %f\n',sse_step_before_pid);
sse_step_after_pid=step_desired_value - Y_step_pid(end);
fprintf('steady state error of step function after PID is: %f\n',sse_step_after_pid);



%impulse steady state error...
fprintf('\n\nSteady state error for impulse response before and after PID controller:\n'); 
kp_i=0.1;
ki_i=1;
kd_i=1;
pid_controller_i=pid(kp_i,ki_i,kd_i);
pid_controlled_feedback_system_i=feedback(pid_controller_i*G,1);

t = 0:0.01:10;
impulse_signal = [1, zeros(1, length(t)-1)];  
[Y_impulse, T_impulse] = lsim(feedback_system, impulse_signal, t);
[Y_impulse_pid, T_impulse_pid] = lsim(pid_controlled_feedback_system_i, impulse_signal, t);

sse_impulse_before_pid=Y_impulse(end);
fprintf('steady state error of impulse function before PID is: %f\n',sse_impulse_before_pid);
sse_impulse_after_pid=Y_impulse_pid(end);
fprintf('steady state error of impulse function after PID is: %f\n',sse_impulse_after_pid);


%Ramp steady state error...
fprintf('\n\nsteady state error for ramp response before and after PID controller:\n'); 
kp_r=2122332.98335;
ki_r=0;
kd_r=0;
pid_controller_r=pid(kp_r,ki_r,kd_r);
pid_controlled_feedback_system_r=feedback(pid_controller_r*G,1);

ramp_signal = t;  
[Y_ramp, T_ramp] = lsim(feedback_system, ramp_signal, t);
[Y_ramp_pid, T_ramp_pid] = lsim(pid_controlled_feedback_system_r, ramp_signal, t);

ramp_desired=ramp_signal(end);
sse_ramp_before_pid=ramp_signal(end)-Y_ramp(end);
fprintf('steady state error of impulse function before PID is: %f\n',sse_ramp_before_pid);
sse_ramp_after_pid=ramp_signal(end)-Y_ramp_pid(end);
fprintf('steady state error of impulse function after PID is: %f\n',sse_ramp_after_pid);


%Parabola steady state error...
fprintf('\n\nSteady state error for Parabola response before and after PID controller:\n'); 
kp_p=2122337.98335;
ki_p=0;
kd_p=0;
pid_controller_p=pid(kp_p,ki_p,kd_p);
pid_controlled_feedback_system_p=feedback(pid_controller_p*G,1);

parabola_signal = t.^2;
[Y_parabola, T_parabola] = lsim(feedback_system, parabola_signal, t);
[Y_parabola_pid, T_parabola_pid] = lsim(pid_controlled_feedback_system_p, parabola_signal, t);

parabola_desired_value=t(end)^2;
sse_parabola_before_pid=parabola_desired_value-Y_parabola(end);
fprintf('steady state error of parabola function before PID is: %f\n',sse_parabola_before_pid);
sse_parabola_after_pid=parabola_desired_value-Y_parabola_pid(end);
fprintf('steady state error of parabola function after PID is: %f\n',sse_parabola_after_pid);
