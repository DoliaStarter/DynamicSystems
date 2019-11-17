% Forostianyi Bohdan 
FinalVoltage = 0;
InitialVoltage = 0;
StepTime = 0; % czas po którym odbędzie się skok na skokowym źródle napięcia
SimulationTime = 10;

%-------------------------------------------%
% deklaracja wektorow
Rv = [10,5,15];
Cv = [0.1,0.05,0.15];
WPCv = [4,40,400];
%-------------------------------------------%


WPC = 0;
values = 1:4;
colors = ['r','g','b','c'];
for i = 1:4
InitialVoltage = values(i);
FinalVoltage = values(i);

a = sim('Lab1');
plot(a.tout,a.x,colors(i));
hold on
plot(a.tout,a.u, colors(i));
hold on
end
xlabel('Czas')
ylabel('Napiecie na kondensatorze')
title('Analiza ukladu dla WPC = 0 i roznych wartosci stalego sterowania')
grid
hold off
fprintf('\n Widac, ze napiecie sterujace jest granica dla napiecia na kondensatorze.\n Oznacza, to tyle, ze spadek napiecia na C nigdy nie bedzie wieksze niz napiecie sterujace.\n Innymi slowy: jest potwierdzenie prawa Kirchoffa:\n Suma napiec w obwodzie jest rowna 0')
fprintf('\n Dowolny klawisz zey kontynuowac ...\n' )
pause
