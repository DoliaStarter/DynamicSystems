    tiledlayout(1,1);
    WPCval = linspace(0,2*pi,10);
    ax1 = nexttile;
    for i = 1:length(WPCval)
        res = sim('Lab2');
        plot(res.x(:,1), res.x(:,2),'LineWidth', 2)        
        hold on 
        WPC(1) = sin(WPCval(i));
        WPC(2) = cos(WPCval(i));
    end
    
    quiver([0,0],[0,0],[P(1,2),P(1,1)],[P(2,2),P(2,1)],'k','LineWidth', 3)    
    hold on
    hold off 
    
    grid
    title("WPC form borders of circle")
    axis square
    disp("Press any key ....")
    pause;
    clf
    for i = 1:length(WPCval)
        WPC(1) = sin(WPCval(i));
        WPC(2) = cos(WPCval(i));
        p = max(abs(WPC(1)),abs(WPC(2)));
        WPC = WPC/p;
        res = sim('Lab2');
        plot(res.x(:,1), res.x(:,2),'LineWidth', 2)
        hold on
    end
    quiver([0,0],[0,0],[P(1,2),P(1,1)],[P(2,2),P(2,1)],'k','LineWidth', 3)   
    hold off
    grid
    title("WPC from borders of square")
    axis square