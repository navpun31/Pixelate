function [currNode] = getCurrNode(arena, numNodes)
%Returns the current node of the bot
    global BLUEVALUES
    global YELLOWVALUES
    
    [rows, cols, ~] = size(arena);
    location = [cols, rows];
    
    yellowBW = seperateColor(arena, YELLOWVALUES);
    [yellowLabel, nYellow] = bwlabel(yellowBW);
    statsYellow = regionprops(yellowLabel, 'Area', 'Centroid', 'BoundingBox');
    
    blueBW = seperateColor(arena, BLUEVALUES);
    [blueLabel, nBlue] = bwlabel(blueBW);
    statsBlue = regionprops(blueLabel, 'Area', 'Centroid', 'BoundingBox');
       
    for i = 1:nYellow
        if statsYellow(i).Area > ((rows*cols)/numNodes)*0.02
            if statsYellow(i).BoundingBox(1,1) < location(1,1) 
                location(1,1) = statsYellow(i).BoundingBox(1,1);
            end
            if statsYellow(i).BoundingBox(1,2) < location(1,2)
                location(1,2) = statsYellow(i).BoundingBox(1,2);
            end
        end
    end
    for i = 1:nBlue
        if statsBlue(i).Area > ((rows*cols)/numNodes)*0.02
            if statsBlue(i).BoundingBox(1,1) < location(1,1) 
                location(1,1) = statsBlue(i).BoundingBox(1,1);
            end
            if statsBlue(i).BoundingBox(1,2) < location(1,2)
                location(1,2) = statsBlue(i).BoundingBox(1,2);
            end
        end
    end
    
    currNode = getNodeFromLocation(location, arena, numNodes);
end

