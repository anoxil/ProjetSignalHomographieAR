clear all
close all

load('a.mat', 'C') %recuperation des points du binome 1 dans la variable C
Vbase = VideoReader('videobase.mp4'); %lecture de la vidéo
Vadd = VideoReader('videoajout.mp4'); %lecture de la vidéo
Vwriter = VideoWriter('resultat.mp4','MPEG-4'); Vwriter.FrameRate = 24; open(Vwriter); %ecriture de la video

for Iindex = 1:(length(C)/2)
    
    Initialization();

    PreparationH();

    Projection();

    writeVideo(Vwriter,Ibase);
    
end
close(Vwriter);