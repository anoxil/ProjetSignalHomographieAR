Vbase=VideoReader('videobase.mp4'); %lecture de la vidéo
Vadd=VideoReader('videoajout.mp4'); %lecture de la vidéo
Ibase=read(Vbase,37);
Iadd=read(Vadd,500);


% X1base = x(1);
% Y1base = y(1);
% X2base = x(2);
% Y2base = y(2);
% X3base = x(3);
% Y3base = y(3);
% X4base = x(4);
% Y4base = y(4);

X1base = 683.7500;
Y1base = 412.2500;
X2base = fix(1.3363e+03);
Y2base = fix(233.7500);
X3base = 629.7500;
Y3base = 764.7500;
X4base = fix(1.4278e+03);
Y4base = fix(581.7500);

data_Vadd=get(Vadd);
Wadd = data_Vadd.Width;
Hadd = data_Vadd.Height;
X1add = 0;
Y1add = 0;
X2add = Wadd;
Y2add = 0;
X3add = 0;
Y3add = Hadd;
X4add = Wadd;
Y4add = Hadd;

% X1add = 0;
% Y1add = 0;
% X2add = 1920;
% Y2add = 0;
% X3add = 0;
% Y3add = 1080;
% X4add = 1920;
% Y4add = 1080;

Xadd_seuil = fix(X2add - ((X2add - X1add)/4));