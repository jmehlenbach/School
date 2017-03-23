function varargout = Elec200assignment8(varargin)
% ELEC200ASSIGNMENT8 MATLAB code for Elec200assignment8.fig
%      ELEC200ASSIGNMENT8, by itself, creates a new ELEC200ASSIGNMENT8 or raises the existing
%      singleton*.
%
%      H = ELEC200ASSIGNMENT8 returns the handle to a new ELEC200ASSIGNMENT8 or the handle to
%      the existing singleton*.
%
%      ELEC200ASSIGNMENT8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELEC200ASSIGNMENT8.M with the given input arguments.
%
%      ELEC200ASSIGNMENT8('Property','Value',...) creates a new ELEC200ASSIGNMENT8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Elec200assignment8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Elec200assignment8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Elec200assignment8

% Last Modified by GUIDE v2.5 06-Dec-2013 11:22:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Elec200assignment8_OpeningFcn, ...
                   'gui_OutputFcn',  @Elec200assignment8_OutputFcn, ...
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


% --- Executes just before Elec200assignment8 is made visible.
function Elec200assignment8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Elec200assignment8 (see VARARGIN)

% Choose default command line output for Elec200assignment8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

xlim([0,40]);
ylim([0,40]);
zlim([-5,5]);
hold on;



global t;
global data;
handles.t = t;
handles.data = data;

t = 0:1/20*pi;2*pi;
data = cos(t)*sin(t);
[x,y]= meshgrid(-8:0.5:8);
handles.data = data;
handles.current_data = handles.data;
meshgrid(handles.current_data);
plot(handles.current_data);
drawnow;

%h = surf(2*peaks(data));

%set(h);






%Matrix = makehgtform('xrotation', 15)








% UIWAIT makes Elec200assignment8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Elec200assignment8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in surfbutton.
function surfbutton_Callback(hObject, eventdata, handles)
% hObject    handle to surfbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
surf(handles.current_data);


% --- Executes on button press in meshbutton.
function meshbutton_Callback(hObject, eventdata, handles)
% hObject    handle to meshbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mesh(handles.current_data);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
