function [bwImage] = seperateColor(arena, rgbValues)
%Seperates the specified color(as cropped from image 'arena')
    [rows, cols, ~] = size(arena);

    rmax = rgbValues(1,1);
    rmin = rgbValues(1,2);
    gmax = rgbValues(1,3);
    gmin = rgbValues(1,4);
    bmax = rgbValues(1,5);
    bmin = rgbValues(1,6);

    %Generating the black and white image for the specified color
    bwImage = (arena(:,:,1) <= rmax & arena(:,:,1) >= rmin) & (arena(:,:,2) <= gmax & arena(:,:,2) >= gmin) & (arena(:,:,3) <= bmax & arena(:,:,3) >= bmin);
    
    %Removing Noise
    sc = strel('square', 13);
    bwImage = imerode(bwImage, sc);
    bwImage = imdilate(bwImage, sc);
%     bwImage = bwmorph(bwImage,'erode', 5);
%     bwImage = bwmorph(bwImage,'dilate', 5);
% 
%     bwImage = bwmorph(bwImage,'thin', 3); 
%     bwImage = bwmorph(bwImage,'thick', 3);

    %Labelling
    %[Label, num] = bwlabel(bwImage);
    %imtool(Label);
end