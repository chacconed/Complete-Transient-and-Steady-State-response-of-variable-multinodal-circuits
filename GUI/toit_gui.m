function toit_gui()

fh = figure('Visible','off');
bgColor = [0.9 0.9 0.9];

set(fh,'Name',       'Transients!',...
    'NumberTitle', 'off',...
    'KeyPressFcn', @keyPress,...
    'color',       bgColor,...
    'Units',       'inches',...
    'Menubar',     'none',...
    'Position',    [0,0,7.5,7]);
movegui(fh,'center');

% Draw logo
imageLogo = imread('log.jpg');
j = imresize(imageLogo,2.25);
[height, width, ~] = size(j);
ha = axes('Units','inches','position',[2 4.8 3.5 3.5*height/width],'box','off');
imshow(j,'parent',ha);

% Draw Components
drawComponent();

% Draw bottom image
imagebottom = imread('power_adjust.jpg');
k = imresize(imagebottom,2);
[height, width, ~] = size(k);
hb = axes('Units','inches','position',[1.4 0.25 5.0 8.0*height/width],'box','off');
imshow('power_adjust.jpg');
set(fh,'Visible','on', 'Units','normalized');








%% construct push buttons
    function drawComponent()
        datahan.hinsert = uicontrol('Style','pushbutton','String','insert you netlist',...
            'Units','inches','Position',[2.0 3.7 3.5 0.7],'fontName','Arial','fontsize',24,...
            'Callback',{@pushbutton1_Callback});
        
        uicontrol('Style','pushbutton','String','Exit',...
            'Units','Normalized','Position',[0.82 3 0.14 0.1],...
            'fontname','arial','fontsize',20,...
            'Enable', 'On','Callback',{@push_button_Callback_exit});
    end




%%call backs

function pushbutton1_Callback(hObject, eventdata, handles)
 y = x + 1;
if isequal(filename,0) || isequal(pathname,0)
    return
end
fileID = fopen(fullfile(pathname, filename));
temp = fscanf(fileID,'%d',[8 Inf]);
handles.fileData = temp';
guidata(hObject, handles);
% --- Executes on button press in checkbox1.
end

function push_button_Callback_exit(~,~)
close all;
end


end