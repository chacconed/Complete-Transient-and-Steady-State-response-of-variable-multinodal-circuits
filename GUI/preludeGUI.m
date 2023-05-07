function varargout = preludeGUI(varargin)




% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @preludeGUI_OpeningFcn, ...
    'gui_OutputFcn',  @preludeGUI_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before preludeGUI is made visible.
function preludeGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.

% imageLogo = imread('power123.jpg');
% j = imresize(imageLogo,1.25);
% [height, width, ~] = size(j);
% ha = axes('Units','normalized','position',[0.27 0.5 0.4 1*height/width],'box','off');
% imshow(j,'parent',ha);

% Choose default command line output for preludeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = preludeGUI_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)

[fN, filePath] = uigetfile(fullfile(pwd,'*.xls;*.xlsx'),...
    'Select xls or xlsx File','MultiSelect','off'); % user input file with .xls or .xlsx as default
% multiselect off enables single file selection. To select multiple files use the multiselect preoperty value as "on"
% fN is the file Name and filePath is the address of the file
fileName = [filePath, fN]; %Prepare the full file name, with the address. This would enable the selection of file that is not in the working directory

[num, txt] = xlsread(fileName); % Read the excel file, store the number to num and text to txt.

% [num,txt]= xlsread('test.xlsx');
global netlist
global texty

netlist = num;
% texty = txt;

disp('txt');
netlist
% texty
transient_options;
close preludeGUI;
