%Forostianyi Bohdan
function plotDataTiled(InputSig,OutSig,Color,Title,FirstLabel,SecondLabel)
% InputSin- inout sinusoidal signal
% SimOut - system reaction on signal
% Color - plot color
tiledlayout(3,1);
nexttile
plot(InputSig.Time,InputSig.Data(:,1),Color,'LineStyle','-.')
hold on
plot(OutSig.Time,OutSig.Data(:,1),Color)
hold off 
grid 
ylabel('Amplituda')
xlabel('Czas')
legend(FirstLabel,SecondLabel)
nexttile
plot(InputSig.Time,InputSig.Data(:,1),Color,'LineStyle','-.')
ylabel('Amplituda')
xlabel('Czas')
grid
legend(FirstLabel)
nexttile
plot(OutSig.Time,OutSig.Data(:,1),Color)
grid 
ylabel('Amplituda')
xlabel('Czas')
legend(SecondLabel)
title(Title)


disp('Press any key ....')
pause

