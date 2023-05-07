function varargout = opening_test(varargin)
% OPENING_TEST MATLAB code for opening_test.fig
%      OPENING_TEST, by itself, creates a new OPENING_TEST or raises the existing
%      singleton*.
%
%      H = OPENING_TEST returns the handle to a new OPENING_TEST or the handle to
%      the existing singleton*.
%
%      OPENING_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPENING_TEST.M with the given input arguments.
%
%      OPENING_TEST('Property','Value',...) creates a new OPENING_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before opening_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to opening_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help opening_test

% Last Modified by GUIDE v2.5 15-Sep-2019 13:09:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @opening_test_OpeningFcn, ...
                   'gui_OutputFcn',  @opening_test_OutputFcn, ...
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


% --- Executes just before opening_test is made visible.
function opening_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to opening_test (see VARARGIN)

% Choose default command line output for opening_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes opening_test wait for user response (see UIRESUME)
% uiwait(handles.opening_test);


% --- Outputs from this function are returned to the command line.
function varargout = opening_test_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA)\
x = 1:0.1:3;
y = sin(x);
plot(x,y);

