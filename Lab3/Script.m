SimTime = 10;
A = 1;
B = 0;
C = 1;
D = 0;
IC = 5; % Initial condition - wartosc poczatkowa ukladu. Potrzebna zeby widzic 
% jak zachowuje sie uklad w zaleznosci od parametrow
% Step - parametr, ktory odpowiada kroku h
Step = 2;
% Dla wszystkich wartosci podawanych w simulink jako wejscie musi byc
% zachowany format o postaci [Czas,WartoscSygnalu]

Time = 0:Step:SimTime;
Signals = 0:Step:SimTime;

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
plotData(a,A,IC);

%2 A = -1
A = -1;
a = sim('Lab3');
plotData(a,A,IC);

%A in (-1;0)
A = -0.5;
a = sim('Lab3');
plotData(a,A,IC);

%A = 0
A = 0;
a = sim('Lab3');
plotData(a,A,IC);

%A in (0;1)
A = 0.5;
a = sim('Lab3');
plotData(a,A,IC);
%A = 1
A = 1;
a = sim('Lab3');
plotData(a,A,IC);
%A > 1
A = 3;
a = sim('Lab3');
plotData(a,A,IC);


%Zadanie 2
Step = 1;
IC = 5;
A = [0,1;-6,-11];
D = [0;0];
B = [0;1];
C = eye(2);
AP = expm(A*Step);
syms t;
fun = expm(t * A);
BP = double(vpaintegral(fun,t,[0 Step])) * B;
a = sim('Lab3_zad2');
scatter(a.discrete.Time,a.discrete.Data(:,1),'r','f')
hold on
%scatter(a.discrete.Time,a.discrete.Data(:,2),'b','f')
%hold on
plot(a.cont.Time, a.cont.Data(:,1),'k')
hold off
grid
legend('Punkty obliczone na podstawie rownania rekurenyjnego','Prosta otrzymana za pomoca zoh')
disp('Press any key ...')
pause;

