function main_ToxVAT()
x = 1;
fh = figure('Visible','off');
bgColor = [0.98 0.98 0.98];

set(fh,'Name',       'ToxVAT v0.1',...
    'NumberTitle', 'off',...
    'KeyPressFcn', @keyPress,...
    'color',       bgColor,...
    'Units',       'inches',...
    'Menubar',     'none',...
    'Position',    [0,0,7.5,7]);
movegui(fh,'center');

% Draw logo
imageLogo = imread('logo_vJune_2017.jpeg');
j = imresize(imageLogo,0.75);
[height, width, ~] = size(j);
ha = axes('Units','inches','position',[2 4.8 3.5 3.5*height/width],'box','off');
imshow(j,'parent',ha);

% Draw Components
drawComponent();

% Draw groupBanner
imageBanner = imread('Group_logo.gif');
%j = imresize(imageBanner,0.75);
[height, width, ~] = size(imageBanner);
hb = axes('Units','inches','position',[1 0.25 5.0 5.0*height/width],'box','off');
imshow('Group_logo.gif');
set(fh,'Visible','on', 'Units','normalized');

%% construct components
function drawComponent()
dtaHndles.hYeastAssay = uicontrol('Style','pushbutton','String','Visualize Yeast Assay',...
    'Units','inches','Position',[2.0 3.7 3.5 0.7],'fontName','Arial','fontsize',24,...
    'Callback',{@push_button_Callback_YeastAssay});
%dtaHndles.hEcoliAssay   = uicontrol('Style','pushbutton','String','Visualize E. coli Assay',...
%    'Units','inches','Position',[2.0 2.7 3.5 0.7],'fontName','Arial','fontsize',24,...
%    'Enable', 'Off','Callback',{@push_button_Callback_EcoliAssay});
dtaHndles.hAnalysis   = uicontrol('Style','pushbutton','String','Analysis Tool',...
    'Units','inches','Position',[2.0 1.7 3.5 0.7],'fontName','Arial','fontsize',24,...
    'Callback',{@push_button_Callback_AnalysisTool});

uicontrol('Style','pushbutton','String','Exit',...
            'Units','Normalized','Position',[0.82 0.03 0.15 0.08],...
            'fontname','arial','fontsize',20,...
            'Enable', 'On','Callback',{@push_button_Callback_exit});
end
%% Callback functions
    function push_button_Callback_YeastAssay(~, ~)
        addpath (genpath('yeastAssayVisualizationToolbox/'));
         v_1_1_main_yeastAssay_GUI();
    end

    function push_button_Callback_AnalysisTool(~, ~)
        addpath (genpath('analysisTools/'));
        analysisComponents();
    end
    function push_button_Callback_exit(~,~)
        close all;
    end
%% All the o
end