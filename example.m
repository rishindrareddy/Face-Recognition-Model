% A sample script, which shows the usage of functions, included in
% PCA-based face recognition system (Eigenface method)
%
% See also: CREATEDATABASE, EIGENFACECORE, RECOGNITION

clear all
clc
close all

% You can customize and fix initial directory paths
% Path to train database here
TrainDatabasePath = uigetdir('Path to train database', 'Select training database path' ); 
%Path to test database here
TestDatabasePath = uigetdir('Path to test database here', 'Select test database path'); 

prompt = {'Enter test image label:'};
dlg_title = 'Input of PCA';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage);

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image :  ',OutputName);
disp(str)
