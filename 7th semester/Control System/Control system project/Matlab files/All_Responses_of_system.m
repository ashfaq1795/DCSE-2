clc
clear
close all

%state space model
A=[-0.435 0.209 0.02; 0.268 -0.394 0; 0.227 0 -0.02];
B=[1;0;0];
C=[0.0003 0 0];
D=[0];

%transfer function
[num,denum]=ss2tf(A,B,C,D);
G=tf(num,denum);
feedback_system=feedback(G,1);

% d. Simulate the system using the controller that you designed and show
% all the responses.

fprintf('As my system is stable so no controller is required');

%Step,Impulse,Ramp and Parabola response. 

t = 0:0.01:10;

% Step response
t1 = 0:0.01:1400;
step_signal = ones(1, length(t1)); 
[Y_step, T_step] = step(feedback_system);

% Plot the input signal and the system's response
figure
subplot(2,1,1);
plot(t1, step_signal, 'b', 'LineWidth', 2);
title('Step reference signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on

subplot(2,1,2);
plot(T_step, Y_step, 'r', 'LineWidth', 2);
title('System response');
xlabel('Time(s)');
ylabel('Amplitude');
grid on


% Impulse response
impulse_signal = [1, zeros(1, length(t)-1)]; 
[Y_impulse, T_impulse] = lsim(feedback_system, impulse_signal, t);

% Plot the input signal and the system's response
figure
subplot(2,1,1);
plot(t, impulse_signal, 'b', 'LineWidth', 2);
title('Impulse reference signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on

subplot(2,1,2);
plot(T_impulse, Y_impulse, 'r', 'LineWidth', 2);
title('System response');
xlabel('Time(s)');
ylabel('Amplitude');
grid on


%Ramp responses
ramp_signal=t;
[Y_ramp,T_ramp]=lsim(feedback_system,ramp_signal,t);

% Plot the input signal and the system's response
figure
subplot(2,1,1);
plot(t,ramp_signal,'b','LineWidth',2);
title('Ramp reference signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on

subplot(2,1,2);
plot(T_ramp,Y_ramp,'r','LineWidth',2);
title('System response');
xlabel('Time(s)');
ylabel('Amplitude');
grid on



%Parabolic Response
parabola_signal = t.^2;
[Y_parabola,T_parabola] = lsim(G,parabola_signal,t);

% Plot the input signal and the system's response
figure
subplot(2,1,1);
plot(t,parabola_signal,'b','LineWidth',2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Parabola reference signal');
grid on 

subplot(2,1,2);
plot(T_parabola,Y_parabola,'r','LineWidth',2);
xlabel('Time (s)');
ylabel('Amplitude');
title('System response');
grid on

