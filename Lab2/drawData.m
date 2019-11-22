    
    tiledlayout(1,1);
    clf
    
    WPCval = linspace(0,2*pi,50);
    ax1 = nexttile;
    if InitialSystemState == 'Circle'
    for idx = 1:length(WPCval)
        res = sim('Lab2');
        plot(res.x(:,1), res.x(:,2),'k','LineWidth', 0.2)
        % conditional to draw a single in case if all data will land in the
        % same point. Should use this method, because with plot function one
        % point will be unnoticalble
        if max(abs(res.x(:,1) - max(res.x(:,1)))) <= eps && max(abs(res.x(:,2) - max(res.x(:,2)))) <= eps
            plot(res.x(1,1), res.x(1,2), 'ko', 'MarkerSize', 5,'MarkerFaceColor','k');
        end
    
        xlabel('X1')
        ylabel('X2')
        % direction 
        hold on
        p1 = [res.x(idx,1) res.x(idx,2)];
        p2 = [res.x(idx+20,1) res.x(idx+20,2)];
        dp = p2 - p1;
        quiver(p1(1),p1(2),dp(1),dp(2),'r')
       %-------------------------
        hold on 
        WPC(1) = sin(WPCval(idx));
        WPC(2) = cos(WPCval(idx));
    end
    % eigenvectors 
    quiver([0,0],[0,0],[P(1,2),P(1,1)],[P(2,2),P(2,1)],'b','LineWidth', 1)    
    hold off 
    %-------------------------
    %title,axes,grid
    grid
    title("WPC leza na okregu jednostkowym o srodku w (0,0)")
    axis square
    xlim([-1.2,1.2]);
    ylim([-1.2,1.2]);
    %---------------
    disp("Press any key ....")
    pause;
    end
    clf
    
    if InitialSystemState == 'Square'
    % new figure 
    
    for idx = 1:length(WPCval)
        WPC(1) = sin(WPCval(idx));
        WPC(2) = cos(WPCval(idx));
        p = max(abs(WPC(1)),abs(WPC(2)));
        WPC = WPC/p;
        res = sim('Lab2');
        plot(res.x(:,1), res.x(:,2),'k','LineWidth', 0.2)
        % conditional to draw a single in case if all data will land in the
        % same point. Should use this method, because with plot function one
        % point will be unnoticalble
        if max(abs(res.x(:,1) - max(res.x(:,1)))) <= eps && max(abs(res.x(:,2) - max(res.x(:,2)))) <= eps
             plot(res.x(1,1), res.x(1,2), 'ko', 'MarkerSize', 5,'MarkerFaceColor','k');
        end
        xlabel('X1')
        ylabel('X2')
        hold on
        % direction 
        p1 = [res.x(idx,1) res.x(idx,2)];
        p2 = [res.x(idx+20,1)  res.x(idx+20,2)];
        dp = p2 - p1;
        quiver(p1(1) ,p1(2),dp(1),dp(2),'r')
        %-------------------------
        hold on
    end
    % eigenvectors
    
    
    quiver([0,0],[0,0],[P(1,2),P(1,1)],[P(2,2),P(2,1)],'b','LineWidth', 1)
    hold off
    %-------------------------
    %title,axes,grid
    grid
    title("WPC leza na brzegach kwadratu" )
    axis square
    xlim([-1.2,1.2]);
    ylim([-1.2,1.2]);
    %-------------------------
    disp('Press any key to continue')
    pause
    end
