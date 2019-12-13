%Forostianyi Bohdan
function plotDataTiled(InputSig,OutSig,Color)
% InputSin- inout sinusoidal signal
% SimOut - system reaction on signal
% Color - plot color
tiledlayout(2,1);

nexttile
plot(InputSig.Time,InputSig.Data(:,1),Color,'LineStyle','-.')
grid
legend('Sygnal wejsciowy')
nexttile
plot(OutSig.Time,OutSig.Data(:,1),Color)
grid 
legend('Symulacyjna odpowiedz')
disp('Press any key ....')
pause

