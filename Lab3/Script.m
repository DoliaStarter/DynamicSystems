A = 1;
B = 0;
C = 1;
D = 0;
IC = 5; % Initial condition - wartosc poczatkowa ukladu. Potrzebna zeby widzic 
% jak zachowuje sie uklad w zaleznosci od parametrow
% Step - parametr, ktory odpowiada kroku h
Step = 1;
% Dla wszystkich wartosci podawanych w simulink jako wejscie musi byc
% zachowany format o postaci [Czas,WartoscSygnalu]
% Це не означає. що сигнал моделюватиметься для цих значень
% Процес. який проходить в сімулінку приблизно такий:
% 1. Постійно подаються сигнали с елементу simin на блок ZOH.
% 2. З певною частотою ( в скрипті описана за допомогою змінної step він
% ( блок ZOH ) пропускає сигнал і починає його утримуати. Тобто:
% В моменті часу 0 блок ZOH пропустить сигнал 0 ( тому що так виглядає наш
% вектор сигналів ). 
% Від 0 до 1с сигнал на виході ZOH не змінюватиметься.
% В моменті часу 1с він прийме вартість 1. ( тому що так визначений наш
% вектор сигналів ).
% І так далі

Time = 0:0.1:10;
Signals = 0:0.1:10;

u_t = [Time',Signals'];


% Zadanie 1. Analiza rownania roznicowego %
% Dla uproszczenia rozpatrzmy uklad w ktorym macierzy A,B,C,D maja wymiary 1 x 1
% Potrzeba przeanalizowac rownanie roznicowe o postaci x(k+1) = lambda * x(k)
% Jest to rownanie roznicowe, ktore odpowiada ogolnemu wygladowi rownania
% roznicowego, z tym ze zamiast macierzy B,D sa wstawione zera.
% x(k) - wartsosc zmiennej, a y(x) - to stan systemu. 
% W powyzszym rownaniu mamy stosunek miedzy stanem systemu, a wartoscia
% zmiennej x 1:1, dlatego wstawiamy zamiast C jedynke.
% W powyzszym przykladzie, labmda nie odpowiada wartosci wlasnej macierzy,
% jest inne oznaczenie wspolczynnika A. Dlatego 
% zmieniajac wartosc macierzy A bedziemy w stanie przeanalizowac zachowanie sie
% ukladu.
% Interesuja nas stabilnosc ukladu, dlatego bedziemy patrzyc na to czy
% wartosc naszej zmiennej zbeiga do 0.
% Oczekiwany wynik:
% Zgodnie z tw. o stabilnosci systemu dynamicznego opisanego w czasie
% dyskretnym:
% System bedzie stabilny wtw., gdy wszyskie wartosci wlasne beda lezac
% wewnatrz kola jednostkowego o srodku w 0. 
% Biorac pod uwage to, ze dla macierzy o wymiarach 1x1 wartosc wlasna jest
% taka sama jak jedyny element tej macierzy, oczekujemy zobaczyc systemy
% stabilny dla A in (-1;1)
%1. Przypadek 1. A < -1



A = -3;
a = sim('Lab3');
plotData(a,A,Time,IC);

%2 A = -1
A = -1;
a = sim('Lab3');
plotData(a,A,Time,IC);

%A in (-1;0)
A = -0.5;
a = sim('Lab3');
plotData(a,A,Time,IC);

%A = 0
A = 0;
a = sim('Lab3');
plotData(a,A,Time,IC);

%A in (0;1)
A = 0.5;
a = sim('Lab3');
plotData(a,A,Time,IC);
%A = 1
A = 1;
a = sim('Lab3');
plotData(a,A,Time,IC);
%A > 1
A = 3;
a = sim('Lab3');
plotData(a,A,Time,IC);

% Matrix analysis %
A = eye(2);
B = [0;1];
C = eye(2);
D = [0;0];
IC = 5;
a = sim('Lab3');
% a.simout.Data(:,2) - тому що з Data - це матриця, в першій колоні якої
% стан Х, а в другій У, тобто стан системи яка нас цікавить
scatter(a.simout.Time,a.simout.Data(:,2),'filled');
grid
