function y = plotter2(index, index2)
    global vNodes;
    global vBra;
    global iBra;
    global fr;
    semilogx(1,0)
    hold on
    xlabel('frequency, [f]')
    
    switch (index2)
        case 1
            semilogx(fr, abs(vNodes(index,:)));
            ylabel('Voltage, [V]')
            hold off
        case 2
            semilogx(fr, abs(vBra(index,:)));
            ylabel('Voltage, [V]')
            hold off
        case 3
            semilogx(fr, abs(iBra(index,:)));
            ylabel('Current, [A]')
            hold off
    end
    y = 0;
end