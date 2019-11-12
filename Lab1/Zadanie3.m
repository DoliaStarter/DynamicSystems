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

clf
InitialVoltage = 1;
FinalVoltage = 1;
b = sim('Lab1');
values = linspace(5,20,4);
tiledlayout(2,1)
nexttile 
plot(b.tout,b.u);
title('Napiecie sterujace')
ylabel('Napiecie')
xlabel('Czas')
leg1 = legend('$u(t)=0$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
grid
nexttile
for i = 1:4
WPC = values(i);
a = sim('Lab1');
plot(a.tout,a.x);
hold on
end
leg1 = legend('$x_0 = 10V$','$x_0= 10V$','$x_0 = 15V$','$x_0 =  20V$' );
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
grid
title('Analiza zachowania ukladu dla stalego sterowania rownego 1 i roznych wartosci poczatkowych');
xlabel('Czas')
ylabel('Napiecie na kondesatorze')
fprintf('\n Ponownie widać, że wartosc napięcia sterujacego jest wartoscią graniczną dla napięcia na kondensatorze. Jest to spowodowane tym, że w momencie gdy kondesator się rozladowuje on zaczyna sie doladowywac od napiecia sterujacego, więc napiecie na nim jest ciągle wznawiane i rowne napieciu sterujacemu\n')
fprintf('\n Dowolny klawisz zeby kontynuowac...\n')
hold off
pause