% Forostianyi Bohdan
% simulation params
% Ph - phase of sinus input
% Freq - frequency of sinus input
% A - amplitude of sinus input
% SimTime - duration of simulation
clear all
SimTime = 10;
FreqV = linspace(1,7,4);
PhV = linspace(0,2 * pi,4);
AV = linspace(1,10,4);
data_matrix = [];
for i = 1:length(FreqV)
    Freq = FreqV(i);
    Ph = PhV(i);
    A = AV(i);
    a = sim('Lab_4');
    data_matrix = [data_matrix,a.res.Data(:,1)];
end
time = a.res.Time;
plotData(data_matrix, time)