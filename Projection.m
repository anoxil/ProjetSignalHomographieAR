add = H \ base;
add = fix([add(1,:)./add(3,:);add(2,:)./add(3,:)]);
index = find( ( (add(1,:)<Wadd) .* (add(1,:)>0) ) .* ( (add(2,:)<Hadd) .* (add(2,:)>0) ) );

for i = 1:length(index)
    if (add(1,index(i)) > Xadd_seuil) % si nous sommes dans le dernier quart de l'homographie (zone main)
        if ( (Ibase(Y(index(i)),X(index(i)),3) > 115) && (Ibase(Y(index(i)),X(index(i)),2) > 115 )  ) % si ce n'est pas la main
            ApplyHomography();
        end
    else % si nous sommes dans les trois premiers quarts de l'homographie (zone non main)
            ApplyHomography();
    end
end