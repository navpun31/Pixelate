function [blockMatrix] = getBlockMatrix(arena, numNodes)
% Gives the matrix containing information about the blocks(red/green) on the
% arena. Takes in blockMatrix which already has info about
% indicator/blueprint etc.
    global RED
    global GREEN
    global REDVALUES
    global GREENVALUES
    global BLACK
    global SITE
    
    [arenaRows, arenaCols, ~] = size(arena);
    rows = sqrt(numNodes);
    cols = sqrt(numNodes);
   
    blockMatrix = getArenaLayout(arena, numNodes);
    
    nodeHeight = arenaRows/rows;
    nodeWidth = arenaCols/cols;
    RF = nodeWidth*0.1; %reducing factor - by which the blockImage gets cropped(only the center of the image is tested for color)
    
    for i = 1:rows
        for j  = 1:cols
            if(blockMatrix(i,j) == BLACK || blockMatrix(i,j) == SITE)
                blockImage = imcrop(arena, [((j-1)*nodeWidth+RF) ((i-1)*nodeHeight+RF) (nodeWidth-2*RF) (nodeHeight-2*RF)]);
%                 imtool(blockImage);
%                 if(getColor(blockImage) == RED)
%                     blockMatrix(i,j) = RED;
%                 end
%                 if(getColor(blockImage) == GREEN)
%                     blockMatrix(i,j) = GREEN;
%                 end
                redBW = seperateColor(blockImage, REDVALUES);
                [redLabel, nRed] = bwlabel(redBW);
                statsRed = regionprops(redLabel, 'Area', 'Centroid', 'BoundingBox');
                
                greenBW = seperateColor(blockImage, GREENVALUES);
                [greenLabel, nGreen] = bwlabel(greenBW);
                statsGreen = regionprops(greenLabel, 'Area', 'Centroid', 'BoundingBox');
                
%                 if statsRed(1).Area > ((rows*cols)/numNodes)*0.08 %if area of the label > 0.7 times area of one node -- 0.7 is multiplied incase the area of label becomes sligtly smaller than area of 1 node
%                     blockMatrix(i,j) = RED;
%                 end
%                 if statsGreen(1).Area > ((rows*cols)/numNodes)*0.08 %if area of the label > 0.7 times area of one node -- 0.7 is multiplied incase the area of label becomes sligtly smaller than area of 1 node
%                     blockMatrix(i,j) = GREEN;
%                 end

                if nRed == 1
                    blockMatrix(i,j) = RED;
                end
                if nGreen == 1
                    blockMatrix(i,j) = GREEN;
                end

            end
        end
    end
end

