%Forostianyi Bohdan
function plotData(InputSig,OutSig,Color,Title,FirstLabel,SecondLabel)
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
title(Title)
legend(FirstLabel,SecondLabel)
disp('Press any key ....')
pause

