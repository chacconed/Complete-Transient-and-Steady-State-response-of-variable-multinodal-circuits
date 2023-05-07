function varargout = transient_options(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transient_options_OpeningFcn, ...
                   'gui_OutputFcn',  @transient_options_OutputFcn, ...
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


% --- Executes just before transient_options is made visible.
function transient_options_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transient_options wait for user response (see UIRESUME)
% uiwait(handles.transient_options);


% --- Outputs from this function are returned to the command line.
function varargout = transient_options_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

global printStep
x = get(handles.edit1,'String'); %edit1 being Tag of ur edit box
if isempty(x)
fprintf('Error: Enter Text first\n');
else
  printStep = str2double(x)
  printStep
% Write code for computation you want to do
end




% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

global timeDelay
z = get(handles.edit2,'String'); %edit1 being Tag of ur edit box
if isempty(z)
fprintf('Error: Enter Text first\n');
else
  timeDelay = str2double(z);
  timeDelay
% Write code for computation you want to do
end




% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

global totalTime
y = get(handles.edit3,'String'); %edit1 being Tag of ur edit box
if isempty(y)
fprintf('Error: Enter Text first\n');
else
  totalTime = str2double(y);
  totalTime
% Write code for computation you want to do
end





% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

global netlist;
global totalTime;
global printStep;
global timeDelay;
global vNodes;
global vBra;
global iBra;
global tx;
global paper;

[vNodes, vBra, iBra, tx] = transientMain(netlist, printStep, totalTime, timeDelay);
close transient_options;
gavotteGUI;
