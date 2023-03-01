clc
clear
close all

A=[-0.435 0.209 0.02; 0.268 -0.394 0; 0.227 0 -0.02];
B=[1;0;0];
C=[0.0003 0 0];
D=[0];

% c. Compute the controllability and observability for the system. if the
% system is unstable design a suitable controller for it.

fprintf('Controllability test:\n\n');
order_of_matrix_A=size(A,1);
fprintf('Order of matrix A is: %d \n',order_of_matrix_A);
fprintf('P matrix is: ');
P=[B A*B (A*A)*B]
rank_of_P_matrix=rank(P);
fprintf('Rank of P matrix: %d\n',rank_of_P_matrix);
fprintf('As rank of P matrix is equal to order of matrix A so the system is controllable\n\n'); 

fprintf('Observability test\n\n');
fprintf('Order of matrix A is: %d\n',order_of_matrix_A);
fprintf('Q matrix is: ');
Q=[C;C*A;C*(A*A)]
rank_of_Q_matrix=rank(Q);
fprintf('Rank of Q matrix: %d\n',rank_of_Q_matrix);
fprintf('As rank of Q matrix is equal to order of matrix A so the system is observable.\n\n'); 

fprintf('As the system is stable so no controller is required.\n\n');
