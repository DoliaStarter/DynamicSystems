% Bohdan Forostianyi
function plotData(Simulation,A,IC)
%Simulation, A, Time
% Simulation - Obiekt z przeprowadzonej symulacji
% A - macierz stanu, potrzebna dla wizualizacji rozwiazania ciaglego
% ukladu)
% IC - stan poczatkowy systemu
scatter(Simulation.simout.Time,Simulation.simout.Data,'filled');
hold on
plot(Simulation.simout.Time,Simulation.simout.Data,'r');
hold on
T = 0:0.1:10;
plot(T,exp(A*T)*IC,'k');
hold off
grid
legend('Wartosci x(t)','Interpolowana funkcja x(t)','Rzeczywista funkcja x(t)')
disp('Press any key ...')
pause;
end
