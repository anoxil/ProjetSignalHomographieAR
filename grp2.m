clear all
close all

% Seuillage :
% 
%  FEUILLE
%   PAS OMBRE
%       HMTL : 729fab
%       HSV  : 193 33 67
%       RGB  : 114 159 171
%       CMJN : 33 7 0 33
%   OMBRE
%       HMTL : 698a90
%       HSV  : 189 27 56
%       RGB  : 105 138 144
%       CMJN : 27 4 0 44
%
% COMBINAISON ~
%       RGB  : 100-118 135-155 140-







% 1.928 sec
% InitialisationDonnees();

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







% 0.006 sec
% PreparationH();

Hcalculator = [ajout_x1, ajout_y1, 1, 0, 0, 0, -ajout_x1*base_x1, -ajout_y1*base_x1;
                0, 0, 0, ajout_x1, ajout_y1, 1, -ajout_x1*base_y1, -ajout_y1*base_y1;
                ajout_x2, ajout_y2, 1, 0, 0, 0, -ajout_x2*base_x2, -ajout_y2*base_x2;
                0, 0, 0, ajout_x2, ajout_y2, 1, -ajout_x2*base_y2, -ajout_y2*base_y2;
                ajout_x3, ajout_y3, 1, 0, 0, 0, -ajout_x3*base_x3, -ajout_y3*base_x3;
                0, 0, 0, ajout_x3, ajout_y3, 1, -ajout_x3*base_y3, -ajout_y3*base_y3;
                ajout_x4, ajout_y4, 1, 0, 0, 0, -ajout_x4*base_x4, -ajout_y4*base_x4;
                0, 0, 0, ajout_x4, ajout_y4, 1, -ajout_x4*base_y4, -ajout_y4*base_y4];

Xbase = [base_x1; base_y1; base_x2; base_y2; base_x3; base_y3; base_x4; base_y4];

Hcolumn = Hcalculator \ Xbase;
H = [Hcolumn(1), Hcolumn(2), Hcolumn(3);
    Hcolumn(4), Hcolumn(5), Hcolumn(6);
    Hcolumn(7), Hcolumn(8), 1];









%%REMPLACEMENT

% 0.044 sec
w = 1:1920;
h = (1:1080)';
X = repmat(w,1080,1); X = X(:)';
Y = repmat(h,1,1920); Y = Y(:)';
S = ones(1,1920*1080);
coord_base = [X;Y;S];


% 0.118 sec
coord_ajout = H \ coord_base;
coord_ajout_inter = [coord_ajout(1,:)./coord_ajout(3,:);coord_ajout(2,:)./coord_ajout(3,:)];
coord_ajout_inter = fix(coord_ajout_inter);
index = find( ( (coord_ajout_inter(1,:)<info_ajout.Width) .* (coord_ajout_inter(1,:)>0) ) .* ( (coord_ajout_inter(2,:)<info_ajout.Height) .* (coord_ajout_inter(2,:)>0) ) );


% 0.072 sec
for i = 1:length(index)
    if (coord_ajout_inter(1,index(i)) > x_ajout_quart)%if pixel image ajout in last quarter
        if ( (image1_base(Y(index(i)),X(index(i)),3) > 115) && (image1_base(Y(index(i)),X(index(i)),2) > 115 )  )
            image1_base(Y(index(i)),X(index(i)),1) = image1_ajout(coord_ajout_inter(2,index(i)),coord_ajout_inter(1,index(i)),1);
            image1_base(Y(index(i)),X(index(i)),2) = image1_ajout(coord_ajout_inter(2,index(i)),coord_ajout_inter(1,index(i)),2);
            image1_base(Y(index(i)),X(index(i)),3) = image1_ajout(coord_ajout_inter(2,index(i)),coord_ajout_inter(1,index(i)),3);
        end
    else
        image1_base(Y(index(i)),X(index(i)),1) = image1_ajout(coord_ajout_inter(2,index(i)),coord_ajout_inter(1,index(i)),1);
        image1_base(Y(index(i)),X(index(i)),2) = image1_ajout(coord_ajout_inter(2,index(i)),coord_ajout_inter(1,index(i)),2);
        image1_base(Y(index(i)),X(index(i)),3) = image1_ajout(coord_ajout_inter(2,index(i)),coord_ajout_inter(1,index(i)),3);
    end
end








% 0.294 sec
figure, imshow(image1_base)