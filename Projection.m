% 0.044 sec
w = 1:1920;
h = (1:1080)';
X = repmat(w,1080,1); X = X(:)';
Y = repmat(h,1,1920); Y = Y(:)';
S = ones(1,1920*1080);
base = [X;Y;S];


% 0.118 sec
add = H \ base;
add = fix([add(1,:)./add(3,:);add(2,:)./add(3,:)]);
index = find( ( (add(1,:)<Wadd) .* (add(1,:)>0) ) .* ( (add(2,:)<Hadd) .* (add(2,:)>0) ) );


% 0.072 sec
for i = 1:length(index)
    if (add(1,index(i)) > Xadd_seuil) % if pixel image add in the last quarter
        if ( (Ibase(Y(index(i)),X(index(i)),3) > 115) && (Ibase(Y(index(i)),X(index(i)),2) > 115 )  ) % && if it's not the hand
            ApplyHomography();
        end
    else % if pixel image add in the first three quarters
            ApplyHomography();
    end
end


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