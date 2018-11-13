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
%%% Transformation %%% %dure trop longtemps (9.5 sec) -> acc�l�rer.
% for height = 0:info_base.Height
%     for width = 0:info_base.Width
%         a = [width;height;1];
%         b = H \ a;
%         pixel_ajout_x = b(1)/b(3); pixel_ajout_x = fix(pixel_ajout_x);
%         pixel_ajout_y = b(2)/b(3); pixel_ajout_y = fix(pixel_ajout_y);
%         if ( (pixel_ajout_x < info_ajout.Width) && (pixel_ajout_x > 0) && (pixel_ajout_y < info_ajout.Height) && (pixel_ajout_y > 0) )
%             if (pixel_ajout_x > x_ajout_quart)%if pixel image ajout in last quarter
%                 if ( (image1_base(height,width,3) > 115) && (image1_base(height,width,2) > 115 )  ) %if pixel image base in seuil couleur non main ( NOIR si c'est la FEUILLE)
%                     image1_base(height,width,1) = image1_ajout(pixel_ajout_y,pixel_ajout_x,1);
%                     image1_base(height,width,2) = image1_ajout(pixel_ajout_y,pixel_ajout_x,2);
%                     image1_base(height,width,3) = image1_ajout(pixel_ajout_y,pixel_ajout_x,3);
%                 % else c'est la main donc on ne change pas
%                 end
%             else
%                 image1_base(height,width,1) = image1_ajout(pixel_ajout_y,pixel_ajout_x,1);
%                 image1_base(height,width,2) = image1_ajout(pixel_ajout_y,pixel_ajout_x,2);
%                 image1_base(height,width,3) = image1_ajout(pixel_ajout_y,pixel_ajout_x,3);
%             end
%         end
%     end
% end

w = 1:1920;
h = (1:1080)';
X = repmat(w,1080,1); X = X(:)';
Y = repmat(h,1,1920); Y = Y(:)';
S = ones(1,1920*1080);
coord_base = [X;Y;S];


coord_ajout = H \ coord_base;
coord_ajout_inter = [coord_ajout(1,:)./coord_ajout(3,:);coord_ajout(2,:)./coord_ajout(3,:)];
coord_ajout_inter = fix(coord_ajout_inter);
index = find( ( (coord_ajout_inter(1,:)<info_ajout.Width) .* (coord_ajout_inter(1,:)>0) ) .* ( (coord_ajout_inter(2,:)<info_ajout.Height) .* (coord_ajout_inter(2,:)>0) ) );

for i = 1:length(index)
   image1_base(Y(index(i)),X(index(i)),1) = image1_ajout(coord_ajout_inter(1,index(i)),coord_ajout_inter(2,index(i)),1);
   image1_base(Y(index(i)),X(index(i)),2) = image1_ajout(coord_ajout_inter(1,index(i)),coord_ajout_inter(2,index(i)),2);
   image1_base(Y(index(i)),X(index(i)),3) = image1_ajout(coord_ajout_inter(1,index(i)),coord_ajout_inter(2,index(i)),3);
end




% test = 1;
% 
% for width = 1:info_base.Width
%     for height = 1:info_base.Height
%         pixel_ajout_x = coord_ajout(1,1+((width-1)*info_base.Height)); %(1,(height+((info_base.Height*(height-1)))));
%         pixel_ajout_y = coord_ajout(2,(height+(width-1)*info_base.Height));
%         if ( (pixel_ajout_x < info_ajout.Width) && (pixel_ajout_x > 0) && (pixel_ajout_y < info_ajout.Height) && (pixel_ajout_y > 0) )
%             test = 2;
%             image1_base(height,width,1) = image1_ajout(pixel_ajout_y,pixel_ajout_x,1);
%         end
%     end
% end

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

% figure, imshow(image1_base)