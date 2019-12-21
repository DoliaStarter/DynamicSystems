function compare_lin_ode(ode,linearized_ode, equilibrium, initial_conditions)
     % Plot on figure graph of function and it's linearized version for
     % some equilibrium
     T = 10
     [t,y] = ode45(ode,[0 T],equilibrium);
     plot(t,y,'b -.')
     hold on
     for condition = initial_conditions
         [t,y] = ode45(ode,[0 T],condition);
         plot(t,y,'k-')
         hold on
         [t, y] = ode45(linearized_ode,[0 T],condition);
         plot(t,y,'k-.')
         hold on
     end
     hold off
     grid
     xlabel('t')
     ylabel('x(t)')
     legend("IC = equilibrium point","Dynamic of original system","Dynamic of linearized system")
     disp('Press any key')
     pause
end