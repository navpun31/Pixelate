function [nodeNum] = getNodeFromLocation(location, arena, numNodes)
%Gives the node number from the location of a point
    [rows, cols, ~] = size(arena);
    
    numRows = sqrt(numNodes);
    numCols = sqrt(numNodes);
    
    nodeI = round(location(1,2)/(rows/numRows)) + 1;
    nodeJ = round(location(1,1)/(cols/numCols)) + 1;
    nodeNum = getNodeNum(nodeI,nodeJ,zeros(numRows,numCols));

end

