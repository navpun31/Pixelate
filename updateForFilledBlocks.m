function [siteMatrix] = updateForFilledBlocks(blockMatrix, siteMatrix, currNode)
%
    global SITENODES
    global BPMATRIX
    global RED
    global GREEN
    global FILLED
    global FILLED_INCORRECTLY
   
    nodeSequence = [1 2 3 7 8 9 13 14 15 4 5 6 10 11 12];
    for j = 1:15
        nodeInBP = getBPNodeNum(SITENODES(i));
        i = nodeSequence(j);
        node = SITENODES(i);
        if((blockMatrix(node) == RED  || blockMatrix(node) == GREEN))
            if(canBeUpdated(node, siteMatrix, currNode) == 1 && BPMATRIX(nodeInBP) == blockMatrix(node))
                siteMatrix(node) = FILLED;
            else
                siteMatrix(node) = FILLED_INCORRECTLY;
            end
        end
    end
end