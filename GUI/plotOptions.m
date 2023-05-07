function varargout = plotOptions(varargin)
% PLOTOPTIONS MATLAB code for plotOptions.fig
%      PLOTOPTIONS, by itself, creates a new PLOTOPTIONS or raises the existing
%      singleton*.
%
%      H = PLOTOPTIONS returns the handle to a new PLOTOPTIONS or the handle to
%      the existing singleton*.
%
%      PLOTOPTIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTOPTIONS.M with the given input arguments.
%
%      PLOTOPTIONS('Property','Value',...) creates a new PLOTOPTIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plotOptions_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plotOptions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plotOptions

% Last Modified by GUIDE v2.5 15-Sep-2019 18:44:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotOptions_OpeningFcn, ...
                   'gui_OutputFcn',  @plotOptions_OutputFcn, ...
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


% --- Executes just before plotOptions is made visible.
function plotOptions_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plotOptions (see VARARGIN)

% Choose default command line output for plotOptions
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plotOptions wait for user response (see UIRESUME)
% uiwait(handles.plotOptions);


% --- Outputs from this function are returned to the command line.
function varargout = plotOptions_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index2;
index2 = 1
attributeBox;



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index2;
index2 = 3
attributeBox;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global index2;
index2 = 2
attributeBox;
