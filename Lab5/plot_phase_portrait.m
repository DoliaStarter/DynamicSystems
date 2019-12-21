function plot_phase_portrait(initial_conditions,equation)
% Plot phase portrait of the system
T = 10;
for condition=initial_conditions
   [t,y] = ode45(equation,[0 T],condition); 
   scatter(y(:,1),y(:,2),'k')
   hold on
   plot(y(:,1),y(:,2),'k')
   hold on
end
hold off
grid
xlabel('x_1(t)')
ylabel('x_2(t)')
disp('Press any key ...')
pause
end

