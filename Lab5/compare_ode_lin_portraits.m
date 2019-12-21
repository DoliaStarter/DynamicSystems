function compare_ode_lin_portraits(ode,linearized_ode, equilibrium, initial_conditions)
   T = 10;
   [t,y] = ode45(ode,[0 T],equilibrium);
   scatter(y(:,1),y(:,2),'k','HandleVisibility','off')
   hold on
   for condition = initial_conditions
         [t,y] = ode45(ode,[0 T],condition);
         plot(y(:,1),y(:,2),'k-')
         hold on
         [t, y] = ode45(linearized_ode,[0 T],condition);
         plot(y(:,1),y(:,2),'r-.')
         hold on
   end
   hold off
   grid
   xlabel('t')
   ylabel('x(t)')
   legend("Dynamic of original system","Dynamic of linearized system")
   disp('Press any key')
   pause
end