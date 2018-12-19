function [site, blueprint, indicator] = getBoundingBoxes(arena)
%Gives the bounding boxxes the indicator, blueprint and site
    global BLACKVALUES
    
    blackBWImage = seperateColor(arena, BLACKVALUES);
   
    blackBWImage =~ blackBWImage;
    blackBWImage = bwmorph(blackBWImage,'dilate',10);
    blackBWImage = bwmorph(blackBWImage,'erode',10);
    
    [blackBWLabel, n] = bwlabel(blackBWImage);
    struct = regionprops(blackBWLabel,'boundingbox');
    
    locations = getThreeLocations(blackBWLabel, n);
    
    site = struct(locations(1)).BoundingBox;
    blueprint = struct(locations(2)).BoundingBox;
    indicator = struct(locations(3)).BoundingBox;
end

