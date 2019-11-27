WPC = 0;
X = 1;
DutyCycle = zeros(1,100);
for i = 1:99
   X = i;
   a = sim('Lab1');
   DutyCycle(i) = a.x(end-1);
   
end
Distances = abs(DutyCycle - 2);
[v,idx] = min(Distances);
fprintf('Duty cycle: %d %%, error with selected step: %f\n', idx, Distances(idx));