function [centroid] = getCentroid(image)
%Gives the centroid of the BW image having 1 label
%Returns as: (X,Y)
    [imLabel, n] = bwlabel(image);
    stats = regionprops(imLabel, 'Centroid', 'Area');
    
    req = 1;
    for i = 1:n
        if(stats(req).Area > stats(i).Area)
            req = i;
        end
    end
    centroid = stats(req).Centroid;
end

