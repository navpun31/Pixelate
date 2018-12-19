function [site, siteNodes] = getSite(arena,  numNodes)
%Give the image of the Construction site
    global WHITEVALUES
    global SITEBB
    
    [rows, cols, ~] = size(arena);
    
    if(numNodes == 25)
        whiteBW = seperateColor(arena, WHITEVALUES);
        [whiteLabel, n] = bwlabel(whiteBW);
        stats = regionprops(whiteLabel, 'Area', 'Centroid', 'BoundingBox');
        location = [cols, rows];


        if(numNodes == 64)
            gridWidth = cols*3/8;
            gridHeight = rows*5/8;
        end
        if(numNodes == 25)
            gridWidth = cols*1/5;
            gridHeight = rows*1/5;
        end

        for i = 1:n
            if stats(i).Area > ((rows*cols)/numNodes)*0.5 %if area of the label > 0.7 times area of one node -- 0.7 is multiplied incase the area of label becomes sligtly smaller than area of 1 node
                if stats(i).BoundingBox(1,1) < location(1,1) 
                    location(1,1) = stats(i).BoundingBox(1,1);
                end
                if stats(i).BoundingBox(1,2) < location(1,2)
                    location(1,2) = stats(i).BoundingBox(1,2);
                end
            end
        end
        site = imcrop(arena, [location(1,1) location(1,2) gridHeight gridWidth]);

        siteNodes = getNodeFromLocation(location, arena, numNodes);
    end
    
    if(numNodes == 64)
        site = imcrop(arena, SITEBB);
        
        location = zeros(1,2);
        location(1,1) = SITEBB(1,1);
        location(1,2) = SITEBB(1,2);
        
        siteNode1 = getNodeFromLocation(location, arena, numNodes);
        siteNodes = zeros(1,15);
        for j = 1:5
            for i = 1:3
                siteNodes(3*(j-1) + i) = siteNode1 + 8*(j-1) + (i-1);
            end
        end
    end
end

