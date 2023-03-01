clc
clear all
close all

% a. cosider the state space of problem 22, page 148 of Norman Nise Book
% Edition 5.

A=[1 2; 3 4]
B=[0.4;0.3]
C=[1 0.4]
D=[0]

% A and B must have same no of rows
% A and C must have same no of columns
% B and D must have same no of columns
% C and D must have same no of rows
 

% b. Check the stability of the system using all methods that you know.

disp('Stability of the system:');
% 1. Eigen value of matric A.
disp('The Eign value of matric A are: ');
eign_values=eig(A)


% 2. Poles of Transfer function
[num,denum]=ss2tf(A,B,C,D);
disp('Poles of Transfer funcion: ');
poles_of_tf=roots(denum)



% 3. step response
figure 
step(A,B,C,D);
title('step response before controller')
xlabel('Time');
ylabel('Amplitude');

% 4. Root locus
figure 
tran_fun=tf(num,denum);
rlocus(tran_fun);
title('Root locus of the system');



% c. Compute the controllability and observability for the system. if the
% system is unstable design a suitable controller for it.

disp('Controllability test:');
% prerequisites for contrability test
% 1. find the oder of matrix A.
disp('Order of matrix A is: ');
order_of_matrix_A=size(A,1)
% 2. using n construct P matrix.
disp('P matrix is: ');
P=[B A*B (A*A)*B]
% 3. find the rank of P matrix
disp('Rank of P matrix:');
rank_of_P_matrix=rank(P)
% 4. check the rank of P matrix is equal to order of A matrix or not.
disp('As rank of P matrix is equal to order of matrix A so the system is controllable'); 


disp('Observability test');
% prerequisites for observability test
% 1. find the oder of matrix A.
disp('Order of matrix A is: ');
order_of_matrix_A
% 2. using n construct Q matrix.
disp('Q matrix is: ');
Q=[C;C*A;C*(A*A)]
% 3. find the rank of Q matrix
disp('Rank of Q matrix:');
rank_of_Q_matrix=rank(Q)
% 4. check the rank of Q matrix is equal to order of A matrix or not.
disp('As rank of Q matrix is equal to order of matrix A so the system is observable'); 

disp('System is unstable so controller is required.');
% As matrix C is not identity matrix so I will design Observer based state
% feedback controller.
% Also system passes both controllablilty and observability test.
disp('My desired eign values for controller and observer are:');
desired_controller_values=[-2 -14]
desired_observer_values=[-10 -70]

K=place(A,B,desired_controller_values)
L=place(A',C',desired_observer_values)'

sys_observer=ss(A-L*C,B,C,D);
sys_controller=ss(A-B*K,B,C,D);



% d. Simulate the system using the controller that you designed and show
% all the responses.

figure 
step(sys_observer);
title('step response After controller connection')
xlabel('Time');
ylabel('Amplitude');
figure 
impulse(sys_controller);
title('Impulse response After controller connection')
xlabel('Time');
ylabel('Amplitude');



% e. Design a PID controller and show the response of the system using PID
% controller. compare the result obtained in part d and e.

%state space model
state_space_model=ss(A,B,C,D);
%PID gains
kp=1;
ki=1;
kd=1;
%pid_controller=pid(kp,ki,kd)


% f. Compute the steady state error before and after designing controller.







