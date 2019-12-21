%Bohdan Forostainyi
function plot_in_time_domain(ode,equilibrium,random_points)
%plot function in time domain
T = 10;
for condition = equilibrium
    [t,y] = ode45(ode,[0 T],condition);
    plot(t,y,'k-')
    hold on
end
for condition = random_points
    [t,y] = ode45(ode,[0 T],condition);
    plot(t,y,'k-.')
    hold on
end
hold off
xlabel('t')
ylabel('x(t)')
ylim([min(equilibrium)-0.1,max(equilibrium)+0.1]);
grid;
legend('IC in equilibrium points','IC in random points')
title('System dynamic in surroundings of equilibrium points')
disp('Press any key ...')
pause
end

