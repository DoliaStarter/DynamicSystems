%Bohdan Forostianyi
function compare_ode_lin_portraits(equilibrium, x1der,x2der, lin_x1der,lin_x2der)
   T = 10;
   scatter(equilibrium(1),equilibrium(2),'k','HandleVisibility','off')
   hold on
   [x1, x2] = meshgrid(equilibrium(1)-.5:0.05:equilibrium(1)+.5, equilibrium(2)-.2:0.05:equilibrium(2)+.5);
   x1dot = x1der(x1, x2); 
   x2dot = x2der(x1,x2);
   quiver(x1,x2,x1dot,x2dot,'color',[0 0 0])
   hold on
   x1dot = lin_x1der(x1, x2); 
   x2dot = lin_x2der(x1, x2);
   quiver(x1,x2,x1dot,x2dot,'color',[0 0 1],'linestyle','-.')
   hold off
   grid
   xlabel('x_1(t)')
   ylabel('x_2(t)')
   legend('Original function','Linearized function')
   title('Comprasion bevave of original and linearized equations')
   disp('Press any key ...')
   pause
end