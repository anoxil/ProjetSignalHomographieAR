clear all
close all

%441 secondes --> 7min. 21s.
load('a.mat', 'C')
Vbase = VideoReader('videobase.mp4'); %lecture de la vidéo
Vadd = VideoReader('videoajout.mp4'); %lecture de la vidéo
Vwriter = VideoWriter('resultat.mp4','MPEG-4'); Vwriter.FrameRate = 24; open(Vwriter); %ecriture de la video

% 2 secondes par image
for Iindex = 1:(length(C)/2)
    
    Initialization();

    PreparationH();

    Projection();

    writeVideo(Vwriter,Ibase);
    
end
close(Vwriter);
toc