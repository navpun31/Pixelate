function [indicatorColor, indicatorNode] = getIndicator(arena, numNodes)
%Gives the color of the indicator
    [rows, cols, ~] = size(arena);
    global RED
    global GREEN
    global BLACK
    global REDVALUES
    global GREENVALUES
    
    global INDICATORBB
    
    if(numNodes == 25)
        redBW = seperateColor(arena, REDVALUES);
        [redLabel, nRed] = bwlabel(redBW);
        statsRed = regionprops(redLabel, 'Area', 'Centroid', 'BoundingBox');

        greenBW = seperateColor(arena, GREENVALUES);
        [greenLabel, nGreen] = bwlabel(greenBW);
        statsGreen = regionprops(greenLabel, 'Area', 'Centroid', 'BoundingBox');

        indicatorColor = BLACK;
        location = [cols, rows];

        for i = 1:nRed
            if statsRed(i).Area > ((rows*cols)/numNodes)*0.5 %if area of the label > 0.7 times area of one node -- 0.7 is multiplied incase the area of label becomes sligtly smaller than area of 1 node
                location(1,1) = statsRed(i).BoundingBox(1,1);
                location(1,2) = statsRed(i).BoundingBox(1,2);
                indicatorColor = RED;
            end
        end
        for i = 1:nGreen
            if statsGreen(i).Area > ((rows*cols)/numNodes)*0.5 %if area of the label > 0.7 times area of one node -- 0.7 is multiplied incase the area of label becomes sligtly smaller than area of 1 node
                location(1,1) = statsGreen(i).BoundingBox(1,1);
                location(1,2) = statsGreen(i).BoundingBox(1,2);
                indicatorColor = GREEN;
            end
        end

    %     if indicator ~= BLACK
    %         indicatorImage = imcrop(arena, [location(1,1) location(1,2) rows*1/sqrt(numNodes) cols*1/sqrt(numNodes)]); 
    %         imtool(indicatorImage);
    %     end
        indicatorNode = getNodeFromLocation(location, arena, numNodes);
    end
    
    if(numNodes == 64)        
        indicatorImage = imcrop(arena, INDICATORBB);
        indicatorColor = getColor(indicatorImage);
        
        location = zeros(1,2);
        location(1,1) = INDICATORBB(1,1);
        location(1,2) = INDICATORBB(1,2);
        
        indicatorNode = getNodeFromLocation(location, arena, numNodes);
    end
end

