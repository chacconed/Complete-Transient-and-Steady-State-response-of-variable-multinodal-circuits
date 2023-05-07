function varargout = freq_netlist(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @freq_netlist_OpeningFcn, ...
                   'gui_OutputFcn',  @freq_netlist_OutputFcn, ...
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


% --- Executes just before freq_netlist is made visible.
function freq_netlist_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = freq_netlist_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%inserttttt codee
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

netlist
% texty
freq_options;
close freq_netlist;
