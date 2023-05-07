function varargout = attributeBox(varargin)
% ATTRIBUTEBOX MATLAB code for attributeBox.fig
%      ATTRIBUTEBOX, by itself, creates a new ATTRIBUTEBOX or raises the existing
%      singleton*.
%
%      H = ATTRIBUTEBOX returns the handle to a new ATTRIBUTEBOX or the handle to
%      the existing singleton*.
%
%      ATTRIBUTEBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATTRIBUTEBOX.M with the given input arguments.
%
%      ATTRIBUTEBOX('Property','Value',...) creates a new ATTRIBUTEBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before attributeBox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to attributeBox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help attributeBox

% Last Modified by GUIDE v2.5 15-Sep-2019 18:49:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @attributeBox_OpeningFcn, ...
                   'gui_OutputFcn',  @attributeBox_OutputFcn, ...
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


% --- Executes just before attributeBox is made visible.
function attributeBox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to attributeBox (see VARARGIN)

% Choose default command line output for attributeBox
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes attributeBox wait for user response (see UIRESUME)
% uiwait(handles.attributeBox);


% --- Outputs from this function are returned to the command line.
function varargout = attributeBox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit2_Callback(hObject, eventdata, handles)
global index
x = get(handles.edit2,'String'); %edit1 being Tag of ur edit box
if isempty(x)
fprintf('Error: Enter Text first\n');
else
  index = str2double(x)
% Write code for computation you want to do
end
close attributeBox;
close plotOptions;



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
