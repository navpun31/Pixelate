function [centroid] = getNodeCentroid(arena, node, numNodes)
%Gives the centroid of the specified node
    [rows, cols, ~] = size(arena);
    numRows = sqrt(numNodes);
    numCols = sqrt(numNodes);
    
    [i, j] = getNodeDimension(node, zeros(numRows,numCols));
    
    centX = (j-1)*(cols/numCols) + (cols/numCols)/2;
    centY = (i-1)*(rows/numRows) + (rows/numRows)/2;
    centroid = [centX centY];
end

