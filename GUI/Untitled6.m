% removing ticks and everything else
% for x
set(gca,'XTickLabel',[])
set(gca,'XTick',[])
set(gca,'xcolor','w') 
% for y
set(gca,'YTickLabel',[])
set(gca,'YTick',[])
set(gca,'ycolor','w') 
% for z
set(gca,'ZTickLabel',[])
set(gca,'ZTick',[])
set(gca,'zcolor','w')

y = 1:5;
x = 1:5;
plot(y,x);