function plot_lorentz(lorentz, x0)
dt = 0.001;
time_span = dt:dt:50;
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,3));
[t,Y] = ode45(lorentz, time_span,x0,options);
plot3(Y(:,1),Y(:,2),Y(:,3),'k')
disp('Press any key ...');
pause()
end