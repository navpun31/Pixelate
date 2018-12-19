function [BWImage] = seperateBlock(arena, nodes, rgbValues, numNodes)
%Isolates the block on the node number 'node'
    [rows, cols, ~] = size(arena);
    [~, checkNodes] = size(nodes);
    blockBWImage = seperateColor(arena, rgbValues);
    [label, n] = bwlabel(blockBWImage);
    stats = regionprops(label, 'Area', 'Centroid', 'BoundingBox');
    
    location = [rows, cols];
    BWImage = zeros(rows, cols);
    for i = 1:n
        location(1,1) = stats(i).BoundingBox(1,1);
        location(1,2) = stats(i).BoundingBox(1,2);
        for j = 1:checkNodes
            if getNodeFromLocation(location, arena, numNodes) == nodes(j)
                Temp = label == i;
                BWImage = BWImage + Temp;
            end
        end
    end
end

