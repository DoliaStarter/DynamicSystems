WPC = [0;0];

% Initial J and P values for A:
P = eye(2);

% Przypadek 9 
J = [-2+2*i,0;0,-2-2*i];
A = P * J * P^(-1);



figure('Renderer', 'painters', 'Position', [10 10 900 600])
open('Lab2');
drawData
