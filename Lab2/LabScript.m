WPC = [0;0];

% Initial J and P values for A:
P = eye(2);
J = diag([0,1]);

%A = P * J * P^(-1);
A = [0,1;-1,0];
figure('Renderer', 'painters', 'Position', [10 10 900 600])
open('Lab2');

drawData