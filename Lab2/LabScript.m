WPC = [0;0];
A = [0,0;0,0];
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

J = [0,0;0,0];
A = P * J * P^(-1);
drawData

% Widzimy system stabilny. Dzije sie tak latego, ze w rownaniu stanu,
% opisanego za pomoca macierzy nie mamy zadnych wspolczynnikow oprocz zera.
% Czyli pochodna pierwsza jest rowna 0, druga tez => x jest stala, dlatego
% po usunieciu osi czasu mamy puntk na plasczyznie, ktory odpowiada
% poczatku ukladu

% 2 Podwojna wartosc wlasna rowna zeru, nieliniowy dzielnik elementarny 
J = [0,1;0,0];
A = P * J * P^(-1);
drawData
% Widzimy system niestabilny. Trajektorii nie zbiegaja do jedengo puntktu,
% a rozchodza sie od zrodla. 

% 3 Zerowa wartosc wlasna oraz wartosc wlasna mniejsza od zera
J = diag([-1, 0]);
A = P * J * P^(-1);
drawData
% Widzimy system asymptotycznie stabilny, dlatego ze trajektorii zbiegaja
% sie do jednego puntku, jednak ten puntk jest rozny dla kazdej z
% trajektorii

% 4 Obie wartosci wlasne sa mniejsze od zera
J = diag([-5, -1]);
A = P * J * P^(-1);
drawData
% Widzimy system stabilny. Jedno zrolo

% 5 Podwojna wartosc wlasna mniejsza od 0, liniowy dzielnik elementarny
J = [-1,0;0,-1];
A = P * J * P^(-1);
drawData
% System stabilny: wiele trajektrorii jeden punkt do ktorego one zbiegaja 

% 6 Podwojna wartosc wlasna mniejsza od 0, nieliniowy dzielnik elementarny
J = [-1,1;0,-1];
A = P * J * P^(-1);
drawData
% Rowniez system stabilny 

% 7 Wartoscie wlasne ktore znajduja sie po rozne strony od 0
J  = [ -1, 0;0, 1];
A = P * J * P^(-1);
drawData
% System jest stabilny: kazda trajektoria zbiega do pewnej granicy

% 8 Zespolone wartosci wlasne, czesc rzeczywista jest rowna 0
%J  = [ 1i, 0;0, -1i];
%A = P * J * P^(-1);
%drawData

% 9 Wartosci wlasne - dwie spzezone liczbe urojone, mnijesze od zera 
%J=[-2-2i,0;0,-2+2i];
%A = P * J * P^(-1);
%drawData
J = [-1,1;0,-1];
% Druga czesc cwiczenia. 
% Badanie wplywu wartosci wlasnych 
% Takie sam uklad wartosci wlascnych, ale one sa w rozny sposob
% przeskalowane
J = J * 2;
A = P * J * P^(-1)
drawData
%
J = J * 4;
A = P * J * P^(-1)
drawData
% Widzimy, ze przy zmianie wektorow rosnie szybkosc z jaka nasz system day
% do stanu stabilnosci ( czarwone strzalki sie wydluzyly )


J = diag([-1, 0]);
% Badanie wplywu wektorow wlasnych
P = [1,0;0,1];
A = P * J * P^(-1)
drawData

% Druga czesc cwiczenia. Rozwiazanie dla roznych wektorow wlasnych
P = [1,1;0,1];
A = P * J * P^(-1)
drawData

P = [1,-1;0,1];
A = P * J * P^(-1)
drawData
% Zmieniac wektory glowne w macierzy P faktucznie zmieniamy baze pzestrzeni.
% System jest jednoznacznie opisany przez macierz J, czyli macierz
% stanu A ma takie same wlasnosci co macierz J. jak widzimy, po
% przeksztalceniu wykres nadal ma taka sama stabilnosc i taki sam portret
% fazowy, z tym ze portret jest zmieniony przekstalcony za pomoca wektorow
% glownych. Prowadzi to do wniosku, ze system bedzie taki sam w kazdej
% przestrzeni
% Przemnozenie wektorow
% wlasnych przez macierz J powoduje to, ze zmienia sie polozenie punktow w
% zaleznosci od tego. W przypadku jezel B = 0

