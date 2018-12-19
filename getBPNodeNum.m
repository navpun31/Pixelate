function [BPNode] = getBPNodeNum(siteNode)
%Gives the corresponding node number in BP matrix from the site node
    global SITENODES
    BPNode = -1;
    
    [~,numSites] = size(SITENODES);
    for i = 1:numSites
        if (SITENODES(i) == siteNode)
            BPNode = i;
            break;
        end
    end
end

