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
Rv = [10,50,100];
Cv = [0.1,0.05,0.15];
WPCv = [4,40,400];
%-------------------------------------------%

clf
WPC = 0;
tiledlayout(2,1)
nexttile
C = Cv(1);
RC = Rv .* C;
SimulationTime = max(RC) * 5;
for i= 1:3
K = 1/RC(i);
set_param('Lab1/switch','sw','0');
a = sim('Lab1');
plot(a.tout,a.x);
hold on 
end
grid

plot(a.tout,a.u);
leg1 = legend('$R = 10\,\Omega\;$','$R = 50\,\Omega\;$','$R = 100\,\Omega\; $','$u(t)$');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

title('Rozne wartosci R oraz sygnal sterujacy przy WPC = 0')
ylabel('Napiecie')
xlabel('Czas')

hold off
nexttile 


C = Cv(1);
RC = Rv .* C;
for i= 1:3
K = 1/RC(i);
set_param('Lab1/switch','sw','0');
a = sim('Lab1');
plot(a.tout,a.x);
hold on 

end
leg1 = legend('$R = 10\,\Omega\;$','$R = 50\,\Omega\;$','$R = 100\,\Omega\; $');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',17);

title('Rozne wartosci R bez sygnalu sterujacego przy WPC = 0')
ylabel('Napiecie')
xlabel('Czas')
grid

hold off
fprintf('\n Z powyzszych wykresow widac ze napiecie na kondesatorze jest o wiele mniejsze od napiecia sterujacego. Jest to spowodowane tym, ze czestotliwosc sygnalu sterujacego jest na tyle wysoka, ze kondensator nie zdaza zaladowac sie w wystarczajacym stopniu')

pause

