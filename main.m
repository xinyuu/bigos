%%% Rhino framework

%% Reading the data

% read all files from the training directory

% if your matlab is not in the project directory you will need to
% cd 'project/dir'
training = dir('rhino/train')
% now we need to know the data format.

%% Feature extraction
I1 = imread('16_left.jpeg');
I2 = imread('17_left.jpeg');

[ca1, eh1, ev1, ed1] = waveletanderode(I1);
figure, imshow(eh1);
imwrite(eh1,'16_left_h.jpeg', 'JPG');
figure, imshow(ev1);
imwrite(ev1,'16_left_v.jpeg', 'JPG');
figure, imshow(ed1);
imwrite(ed1,'16_left_d.jpeg', 'JPG');

[ca2, eh2, ev2, ed2] = waveletanderode(I2);
figure, imshow(eh2);
imwrite(eh2,'17_left_h.jpeg', 'JPG');
figure, imshow(ev2);
imwrite(ev2,'17_left_v.jpeg', 'JPG');
figure, imshow(ed2);
imwrite(ed2,'17_left_d.jpeg', 'JPG');
% the main work goes here.



%% Cross validated training on the extracted features
indices = crossvalind('Kfold', length(extracted), 10)

%% Testing our model on the test data

testing = dir('rhino/test')



s
