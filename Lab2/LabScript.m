% ----------------------Forostianyi Bohdan ------------------------- %

WPC = [0;0];
B = [0;0];
D = [0;0];
A = [0,0;0,0];
C = eye(2);
figure('Renderer', 'painters', 'Position', [10 10 900 600])
open('Lab2');
% Zmienna od ktorej zalezy czy wartosci wlasne beda wybierany z brzegu
% kwadartu, czy z brzegu kola 
% Mozna wybierac jednoczesnie z brezgu kwadratu i z brzegu kola. W tym celu
% nalezy rozkomentowac obie opcje

InitialSystemState = 'Circle'
% InitialSystemState = 'Square'
%------------------------------------------------------------------------
% Ustawienie P jako macierze jednostkowej jest potrzebne do realizacji
% pierwszej czesci czwiczenia
P = eye(2);

% 1 Liniowy dzielnik elementarny, podwojna wartosc wlasna, rowna 0 
disp('1')
J = [0,0;0,0];
A = P * J * P^(-1);
drawData

%------------------------------------------ 

% 2 Podwojna wartosc wlasna rowna zeru, nieliniowy dzielnik elementarny 
disp('2')
J = [0,1;0,0];
A = P * J * P^(-1);
drawData
%------------------------------------------

% 3 Zerowa wartosc wlasna oraz wartosc wlasna mniejsza od zera
disp('3')
J = diag([-1, 0]);
A = P * J * P^(-1);
drawData
%------------------------------------------
% 4 Obie wartosci wlasne sa mniejsze od zera
disp('4')
J = diag([-5, -1]);
A = P * J * P^(-1);
drawData
%------------------------------------------

% 5 Podwojna wartosc wlasna mniejsza od 0, liniowy dzielnik elementarny
disp('5')
J = [-1,0;0,-1];
A = P * J * P^(-1);
drawData
%------------------------------------------

% 6 Podwojna wartosc wlasna mniejsza od 0, nieliniowy dzielnik elementarny
disp('6')
J = [-1,1;0,-1];
A = P * J * P^(-1);
drawData
%------------------------------------------

% 7 Wartoscie wlasne ktore znajduja sie po rozne strony od 0
disp('7')
J  = [ -1, 0;0, 1];
A = P * J * P^(-1);
drawData
%------------------------------------------

% Solver nie przyjmuje liczby zespolone, dlatego nalezy przekonwertowac je na liczby rzeczywiste, 
% zamieniac kazda liczbe rzeczywista macierza o wymiarach 2 x 2
% W tym celu nalezy takze zmienic inne paramerty.


% 8 Zespolone wartosci wlasne, czesc rzeczywista jest rowna 0
J  = [ -1i, 0;0, 1i];
P = [1i,-1i;1,1];
disp('8')
A = P * J * P^(-1);
drawData

% 9 Wartosci wlasne - dwie spzezone liczbe zespolone, mnijesze od zera 
J=[-1-2i,0;0,-1+2i];
P = [-1+2i,-1-2i;5,5];
disp('9')
A = real(P * J * P^(-1));
drawData
% ----------------------------------------------------------------------
% Druga czesc cwiczenia. 
% Badanie wplywu wartosci wlasnych 
% Ten sam uklad wartosci wlascnych, ale one sa w rozny sposob
% przeskalowane
disp('Macierz podstawowa')
P = eye(2);
J = [-1,1;0,-1];
WPC = [0;0];
B = [0;0];
D = [0;0];
A = [0,0;0,0];
C = eye(2);
drawData
disp('Macierz z ww odpowiadajaca wektorowi Y zamieniona na -10')
J = [-1,1;0,-10];
A = P * J * P^(-1);
drawData
%
disp('Macierz z ww odpowiadajaca wektorowi X zamieniona na -10')

J = [-10,1;0,-1];
A = P * J * P^(-1);
drawData
%------------------------------------------


% Druga czesc cwiczenia. Wykresy dla roznych wektorow wlasnych
P = [1,1;0,1];
A = P * J * P^(-1)
drawData
disp('Zmiana wektorow wlasnych')
P = [1,-1;0,1];
A = P * J * P^(-1);
drawData
%------------------------------------------

