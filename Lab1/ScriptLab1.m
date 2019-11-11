% Zadanie 1. Zależność stanu systemu od parametrow R i C

close all
FinalVoltage = 0;% ustawienie wartosci stereowania
StepTime = 0;
InitialVoltage = 0;
SimulationTime = 10;
open('Lab1');
figure('Renderer', 'painters', 'Position', [450 450 900 800])
set_param('Lab1/switch', 'sw', '1');
tiledlayout(2,1);
% Wektory roznych wartosci R i C 
% Na pierwszej pozyzji kazdego z wektorow 
% znaduja sie paramerty przy ktorych K jest rowne 1
nexttile
R = 10;
C = 0.1;
K = 1 / (R*C);
WPC = 4;
dftA = sim('Lab1');
plot(dftA.tout,dftA.x);
grid
title('Stan systemu dla parametrów podanych w czwiczeniu')


nexttile
Rv = [10,5,15];
Cv = [0.1,0.05,0.15];
WPCv = [4,6,8];
WPC = WPCv(1); % ustalenie domyslnych
R = Rv(1);
% Zaleznosc stanu systemu od pojemnosci kondensatora
for i = 1:3  
    K = 1/(R * Cv(i));
    a = sim('Lab1');
    plot(a.tout,a.x);
    hold on;
end
grid
title('Stan systemu dla roznej pojemności')
hold off 

pause
% Zaleznosc stanu systemu od opornosci

clf
nexttile
plot(dftA.tout,dftA.x);
title('Stan systemu dla parametrów podanych w czwiczeniu')
grid
nexttile
WPC = WPCv(1);
C = Cv(1);

for i = 1:3  
    K = 1/(Rv(i) * C);
    a = sim('Lab1');
    plot(a.tout,a.x);
    hold on;
end
grid
title('Stan systemu dla różnej opornosci')
hold off
pause

% Zaleznosc stanu systemu od WPC
clf
nexttile
plot(dftA.tout,dftA.x);
title('Stan systemu dla parametrów podanych w czwiczeniu')
grid
nexttile
R = Rv(1);
C = Cv(1);
K = 1 /(R * C);
for i = 1:3  
    WPC = WPCv(i);
    a = sim('Lab1');
    plot(a.tout,a.x);
    hold on;
end
grid
title('Stan systemu dla roznego stanu poczetkowego')
hold off
pause

% Zadanie 2. Analiza ukladu dla WPC = 0 i roznych wartosci stalego
% sterowania
clf
WPC = 
values = 1:4;
colors = ['r','g','b','o'];
for i = 1:4
InitialVoltage = values(i);
FinalVoltage = values(i);
a = sim('Lab1');
plot(a.tout,a.x,colors(i));
hold on
plot(a.tout,a.u, colors(i));
hold on

end
grid
hold off
pause

% Zadanie 3. Analiza zachowania ukladu dla stalego stereowania rownego 1 i
% roznych wartosci poczatkowych
disp(K)
clf
initialVoltage = 1;
finalVoltage = 1;
values = linspace(4,20,4);
for i = 1:4
WPC = values(i);
a = sim('Lab1');
plot(a.tout,a.x);
hold on
end
grid
title('Rozne wartosci wpc');
hold off
pause

% Zadanie 4. Analiza dla roznych wartosci R i C, przy skoku nappiecia po 5
% sekunzie
clf;
StepTime = 5;
InitialVoltage = 3;
FinalVoltage = 0;
WPC = 0;
tiledlayout(2,1);
nexttile
Rv = [10,15];
Cv = [0.1,0.15];
K = 1/ (Rv(1) * Cv(1));
a = sim('Lab1');
plot(a.tout,a.x);
grid
hold on
plot(a.tout,a.u);
nexttile
K = 1/ (Rv(2) * Cv(2));
a = sim('Lab1');
plot(a.tout,a.x);
hold on
plot(a.tout,a.u);
hold off
grid
pause
% Zadanie 5. Padanie sygnalu o ksztalcie synusoidy
clf
Rv = linspace(10,40,4);
Cv = linspace(0.1,1,4);
RC = Rv .* Cv;
SimulationTime = max(RC) * 5;
for i= 1:4
K = 1/RC(i);
set_param('Lab1/switch','sw','0');
a = sim('Lab1');
plot(a.tout,a.x);
hold on 
end
pause