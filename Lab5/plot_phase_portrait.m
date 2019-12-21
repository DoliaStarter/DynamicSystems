%Bohdan Forostianyi
function plot_phase_portrait(equilibrium, x1der, x2der)
% Plot phase portrait of the system
T = 10;
for eq = equilibrium
    scatter(eq(1),eq(2),'k')
    hold on
    [x1, x2] = meshgrid(eq(1)-.5:0.05:eq(1)+.5, eq(2)-.2:0.05:eq(2)+.5);
    x1dot = x1der(x1, x2); 
    x2dot = x2der(x1,x2);
    quiver(x1,x2,x1dot,x2dot,'color',[0 0 0])
    hold off
    grid
    xlabel('x_1(t)')
    ylabel('x_2(t)')
    legend('Equilibrium','Surrounding')
    title('Stability of equilibrium point')
    disp('Press any key ...')
    pause
end
end

