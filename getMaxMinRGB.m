function [values] = getMaxMinRGB(arena)
%Gives the max and min RGB values for the given colour
    colorRequired = imcrop(arena);
    
    %Finding RGB-max and min respectively
    rmax = max(max(colorRequired(:,:,1))) + 50;
    rmin = min(min(colorRequired(:,:,1))) - 50;
    
    gmax = max(max(colorRequired(:,:,2))) + 50;
    gmin = min(min(colorRequired(:,:,2))) - 50;
    
    bmax = max(max(colorRequired(:,:,3))) + 50;
    bmin = min(min(colorRequired(:,:,3))) - 50;
    
    values = [rmax, rmin, gmax, gmin, bmax, bmin];
end

