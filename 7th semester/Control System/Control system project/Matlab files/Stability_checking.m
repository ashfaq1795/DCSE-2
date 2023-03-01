clc
clear 
close all

% a. cosider the state space of problem 22, page 148 of Norman Nise Book
% Edition 5.

A=[-0.435 0.209 0.02; 0.268 -0.394 0; 0.227 0 -0.02]
B=[1;0;0]
C=[0.0003 0 0]
D=[0]

 

% b. Check the stability of the system using all methods that you know.

fprintf('Stability of the system:\n\n');
% 1. Eigen value of matric A.
fprintf('The Eign value of matric A are:');
eign_values=eig(A)


% 2. Poles of Transfer function
[num,denum]=ss2tf(A,B,C,D);
fprintf('Poles of Transfer funcion: ');
poles_of_tf=roots(denum)



% 3. step response
G=tf(num,denum);
feedback_system=feedback(G,1);
[Y_step,T_step]=step(feedback_system);
figure
plot(T_step,Y_step,'r','LineWidth',2);
title('Step response');
xlabel('Time(s)');
ylabel('Amplitude');
grid on


% 4. Root locus
figure
rlocus(G,'r');
title('Root locus of the system');

