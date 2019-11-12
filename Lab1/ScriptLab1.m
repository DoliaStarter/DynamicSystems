% Zadanie 1. Zależność stanu systemu od parametrow R i C

close all
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


% Wizualizacja napiecia na kondesatorze dla roznych pojemnosci 
K = 1/(R * Cv(1));
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

WPC = WPCv(1); % ustalenie domyslnych
R = Rv(1);

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
fprintf('Skoro napiecie opisuje jaka prace musi wykonac pole zeby przeniesc ladunek z punktu A w punkt B - zerowe napiecie oznacza ze ono nie wykonuje zadnej pracy. \n Czyli opor jest rowny 0, co w przypdku kondensatora jest mozliwe tylko wtedy, gdy on jest rozladowany\n')
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
title('Napiecie sterujace')
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
title('Napiecie sterujace')
hold off
fprintf('\n Widac, ze czas potrzebny na rozladowywanie kondesotoru \n nie zalezy od tego, jakie napiecie bylo na nim w moment kiedy on zaczal sie rozladowywac \n')
fprintf('\n Dowolny klawisz zeby kontynuowac...\n')
pause




% Zadanie 2. Analiza ukladu dla WPC = 0 i roznych wartosci stalego
% sterowania
clf

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
ylabel('Napiecie')
title('Analiza ukladu dla WPC = 0 i roznych wartosci stalego sterowania')
grid
hold off
fprintf('\n Widac, ze napiecie sterujace jest granica dla napiecia na kondensatorze.\n Oznacza, to tyle, ze spadek napiecia na C nigdy nie bedzie wieksze niz napiecie sterujace.\n Innymi slowy: jest potwierdzenie prawa Kirchoffa:\n Suma napiec w obwodzie jest rowna 0')
fprintf('\n Dowolny klawisz zey kontynuowac ...\n' )
pause

% Zadanie 3. Analiza zachowania ukladu dla stalego sterowania rownego 1 i
% roznych wartosci poczatkowych
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
fprintf('\n Ponownie widac, ze wartosc napiecia sterujacego jest wartoscia graniczna na kondensatorze. Faktycznie to oznacza, ze w momencie gdy kondesator sie rozladowuje on zaczyna sie doladowywac od napiecia sterujacego, wiec napiecie na nim jest ciagle rowne napieciu sterujacemu\n')
fprintf('\n Dowolny klawisz zeby kontynuowac...\n')
hold off
pause

% Zadanie 4. Analiza dla roznych wartosci R i C, przy skoku nappiecia po 5
% sekundzie
% Ustawienie parametrow dla modulu
%-----------------------------------------
clf;
StepTime = 5;
InitialVoltage = 3;
FinalVoltage = 0;
WPC = 0;
%-----------------------------------------
tiledlayout(2,1);
nexttile
R = Rv(1);
for i = 1:3

K = 1/ (R * Cv(i));
a = sim('Lab1');
plot(a.tout,a.x);
hold on
end
plot(a.tout,a.u);
leg1 = legend('$R = 10\,\Omega\;$','$R = 5\,\Omega\;$','$R = 15\,\Omega\; $','$u(t)$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

title('Analiza dla roznych wartosci R, przy skoku napiecia po 5 sekundzie')
ylabel('Napiecie')
xlabel('Czas')
grid
hold on

hold off 

nexttile
C = Cv(1);
for i = 1:3
K = 1/ (Rv(i) * C);
a = sim('Lab1');
plot(a.tout,a.x);
hold on
end

plot(a.tout,a.u);
leg1 = legend('$C = 0.1F\;$','$C = 0.05F\;$','$C = 0.15F\; $','$u(t)$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

title('Analiza dla roznych wartosci C, przy skoku napiecia po 5 sekundzie')
ylabel('Napiecie')
xlabel('Czas')
grid
hold off
fprintf('\n Widac, ze kondesatory, ktore maja wieksza stala K ( wieksza pojemnosc lub wiekszy opor ) wolniej sie laduja, a takze wolniej sie rozladowuja.\n Natomiast kondensatory o mniejszej stalej K, szybciej sie doladowuja i szybciej sie rozladowuja\n')
fprintf('\n Dowolny klawisz zeby kontynuowac ....\n')

pause
% Zadanie 5. Podanie sygnalu o ksztalcie synusoidy
clf
WPC = 0;
tiledlayout(2,1)
nexttile
R = Rv(1);
RC = R .* Cv;
SimulationTime = max(RC) * 5;
for i= 1:3
K = 1/RC(i);
set_param('Lab1/switch','sw','0');
a = sim('Lab1');
plot(a.tout,a.x);
hold on 
end
grid

leg1 = legend('$R = 10\,\Omega\;$','$R = 5\,\Omega\;$','$R = 15\,\Omega\; $','$u(t)$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

title('Rozne wartosci R oraz sygnal sterujacy przy WPC = 0')
ylabel('Napiecie')
xlabel('Czas')

hold off
nexttile 


R = Cv(1);
RC = R .* Cv;
for i= 1:3
K = 1/RC(i);
set_param('Lab1/switch','sw','0');
a = sim('Lab1');
plot(a.tout,a.x);
hold on 

end
leg1 = legend('$R = 10\,\Omega\;$','$R = 5\,\Omega\;$','$R = 15\,\Omega\; $','$u(t)$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

title('Rozne wartosci R bez sygnalu sterujacego przy WPC = 0')
ylabel('Napiecie')
xlabel('Czas')
grid

hold off
fprintf('\n Z powyzszych wykresow widac dwie rzeczy:\n 1.Napiecie na kondesatorze jest o wiele mniejsze od napiecia sterujacego. Jest to spowodowane tym, ze czestotliwosc sygnalu sterujacego jest na tyle wysoka, ze kondensator nie zdaza zaladowac sie w wystarczajacym stopniu\n 2.Z wykresu (2) napiecie na kondensatorze widzimy, ze sygnalu jest potrzebny pewien czas zeby sie wystabilizowac. Ponadto, widac, ze im wieksza stala K ma kondensator, tym mniej czasu on potrzebuje na to zeby sie doladowac')

pause

% Zadanie 6. Przykladowe rozwiazanie zadan z kolokwium 

% Zadanie 1.4
R = 10^6;
C = 10^(-6);
WPC = -1.72;

