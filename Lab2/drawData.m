    
    tiledlayout(1,1);
    clf
    WPCval = linspace(0,2*pi,4);
    ax1 = nexttile;
    for i = 1:length(WPCval)
        res = sim('Lab2');
        plot(res.x(:,1), res.x(:,2),'LineWidth', 1)        
        % direction 
        hold on
        p1 = [res.x(i,1) res.x(i,2)];
        p2 = [res.x(i+20,1) res.x(i+20,2)];
        dp = p2 - p1
        quiver(p1(1),p1(2)+p1(2) * 0.2 * dp(2),dp(1),dp(2),'k')
       %-------------------------
        hold on 
        WPC(1) = sin(WPCval(i));
        WPC(2) = cos(WPCval(i));
    end
    % eigenvectors 
    quiver([0,0],[0,0],[P(1,2),P(1,1)],[P(2,2),P(2,1)],'b','LineWidth', 1)    
    hold off 
    %-------------------------
    %title,axes,grid
    grid
    title("WPC form borders of circle")
    axis square
    
    %---------------
    disp("Press any key ....")
    pause;
    clf
    
    % new figure 
    
    for i = 1:length(WPCval)
        WPC(1) = sin(WPCval(i));
        WPC(2) = cos(WPCval(i));
        p = max(abs(WPC(1)),abs(WPC(2)));
        WPC = WPC/p;
        res = sim('Lab2');
        plot(res.x(:,1), res.x(:,2),'LineWidth', 1)
        hold on
        % direction 
        p1 = [res.x(i,1) res.x(i,2)];
        p2 = [res.x(i+20,1)  res.x(i+20,2)];
        dp = p2 - p1;
        quiver(p1(1) ,p1(2)+p1(2) * 0.2 * dp(2) ,dp(1),dp(2),'k')
        %-------------------------
        hold on
    end
    % eigenvectors
    quiver([0,0],[0,0],[P(1,2),P(1,1)],[P(2,2),P(2,1)],'b','LineWidth', 1)
    hold off
    %-------------------------
    %title,axes,grid
    grid
    title("WPC from borders of square")
    axis square
    %-------------------------
    disp('Press any key to continue')
    pause
    
