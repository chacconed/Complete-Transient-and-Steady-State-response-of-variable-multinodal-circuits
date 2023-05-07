[fN, filePath] = uigetfile(fullfile(pwd,'*.xls;*.xlsx'),...
    'Select xls or xlsx File','MultiSelect','off'); % user input file with .xls or .xlsx as default
% multiselect off enables single file selection. To select multiple files use the multiselect preoperty value as "on"
% fN is the file Name and filePath is the address of the file
fileName = [filePath, fN]; %Prepare the full file name, with the address. This would enable the selection of file that is not in the working directory

[num, txt] = xlsread(fileName); % Read the excel file, store the number to num and text to txt.


num 
txt