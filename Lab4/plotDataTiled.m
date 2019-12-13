%Forostianyi Bohdan
function plotDataTiled(InputSig,OutSig,Color,Title)
% InputSin- inout sinusoidal signal
% SimOut - system reaction on signal
% Color - plot color
title(Title)
tiledlayout(3,1);
nexttile
plot(InputSig.Time,InputSig.Data(:,1),Color,'LineStyle','-.')
hold on
plot(OutSig.Time,OutSig.Data(:,1),Color)
hold off 
grid 
ylabel('Amplituda')
xlabel('Czas')
legend('Sygnal wejsciowy','Symulacyjna odpowiedz')
nexttile
plot(InputSig.Time,InputSig.Data(:,1),Color,'LineStyle','-.')
ylabel('Amplituda')
xlabel('Czas')
grid
legend('Sygnal wejsciowy')
nexttile
plot(OutSig.Time,OutSig.Data(:,1),Color)
grid 
ylabel('Amplituda')
xlabel('Czas')
legend('Symulacyjna odpowiedz')


disp('Press any key ....')
pause

