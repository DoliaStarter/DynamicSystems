% Forostianyi Bohdan
% ustawienie zmiennych globalnych wykorzystywanych w trakcie symulacji
FinalVoltage = 0;
InitialVoltage = 0;
StepTime = 0; % czas po którym odbędzie się skok na skokowym źródle napięcia
SimulationTime = 10;
% plik z glowna symulacja 
open('Lab1');
figure('Renderer', 'painters', 'Position', [450 450 900 800])
set_param('Lab1/switch', 'sw', '1');
% Layout utworzony z dwoch klatek : 
% 1 - wykres przy parametrach domyslnych
% 2 - wykres dla zmienionych parametrow
% Rysowanie wykresu dla parametrow podanych w konspekcie
%-------------------------------------------%
% deklaracja wektorow
Rv = [10,5,15];
Cv = [0.1,0.05,0.15];
WPCv = [4,40,400];
%-------------------------------------------%
tiledlayout(2,1);
nexttile
% ustawienie domyslnych wartosci dla danej symulacji
WPC = WPCv(1); 
R = Rv(1);



% Wizualizacja napiecia na kondesatorze dla roznych pojemnosci 
K = 1/(Rv(1) * Cv(1));
a = sim('Lab1');
plot(a.tout,a.u);
hold on;
xlabel('Czas');
ylabel('Napiecie sterujace');
leg1 = legend('$u(t) = 0 $');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
title('Stan systemu dla roznej pojemnosci');
grid
title('Napiecia sterujacego')

nexttile
% Inicjalizacja roznych wartosci R, C, WPC 

% Wizualizacja napiecia na kondesatorze dla roznych pojemnosci 
for i = 1:3  
    K = 1/(R * Cv(i));
    a = sim('Lab1');
    plot(a.tout,a.x);
    hold on;
end
grid
xlabel('Czas');
ylabel('Napięcie na kondensatorze');
leg1 = legend('$C = 0.10$','$C=0.05F\;$','$C = 0.15F\;$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
title('Stan systemu dla roznej pojemnosci');
hold off 
fprintf('Z wykresu widac, ze im wieksza jest pojemnosc kondesatora, tym wolniej on bedzie sie rozladowywac\n')
fprintf('Taki wniosek jest spowodowany tym, ze na wykresach widzimy napiecie w kazdej chwili na kondesatorze\n Takze na wykresie widac, ze napiecie zbiega do 0.\n Skoro napiecie opisuje jaka prace musi wykonac pole zeby przeniesc ladunek z punktu A w punkt B - zerowe napiecie oznacza ze ono nie wykonuje zadnej pracy. \n W przypdku kondensatora jest mozliwe tylko wtedy, gdy on jest rozladowany\n')
fprintf('\n Dowolny klawisz żeby kontynuować ... \n')
pause
clc
clf

% Zaleznosc stanu systemu od opornosci

nexttile
plot(a.tout,a.u);
hold on;
xlabel('Czas');
ylabel('Napiecie sterujace');
leg1 = legend('$u(t) = 0 $');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
title('Napiecie sterujace')
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
leg1 = legend('$R = 10\,\Omega\;$','$R = 5\,\Omega\;$','$R = 15\,\Omega\; $');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
title('Stan systemu dla roznej opornosci')
xlabel('Czas');
ylabel('Napiecie na kondensatorze');
title('Napiecie na kondesatorze')
hold off
fprintf('\n Z wykresu widac,ze im wiekszy jest opor na rezystorze, tym wolniej sie rozladowuje kondenstator. \n')
fprintf('\n Dowolny klawisz żeby kontynuować ... \n')
pause
fprintf('\n Biorac pod uwage powyzsze wykresy mozna dojsc do wniosku, ze im mniejsza bedzie stala K = 1/RC - tym wolniej bedzie rozladowywac sie kondensator\n')

% Zaleznosc stanu systemu od WPC
clf
clc

nexttile
plot(a.tout,a.u);
hold on;
title('Napiecie sterujace');
xlabel('Czas');
ylabel('Napięcie sterujace');
leg1 = legend('$u(t) = 0 $');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
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
title('Stan systemu dla rożnego stanu poczatkowego')
leg1 = legend('$x_0 = 4V$','$x_0= 40V$','$x_0 = 400 V$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);
xlabel('Czas');
ylabel('Napiecie na kondensatorze');
title('Napiecie na kondensatorze')
hold off
fprintf('\n Widac ze niezaleznie od tego jakie bylo napiecie poczatkowe na kondesatorze w koncu ono przyjdzie do 0.( Wartosc napiecia sterujacego ) \n')
fprintf('\n Dowolny klawisz zeby kontynuowac...\n')
pause


