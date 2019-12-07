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
P = eye(2);
J = [-1,1;0,-1];
A = P * J * P ^ (-1);
drawData

%------------------------------------------ 


