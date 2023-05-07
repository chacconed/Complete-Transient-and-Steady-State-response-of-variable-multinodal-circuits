 function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt'},'Open Directory');
if isequal(filename,0) || isequal(pathname,0)
    return
end
fileID = fopen(fullfile(pathname, filename));
temp = fscanf(fileID,'%d',[8 Inf]);
handles.fileData = temp';
guidata(hObject, handles);
 % --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle sta te of checkbox1
 handles.fileData
 x=handles.fileData
 xa = x(:,3)
 plot(xa)