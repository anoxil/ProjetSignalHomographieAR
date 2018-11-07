clear all
close all


InitialisationDonnees();
PreparationH();

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
                if ( (image1_base(height,width,3) > 115) && (image1_base(height,width,2) > 115 )  ) %if pixel image base in seuil couleur non main ( NOIR si c'est la FEUILLE)
                    image1_base(height,width,1) = image1_ajout(pixel_ajout_y,pixel_ajout_x,1);
                    image1_base(height,width,2) = image1_ajout(pixel_ajout_y,pixel_ajout_x,2);
                    image1_base(height,width,3) = image1_ajout(pixel_ajout_y,pixel_ajout_x,3);
                % else c'est la main donc on ne change pas
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