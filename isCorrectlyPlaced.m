function [correct] = isCorrectlyPlaced(node, siteNodes)
%checks if the block on 'node' is correctly placed or not
    [~, nSites] = size(siteNodes);
    
    correct = 0;
    for i = 1:nSites
        if(siteNodes(i) == node)
            correct = 1;
        end
    end

end

