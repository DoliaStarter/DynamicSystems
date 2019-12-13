% Forostianyi Bohdan
% simulation params
% Ph - phase of sinus input
% Freq - frequency of sinus input
% A - amplitude of sinus input
% SimTime - duration of simulation
clear all
SimTime = 10;
FreqV = [1,pi/3,pi/4,pi/2];
PhV = [0,pi/3,pi/4,pi/2];
AV =  [1,2,3,4];
colors = ['r','g','b','k'];
gcf = figure();
set(gcf, 'Position',  [100, 100, 700, 700])
% Zmiana czestotliwosci
disp('Chaging frequency')
for i = 1:length(FreqV)
    Freq = FreqV(i)
    Ph = PhV(1)
    A = AV(1)
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k','Zmiana czestotliwosci');
end
%Zmiany fazy
disp('Chaging phase')
for i = 1:length(PhV)
    Freq = FreqV(1);
    Ph = PhV(i);
    A = AV(1);
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k','Zmiana fazy');
end
%Zmiany amplitudy
disp('Chaging amplitude')
for i = 1:length(AV)
    Freq = FreqV(1);
    Ph = PhV(1);
    A = AV(i);
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k','Zmiana amplitudy');
end