clear all
gcf = figure();
set(gcf, 'Position',  [100, 100, 700, 700])
SimTime = 10;

%zad 2 
H = tf([0 0 1],[1 1 2]);
nyquist(H)
pause;


H = tf([0 1 0],[1 -0.1 1]);
nyquist(H)
pause;

%zad 3

H = tf([0 1],[4 1 ]);
bode(H)
pause;

H = tf([0.4 0],[0.4 1]);
bode(H)
pause;

H = tf([0 1 0],[1 2 1]);
bode(H)
pause;

H = tf([0 0 1],[1 0.1 1]);
bode(H)
pause;



FreqV = [0.001,1,30,0.01,5];
PhV = [1,5,2,1,0];
AV = [2,3,1,2,4];




Numerator=[0 1]
Denominator=[4 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter dolnoprzepustowy");
end

Numerator=[0.4 0]
Denominator=[0.4 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter dolnoprzepustowy");
end
    
Numerator=[1 0]
Denominator=[1 2 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter dolnoprzepustowy");
end
    
Numerator=[0 1]
Denominator=[1 0.1 1]
for i = 1:length(FreqV)
Freq = FreqV(i);
Ph = PhV(i);
A = AV(i);
a = sim('Lab_4');
plotDataTiled(a.sim_in,a.sim_out,'k',"Filter dolnoprzepustowy");
end
    








Numerator=[3 3];
Denominator=[1 2 21];


SimTime = 30;
FreqV = linspace(1,7,4);
PhV = linspace(0,2 * pi,4);
AV = linspace(1,10,4);
data_matrix = [];
colors = ['r','g','b','k']
SimTime = 10;
FreqV = [1,pi/3,pi/4,pi/2];
PhV = [0,pi/3,pi/4,pi/2];
AV =  [1,2,3,4];
colors = ['r','g','b','k'];

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
