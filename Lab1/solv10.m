WPC = 0;
DutyCycle = zeros(1,10);
for i = 20:30
   X = i;
   a = sim('Lab1');
   
   DutyCycle(i-19) = a.x(end);
end
Distances = abs(DutyCycle - 2);
[v,idx] = min(Distances);
fprintf('Duty cycle: %d %%, error with selected step: %f\n', idx+19, Distances(idx));