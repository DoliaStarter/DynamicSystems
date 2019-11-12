% Forostianyi Bohdan 
%-----------------------------------------
clf;
StepTime = 5;
InitialVoltage = 3;
FinalVoltage = 0;
WPC = 0;
%-----------------------------------------
%-------------------------------------------%
% deklaracja wektorow
Rv = [10,5,15];
Cv = [0.1,0.05,0.15];
WPCv = [4,40,400];
%-------------------------------------------%


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
fprintf('\n Widać, że obwody w których stala K jest mniejsza ( wiekszy opór ) wolniej sie ladują, a takze wolniej się rozladowuja.Natomiast kondensatory o mniejszej stalej K, szybciej sie ladują i szybciej sie rozladowują\n')
fprintf('\n Dowolny klawisz zeby kontynuowac ....\n')

pause