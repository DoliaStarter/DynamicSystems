function how_stability_depends_on_a()
for a = -10:5:10
 ode = @(t,x) a.*x - x.^3;
 tiledlayout(3,1)
 nexttile
% Badanie stabilnosci punktu rownowagi 0
 x_r = 0;
 surroundings = [x_r,x_r+0.2,x_r-0.2];
 plot_in_time_domain(ode,[x_r],surroundings)
 title(sprintf('x_r = 0, a = %d', a))
% Badanie stabilnosci dla punktu rownowagi sqrt(a)
 nexttile
 x_r = sqrt(a);
 surroundings = [x_r,x_r+0.2,x_r-0.2];
 plot_in_time_domain(ode,[x_r],surroundings)
 title(sprintf('x_r = sqrt(a), a = %d', a))
% Badanie stabilnosci dla punktu rownowagi sqrt(-a)
 nexttile
 x_r = -sqrt(a);
 surroundings = [x_r,x_r+0.2,x_r-0.2];
 plot_in_time_domain(ode,[x_r],surroundings)
 title(sprintf('x_r = -sqrt(a), a = %d', a))
 disp('Press any key ...')
 pause
end
end