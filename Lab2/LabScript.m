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
P = eye(4);
WPC = [0;0;0;0];
B = [0;0;0;0];
D = [0;0;0;0];
C = eye(4);

% 8 Zespolone wartosci wlasne, czesc rzeczywista jest rowna 0
% J  = [ 1i, 0;0, -1i];
disp('8')
J = [0,1,0,0;0,-1,0,0;0,0,0,-1;0,0,1,0];
A = P * J * P^(-1);
drawData

% 9 Wartosci wlasne - dwie spzezone liczbe urojone, mnijesze od zera 
%J=[-2-2i,0;0,-2+2i];
disp('9')
J = [-2,-2,0,0;2,-2,0,0;0,0,-2,2;0,0,2,2];
A = P * J * P^(-1);
drawData
% ----------------------------------------------------------------------
% Druga czesc cwiczenia. 
% Badanie wplywu wartosci wlasnych 
% Ten sam uklad wartosci wlascnych, ale one sa w rozny sposob
% przeskalowane
disp('Skalowanie lambd')
P = eye(2);
J = [-1,1;0,-1];
WPC = [0;0];
B = [0;0];
D = [0;0];
A = [0,0;0,0];
C = eye(2);

J = J * 2;
A = P * J * P^(-1);
drawData
%
disp('Skalowanie lambd')
J = J * 8;
A = P * J * P^(-1);
drawData
%------------------------------------------


J = diag([-1, 0]);
% Badanie wplywu wektorow wlasnych
disp('Zmiana wektorow wlasnych')
P = [1,0;0,1];
A = P * J * P^(-1)
drawData

% Druga czesc cwiczenia. Rozwiazanie dla roznych wektorow wlasnych
P = [1,1;0,1];
A = P * J * P^(-1)
drawData
disp('Zmiana wektorow wlasnych')

P = [1,-1;0,1];
A = P * J * P^(-1)
drawData
%------------------------------------------

