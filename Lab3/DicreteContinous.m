function DicreteContinous(Simulation)
scatter(Simulation.discrete_out.Time,Simulation.discrete_out.Data,'filled');
hold on
plot(Simulation.discrete_out.Time,Simulation.discrete_out.Data,'r');
hold on
plot(Simulation.con.Time,Simulation.discrete_out.Data,'g');
hold off
grid
legend('Wartosci x(t)','Interpolowana funkcja x(t)','Rzeczywista funkcja x(t)')
disp('Press any key ...')
pause;
end
