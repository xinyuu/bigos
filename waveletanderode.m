function [ ca, eroded_ch, eroded_cv, eroded_cd ] = waveletanderode( I )
%WAVELETANDERODE Summary of this function goes here
%   Detailed explanation goes here
    I = rgb2gray(I);
    [ca, ch, cv, cd] = dwt2(I, 'db1');
    
    eroded_ch = imerode(ch, strel('disk', 1));
    eroded_cv = imerode(cv, strel('disk', 1));
    eroded_cd = imerode(cd, strel('disk' ,1));

end
