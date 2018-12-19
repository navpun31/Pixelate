function [distance] = toCentimetres(arena, numNodes, pixelDistance)
%Converts pixelDistance to pointDistance
    [rows,~,~] = size(arena);
    numRows = sqrt(numNodes);
    
    pixelsPer30CM = rows/numRows;
    pixelsPerCM = pixelsPer30CM/30;
    distance = pixelDistance/pixelsPerCM;
end

