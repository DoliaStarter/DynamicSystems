function plot_phase_portrait(handler, dimension)
 y1 = linspace(-10,10,20);
 y2 = linspace(-10,10,20);
 [x,y] = meshgrid(y1,y2);

 u = zeros(size(x));
 v = zeros(size(x));
 t=0; 
 for i = 1:numel(x)
    Yprime = handler(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
 end
 quiver(x,y,u,v,'r'); figure(gcf)
 xlabel('y_1')
 ylabel('y_2')
 axis tight equal;
 hold on
 for y20 = -10:10
    ic = repmat(y20,dimension,1);
    [~,ys] = ode45(handler,[0,50],ic);
    plot(ys(:,1),ys(:,2),'k')
    plot(ys(1,1),ys(1,2),'bo') % starting point
    plot(ys(end,1),ys(end,2),'ks') % ending point
 end
hold off
disp('Press any key ....');
pause;
end

