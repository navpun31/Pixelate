function [siteMatrix] = updateSiteMatrix(siteMatrix, currNode)
%Updates the site matrix
    global SITENODES
    global BPMATRIX
    global ALLOWED
    global BLOCKED
    global FREE
    global WHITE
    
    for i = 1:15
        node = getBPNodeNum(SITENODES(i));
        if(BPMATRIX(node) == WHITE)
            siteMatrix(SITENODES(i)) = WHITE;
        end
    end
    
    nodeSequence = [1 2 3 7 8 9 13 14 15 4 5 6 10 11 12];
    for j = 1:15
        i = nodeSequence(j);
        node = SITENODES(i);
        if(siteMatrix(node) == BLOCKED && canBeUpdated(node, siteMatrix, currNode) == 1)
            if(isAllowedNode(node, siteMatrix, currNode) == 1)
                siteMatrix(node) = ALLOWED;
            end
            if(isFreeNode(node, siteMatrix, currNode) == 1)
                siteMatrix(node) = FREE;
            end
        end
    end
end

