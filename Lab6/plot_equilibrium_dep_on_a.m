function plot_equilibrium_dep_on_a(x_r_vector)
% x_r are functions, that depend on a
a = linspace(-10,10,100);
for i = 1:length(x_r_vector)
    x_r = x_r_vector{i}(a);
    plot(a, x_r, 'k');
    hold on
end
hold off
grid
xlabel('a')
ylabel('x_r')
title('Value of each equilibrium depends on a')
disp('Press any key ...')
pause

