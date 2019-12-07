clear all;
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


B=0;
C=1;
D=0;

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
legend('Punkty obliczone na podstawie rownania rekurycyjnego','Prosta otrzymana za pomoca zoh')
disp('Press any key ...')
pause;



%3 kapitalizacja odsetek
B=0;
C=1;
D=0;

IC =10; %poczatkowy kapital
r=0.03; % nominalna stopa procentowa
n=4 % czas trwania inwestycji

m=4; %liczba kapitalizacji w roku

Step=1/m;
SimTime=n;
A= (1+r/m)^(m*n); 
a = sim('Lab3');
Discrete(a,'r');
legend
m=2; 

Step=1/m;
SimTime=n;
A= (1+r/m)^(m*n); 
a = sim('Lab3');
Discrete(a,'g');

m=1; 
Step=1/m;
SimTime=n;
A= (1+r/m)^(m*n); 
a = sim('Lab3');
Discrete(a,'b');
hold off;
legend('Kapitalizacji w roku: 4','Kapitalizacji w roku: 2','Kapitalizacji w roku: 1');

disp('Press any key ...')
pause;



%Newton-Raphson

prompt = 'Podaj punkt poczatkowy (x0): ';
x=input(prompt);


f=@(x) cos(x)-3*x+1;

df=@(x) -sin(x)-3;
a=-1; b=1;

MaxIterations=1000;
 
for i=1:1:MaxIterations
x1=x-(f(x)/df(x));
x=x1;
end
sol=x;
fprintf('Pierwiastek:  %.15f',sol)








