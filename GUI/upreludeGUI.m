function varargout = upreludeGUI(varargin)


% PRELUDEGUI MATLAB code for preludeGUI.fig
%      PRELUDEGUI, by itself, creates a new PRELUDEGUI or raises the existing
%      singleton*.
%
%      H = PRELUDEGUI returns the handle to a new PRELUDEGUI or the handle to
%      the existing singleton*.
%
%      PRELUDEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRELUDEGUI.M with the given input arguments.
%
%      PRELUDEGUI('Property','Value',...) creates a new PRELUDEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before preludeGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to preludeGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help preludeGUI

% Last Modified by GUIDE v2.5 12-Sep-2019 01:43:38

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
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to preludeGUI (see VARARGIN)
imageLogo = imread('power123.jpg');
j = imresize(imageLogo,1.25);
[height, width, ~] = size(j);
ha = axes('Units','normalized','position',[0.27 0.5 0.4 1*height/width],'box','off');
imshow(j,'parent',ha);

% Choose default command line output for preludeGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes preludeGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = preludeGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[fN, filePath] = uigetfile(fullfile(pwd,'*.xls;*.xlsx'),...
    'Select xls or xlsx File','MultiSelect','off'); % user input file with .xls or .xlsx as default
% multiselect off enables single file selection. To select multiple files use the multiselect preoperty value as "on"
% fN is the file Name and filePath is the address of the file
fileName = [filePath, fN]; %Prepare the full file name, with the address. This would enable the selection of file that is not in the working directory

h = xlsread(fileName); % Read the excel file, store the number to num and text to txt.

% [num,txt]= xlsread('test.xlsx');
global netlist
global texty

netlist = num;
texty = txt;

disp('txt');
h
close all;
prelude_two;


