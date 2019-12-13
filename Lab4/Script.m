% Forostianyi Bohdan
% simulation params
% Ph - phase of sinus input
% Freq - frequency of sinus input
% A - amplitude of sinus input
% SimTime - duration of simulation
clear all
SimTime = 30;
FreqV = linspace(1,7,4);
PhV = linspace(0,2 * pi,4);
AV = linspace(1,10,4);
data_matrix = [];
colors = ['r','g','b','k']
for i = 1:length(FreqV)
    Freq = FreqV(i);
    Ph = PhV(i);
    A = AV(i);
    a = sim('Lab_4');
    plotDataTiled(a.sim_in,a.sim_out,'k');
end