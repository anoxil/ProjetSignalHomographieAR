clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Définition des variables %%%

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



%%%%%%%%%%%%%%%%%%%
%%% Calcul de H %%%

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




%%%%%%%%%%%%%%%%%%%%%%
%%% Transformation %%% %dure trop longtemps (9.5 sec) -> accélérer.
for height = 0:info_base.Height
    for width = 0:info_base.Width
        a = [width;height;1];
        b = H \ a;
        pixel_ajout_x = b(1)/b(3); pixel_ajout_x = fix(pixel_ajout_x);
        pixel_ajout_y = b(2)/b(3); pixel_ajout_y = fix(pixel_ajout_y);
        if ( (pixel_ajout_x < info_ajout.Width) && (pixel_ajout_x > 0) && (pixel_ajout_y < info_ajout.Height) && (pixel_ajout_y > 0) )
            if (pixel_ajout_x > x_ajout_quart)%if pixel image ajout in last quarter
                if (false) %if pixel image base in seuil couleur non main (si c'est la feuille)
                    image1_base(height,width,1) = 0;
                    image1_base(height,width,2) = 0;
                    image1_base(height,width,3) = 0;
                else %(si c'est la main)
                    image1_base(height,width,1) = 255;
                    image1_base(height,width,2) = 255;
                    image1_base(height,width,3) = 255;
                end
            else
                image1_base(height,width,1) = image1_ajout(pixel_ajout_y,pixel_ajout_x,1);
                image1_base(height,width,2) = image1_ajout(pixel_ajout_y,pixel_ajout_x,2);
                image1_base(height,width,3) = image1_ajout(pixel_ajout_y,pixel_ajout_x,3);
            end
        end
    end
end


%%%%%%%%%%%%%%%%%%%
%%% HandRemoval %%%




%imgPetite=image1(y(1):y(2),x(1):x(2),:);
% shape = polyshape([1172 1336 1427 1227], [277 233 581 626]);
% plot(shape)
% %conversion en double pour faire les calculs, mieux qu'avec des entiers
% image1=double(image1);
% imgCrop=double(imgCrop);
% figure, hold on
% R=imgCrop(:,:,1);
% plot(R,'r')
% G=imgCrop(:,:,2);
% plot(G,'g')
% B=imgCrop(:,:,3);
% plot(B,'b')
% hold off
% %Calcul de la moyenne
% moyR=mean(R(:));
% moyG=mean(G(:));
% moyB=mean(B(:));
% moy=[moyR;moyG;moyB];
% %Calcul de la matrice de covariance
% %%Calcul des covariances
% covRR=mean(mean((R-moyR).*(R-moyR)));
% covGG=mean(mean((G-moyG).*(G-moyG)));
% covBB=mean(mean((B-moyB).*(B-moyB)));
% covRB=mean(mean((R-moyR).*(B-moyB)));
% covRG=mean(mean((R-moyR).*(G-moyG)));
% covBG=mean(mean((B-moyB).*(G-moyG)));
% %%Matrice des covariances
% matcov=[covRR,covRG,covRB;covRG,covGG,covBG;covRB,covBG,covBB];
% %Calcul de la matrice des covariances inverse
% matcovInv=inv(matcov);
% ImMaha=Mahalanobis(image1,moyR,moyG,moyB,matcovInv);
% figure,imagesc(ImMaha),colorbar
% %Seuil : Pour voir les pastilles
% newImage=ImMaha<500;





%%%%%%%%%%%%
%%% Test %%%

figure, imshow(image1_base)