function Discrete(Simulation,color)
scatter(Simulation.discrete_out.Time,Simulation.discrete_out.Data,50,color,'filled');
hold on
plot(Simulation.discrete_out.Time,Simulation.discrete_out.Data,color);
hold on
grid
end


