%%% Rhino framework

%% Reading the data

% read all files from the training directory

% if your matlab is not in the project directory you will need to
% cd 'project/dir'
training = dir('rhino/train');

labels = readtable('rhino/trainLabels.csv');
level = cell(5,1);
for i = 0:4
    level{i+1} = labels(labels.level == i,:);
    % strcat filenames with.jpeg
end

for i = 1:4
    for j = 1:5
        [f] = level{i}{j,1}{1};
        fin = sprintf('rhino/train/%s.jpeg', f);
        fout = sprintf('rhino/trainfeat/%s_wv_%d.jpeg', f,i);
        I = imread(fin);
        [ca1, eh1, ev1, ed1] = waveletanderode(I);
        imwrite(eh1,fout, 'JPG');
    end
end
 
% now we need to know the data format.

%% Feature extraction

do 20 sample images
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

% so let's get 20 values. 



%% Cross validated training on the extracted features
indices = crossvalind('Kfold', length(extracted), 10)

%% Testing our model on the test data

testing = dir('rhino/test')



s
