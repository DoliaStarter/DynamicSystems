%{ Faktycznie my znalesc rozwiazanie rownania rozniczkowego opisanego jako
% x'(t) = f(x(t)), gdzie f(x(t)) - jest jakas funkcja nieliniowa. W
% matlabie, zeby otrzymac rozwiazanie rownania rozniczkowego, robimy
% nastepne kroki:
% 1. zapisujemy jako handler funkcje odpowiadajaca naszemu rownaniu
% rozniczkowemu. Czyli f = @(t,Y) some_function
% t - to argument rownania rozniczkowego
% Y - wektor elementow wyjsciowych. W przypadku, jezeli rownanie rozniczkowe
% jest opisane za pomoca wektra rownan, wektor Y  staje sie macierza
% 2. przekazac ten handler to funkcji ode45
% 3. przekazac do ode45 przedzial czasowy i x(0)
% W pierwszym czwiczeniu faktycznie szukamy rozwiazania rownan i rysujemy
% ich wykresy. To, ze wykres nie zmienia sie ( w dziedinie czasowej jest to
% linia prosta, w portretach fazowych - punkt) jest zwiazane z tym, ze
% warunki poczatkowe dla ktorych my badamy sa punktami rownowagi. A punktam
% rownowagi odpowiadaja dokladnie takie wykresy
% Przyklad 1
% 
epsilon = 1; % epsilon z rownania x' = -x + epsilon*x^2
equilibrium_point_1 = 0;
equilibrium_point_2 = 1/epsilon;
% Wprowadzam tez losowy punkt poczatkowy, zeby zobaczyc, jak wygladaja inne
% trajektorii funkcji poszukiwanej
random_ic = rand();
equilibriums = [equilibrium_point_1,equilibrium_point_2]
% Definiuje handler, ktory potem przekaze do funkcji rysujacej. Wszystkie
% obliczenia beda wykonane tam
ode = @(t,x) -x + epsilon * x^2;
plot_in_time_domain(ode,equilibriums,[random_ic])

% Puntk rownowagi jest stabilny, jezeli wszystkie trajektorii, ktore
% startuja od niego zostaja w jego otoczeniu. Mozemy zatym wywnioskowac, ze
% system jest stabilny.

%System 2.
equilibium_points = [0,0]';
ode = @(t,x)[-x(1);-x(2)^2];
plot_phase_portrait(equilibium_points,ode)
%System 3. 
equilibium_points = [0,0;-2/3,0]';
ode = @(t,x)[x(2);-2 * x(1) - 3 * x(1) ^2 - x(2)^2];
plot_phase_portrait(equilibium_points,ode)

% We wszystkich przykladach widzimy, ze system, ktorego watoscia poczatkowa
% byl punkt rownowagi pozostaje w rownowadze

% Zadanie 2. Sprawdzic wplyw wartosci epsilon na rozmiar otoczenia w ktorym
% dynamiki systemu zlienerezowanego i niezlienerezowanego sa podobne.
epsilon = 1;
initial_conditions = [1/epsilon,-1/(epsilon),(1/10*epsilon),-1/(10*epsilon)];
ode = @(t,x) -x + epsilon * x^2;
equilibrium = 0;
linearized = @(t,x) -x;
compare_lin_ode(ode,linearized,equilibrium,initial_conditions);
% Dla innego punktu rownowagi
ode = @(t,x) -x + epsilon * x^2;
equilibrium = 1/epsilon;
linearized = @(t,x) -1 + 2 * epsilon * x;
compare_lin_ode(ode,linearized,equilibrium,initial_conditions);
% W tym czwiczeniu widzim, ze im blizej trajektoria jest do punktu
% rownowagi, tym lepiej linearyzacja przybliza funkcje oryginalna

% Zadanie 3. Sprawdzenie Tw. Grobmana Hartmana
% Tw. mowi, ze uklad i jego linearyzacja zachowuja sie tak samo w okolicah
% punktow rownowagi.
equilibrium_condition = [0;0];
% values shoul be between -2/3 and 0
initial_conditions = [0 0;-10^-5 -10^-5;-5*10^-3 0;-5*10^-3 -5*10^-3;-0.01 -0.01;]';
ode = @(t,x)[x(2);-2 * x(1) - 3 * x(1) ^2 - x(2)^2];
linearized = @(t,x)[x(2); -2*x(1) - x(2)];
compare_ode_lin_portraits(ode,linearized,equilibrium_condition,initial_conditions)
% Tutaj prawdopodobnie musimy zobaczyc podobne zjawisko jak w zadaniu
% poprzednim. Ale nie jestem pewien, dlatego, ze trajektorii sa nie do
% konca podobne. Jutro bede o tym czytal
