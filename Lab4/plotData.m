%Forostianyi Bohdan
function plotData(DataMatrix,Time)
% DataMatrix - matrix, constructed from vector simulation outputs
% Time - time vector
dim = size(DataMatrix)
for i = 1:dim(2)
    plot(Time,DataMatrix(:,i))
    hold on
end
hold off 
grid 
disp('Press any key ....')
pause

