%Forostianyi Bohdan
function plotData(InputSig,OutSig,Color)
% InputSin- inout sinusoidal signal
% SimOut - system reaction on signal
% Color - plot color

plot(InputSig.Time,InputSig.Data(:,1),Color,'LineStyle','-.')
hold on
plot(OutSig.Time,OutSig.Data(:,1),Color)
hold off 
grid 
ylabel('Amplituda')
xlabel('Czas')
legend('Sygnal wejsciowy','Symulacyjna odpowiedz')
disp('Press any key ....')
pause

