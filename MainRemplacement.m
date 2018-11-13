clear all
close all

load('a.mat', 'C')
Vbase=VideoReader('videobase.mp4'); %lecture de la vidéo
Vadd=VideoReader('videoajout.mp4'); %lecture de la vidéo


for Iindex = 1:(length(C)/2)
    % 1.928 sec
    Initialization();

    % 0.006 sec
    PreparationH();

    % 0.250 sec
    Projection();

    % 0.294 sec
    figure, imshow(Ibase)
end

