function [site] = getNextSite(grid, chooseSiteFrom)
%Gives the next block to be moved based on various preferences
    [rows, cols] = size(grid);
    numNodes = rows*cols;
    
    adjacency = getAdjacency(grid);
    numAdjacent = sum(adjacency, 1);
    
    [~, numSites] = size(chooseSiteFrom);
    site = -1;
    if(numSites >= 1)
        site = chooseSiteFrom(1);
        
        for i = 1:numSites
            if(numAdjacent(chooseSiteFrom(i)) > numAdjacent(site) && numAdjacent(chooseSiteFrom(i)) ~= 0)
                site = chooseSiteFrom(i);
            end
        end
    end
    
end

