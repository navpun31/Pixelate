function [locations]= getThreeLocations(blackBWImage, n);                                                                                                                                                       t=zeros(3,1);
    struct = regionprops(blackBWImage,'area'); 
    locations = zeros(3,1);
    
    for j=1:3
        k=1;
        z = struct(1).Area;
        for i=1:n
            if struct(i).Area > z
            z = struct(i).Area;
            k = i;
            end
        end
        locations(j)=k;
        struct(k).Area = 0;
    end
end

  