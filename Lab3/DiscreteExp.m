function DiscreteExp(Simulation,A,Time,IC)
scatter(Simulation.discrete_out.Time,Simulation.discrete_out.Data,'filled');
hold on
plot(Simulation.discrete_out.Time,Simulation.discrete_out.Data,'r');
hold on
plot(Time,exp(A*Time)*IC,'k')
hold off
grid
legend('Wartosci x(t)','Interpolowana funkcja x(t)','Rzeczywista funkcja x(t)')
disp('Press any key ...')
pause;
end