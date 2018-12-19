function [free] = isFreeSite(node, siteMatrix, currNode)
%Checks if the node is an "FREE" node or not
    global BLOCKED
    global SITENODES
    global ALLOWED
    global RED
    global GREEN
    
    for i = 1:15
        siteMatrix(SITENODES(i)) = ALLOWED;
    end
    siteMatrix(node) = BLOCKED;
    
    nodes = [];
    for i = 1:64
        if (isSiteNode(i) == 0 && (siteMatrix(i) == RED || siteMatrix(i) == GREEN))
            nodes = cat(2, nodes, i);
        end
    end
    if(isSiteNode(currNode) == 0)
        nodes = cat(2, nodes, currNode);
    end
    free = checkArena(siteMatrix, cat(2, nodes, node));
end

