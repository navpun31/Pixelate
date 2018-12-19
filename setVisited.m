function [visitedMatrix] = setVisited(visitedMatrix, node)
%sets the node to be visited
    [i,j] = getNodeDimension(node, visitedMatrix);
    visitedMatrix(i,j) = 1;
end

