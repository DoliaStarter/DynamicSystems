% Bohdan Forostianyi
function bankVis(Simulation,color)
scatter(Simulation.simout.Time,Simulation.simout.Data,50,color,'filled','HandleVisibility','off');
hold on
plot(Simulation.simout.Time,Simulation.simout.Data,color);
hold on

end


