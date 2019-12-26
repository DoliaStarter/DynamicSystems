clear all; close all; clc
% Van der Pol
epsilon = 1;
sigma = 10;
b = 8/3;
r = 28;
% Zadanie 1. Rownania van der pola oraz rownania lorenza
van_der_pole = @(t,Y) [
                         Y(2);
                         -Y(1) + epsilon .* Y(2) .* (1 - Y(1).^2)];

% Zadanie 2. Rozne wartosci epsilona.
for epsilon= 1:3
   van_der_pole = @(t,Y) [Y(2);-Y(1) + epsilon .* Y(2) .* (1 - Y(1).^2)];
   plot_phase_portrait(van_der_pole, 2);
   disp('Current epsilon: ')
   disp(epsilon)
   
end
% Zadanie 3. System nieliniowy x= ax - x^3
a = 1;
f = @(x) a.*x - x.^3;

x_r = {@(a) a * 0;@(a) sqrt(a); @(a) -sqrt(a)};
plot_equilibrium_dep_on_a(x_r);
how_stability_depends_on_a();

close all;
% Zadanie 4.System lorenza
sigma = 10;
r = 28;
b = 8/3;
lorentz = @(t,X)[
        sigma .* (X(2) - X(1));
        r .* X(1) - X(2) - X(1) .* X(3);
        -b * X(3) + X(1) .* X(2);
];
x0=[0 1 20];
x0_1 = [0 1.1 20];
x0_2 = [0.1 1 20];
X0 = [x0' x0_1' x0_2'];
for x = X0
   plot_lorentz(lorentz,x)
end