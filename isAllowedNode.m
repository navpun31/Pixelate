function [allowed] = isAllowedNode(node, siteMatrix, currNode)
%Checks if the node is an "ALLOWED" node or not
    global BLOCKED
    global RED
    global GREEN
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
    allowed = checkArena(siteMatrix, cat(2, node, nodes));
end

