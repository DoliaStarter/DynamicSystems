%Bohdan Forostainyi
% Faktycznie my musimy znalesc rozwiazanie rownania rozniczkowego opisanego jako
% x'(t) = f(x(t)), gdzie f(x(t)) - jest jakas funkcja nieliniowa. 
% W pierwszym czwiczeniu faktycznie szukamy rozwiazania rownan i rysujemy
% ich wykresy. Na wykresach punkty rownowagi - to punkty dla ktorych
% trajektoria nie zmienia sie w czasie. Czyli linia prosta w dziedinie
% czasowej. Punkt na portrecie fazowym. W sprawozdaniu zadaniem jest
% sprawdzic jak zachowuja sie systemy w okolicach punkut rownowagi.
% Przyklad 1

epsilon = 1; % epsilon z rownania pierwszego : x' = -x + epsilon*x^2
ode = @(t,x) -x + epsilon * x^2;

% Zadaniem jest zbadac stabilnosc punktow rownowagi. Punkt rownowagi jest
% stabilny wtw. gdy przy dowolnych warunkach poczatkowych z bliskiego
% otoczenia tego punktu trajektoria zbiega o tego puntku rownowagi
% Pierwszy punk rownowagi = 0
equilibrium = 0;
surroundings = [equilibrium,equilibrium+0.2,equilibrium-0.2];
plot_in_time_domain(ode,[equilibrium],surroundings)
% Punkt rownowagi = 1/ epsilon 
equilibrium = 1/epsilon;
surroundings = [equilibrium,equilibrium-0.00002,equilibrium+0.00002];
plot_in_time_domain(ode,[equilibrium],surroundings)

%System 2.

equilibrium = [0;0];
x1dot = @(x1,x2) -x1 + 0*x1;
x2dot = @(x1,x2) 0*x1 -x2.^2;
plot_phase_portrait(equilibrium,x1dot,x2dot)

% System 3.
equilibrium = [0,0;-2/3,0]';
x1dot = @(x1, x2) 0.*x1 + x2;
x2dot = @(x1, x2) -2 .* x1 - 3.*x1 -x2.^2;
plot_phase_portrait(equilibrium,x1dot,x2dot)











% Zadanie 2. Sprawdzic wplyw wartosci epsilon na rozmiar otoczenia w ktorym
% dynamiki systemu zlienerezowanego i niezlienerezowanego sa podobne.
% Skrypt jest podzielony na dwie sekcji dlatego, dla kazdego punktu
% rownowagi, rownanie zlinearyzowane sie rozni

epsilon = 1;
initial_conditions = [1/epsilon,-1/(epsilon),(1/10*epsilon),-1/(10*epsilon)];
ode = @(t,x) -x + epsilon * x^2;
% Punkt rownowagi = 0
equilibrium = 0;
linearized = @(t,x) -x;
compare_lin_ode(ode,linearized,equilibrium,initial_conditions);
% Porownywanie dla punktu rownowagi 1/epsilon
equilibrium = 1/epsilon;
linearized = @(t,x) -1 + 2 * epsilon * x;
compare_lin_ode(ode,linearized,equilibrium,initial_conditions);
% W tym czwiczeniu widzimy, ze im blizej trajektoria jest do punktu
% rownowagi, tym lepiej linearyzacja przybliza funkcje oryginalna



% Zadanie 3. Sprawdzenie Tw. Grobmana Hartmana
% Tw. mowi, ze uklad i jego linearyzacja zachowuja sie tak samo w okolicah
% punktow rownowagi, jezeli to sa hiperboliczne punkty rownowagi
% Skrypt jest podzielony na dwie sekcji dlatego, dla kazdego punktu
% rownowagi, rownanie zlinearyzowane sie rozni
equilibrium = [0;0];
x1dot = @(x1, x2) 0.*x1 + x2;
x2dot = @(x1, x2) -2 .* x1 - 3.*x1 -x2.^2;
lin_x1dot = @(x1,x2) 0*x1 + x2;
lin_x2dot = @(x1,x2) -2*x1 - x2;
compare_ode_lin_portraits(equilibrium,x1dot,x2dot,lin_x1dot,lin_x2dot)

% Punkt rownowagi
equilibrium = [-2/3;0];
lin_x1dot = @(x1,x2) 0*x1 + x2;
lin_x2dot = @(x1,x2) 2*x1 + 4/3 - x2;
compare_ode_lin_portraits(equilibrium,x1dot,x2dot,lin_x1dot,lin_x2dot)
