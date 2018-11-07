vidbase=VideoReader('videobase.mp4'); %lecture de la vidéo
vidajout=VideoReader('videoajout.mp4'); %lecture de la vidéo
image1_base=read(vidbase,37);
image1_ajout=read(vidajout,500);

info_base=get(vidbase);
% base_x1 = x(1);
% base_y1 = y(1);
% base_x2 = x(2);
% base_y2 = y(2);
% base_x3 = x(3);
% base_y3 = y(3);
% base_x4 = x(4);
% base_y4 = y(4);

base_x1 = 683.7500;
base_y1 = 412.2500;
base_x2 = fix(1.3363e+03);
base_y2 = fix(233.7500);
base_x3 = 629.7500;
base_y3 = 764.7500;
base_x4 = fix(1.4278e+03);
base_y4 = fix(581.7500);

info_ajout=get(vidajout);
ajout_x1 = 0;
ajout_y1 = 0;
ajout_x2 = info_ajout.Width;
ajout_y2 = 0;
ajout_x3 = 0;
ajout_y3 = info_ajout.Height;
ajout_x4 = info_ajout.Width;
ajout_y4 = info_ajout.Height;

% ajout_x1 = 0;
% ajout_y1 = 0;
% ajout_x2 = 1920;
% ajout_y2 = 0;
% ajout_x3 = 0;
% ajout_y3 = 1080;
% ajout_x4 = 1920;
% ajout_y4 = 1080;

x_ajout_quart = fix(ajout_x2 - ((ajout_x2 - ajout_x1)/4));