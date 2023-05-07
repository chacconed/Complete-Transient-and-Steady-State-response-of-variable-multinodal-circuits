function varargout = freq_options(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @freq_options_OpeningFcn, ...
                   'gui_OutputFcn',  @freq_options_OutputFcn, ...
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


% --- Executes just before freq_options is made visible.
function freq_options_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes freq_options wait for user response (see UIRESUME)
% uiwait(handles.freq_options);


% --- Outputs from this function are returned to the command line.
function varargout = freq_options_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
%button starting freq;
global startFreq;
x = get(handles.edit1,'String'); 
if isempty(x)
fprintf('Error: Enter Text first\n');
else
  startFreq = str2double(x);
  startFreq

end




% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
%button end frequency
global endFreq;
x = get(handles.edit2,'String'); 
if isempty(x)
fprintf('Error: Enter Text first\n');
else
  endFreq = str2double(x);
  endFreq
end




% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
global pointsPer;
x = get(handles.edit3,'String'); 
if isempty(x)
fprintf('Error: Enter Text first\n');
else
  pointsPer = str2double(x);
  pointsPer
end



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%freq codes
global netlist;

global startFreq; 
global endFreq;
global pointsPer;



global vNodes;
global vBra;
global iBra;
global fr;

[vNodes, vBra,iBra, fr] = phasorMain(netlist, startFreq, endFreq, pointsPer);

gavotteGUI;
close freq_options;
