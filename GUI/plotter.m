function y = plotter(index, index2)
    global vNodes;
    global vBra;
    global iBra;
    global tx;
    plot(0,0)
    hold on
    xlabel('time, [sec]')

    
    switch (index2)
        case 1
            plot(tx, vNodes(index,:));
            ylabel('Voltage, [V]')
            hold off
        case 2
            plot(tx, vBra(index,:));
            ylabel('Voltage, [V]')
            hold off
        case 3
            plot(tx, iBra(index,:));
            ylabel('Current, [V]')
            hold off
    end
    y = 0;
end