WPC = [0;0];

P = eye(2);


% Initial J and P values for A:
J = diag([0,1]);
A = P * J * P^(-1);
figure('Renderer', 'painters', 'Position', [10 10 900 600])
open('Lab2');
drawData

% 7 Eigenvalues on different sides of 0 on real axes 
J  = [ -1, 0;0, 1];
A = P * J * P^(-1);
drawData

% 8 Complex numbers 
J  = [ 1i, 0;0, -1i];
A = P * J * P^(-1);
drawData

