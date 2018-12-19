function [visited] = isVisited(visitedMatrix, node)
%Checks if the given node is visited or not
    visited = 0;
    [i,j] = getNodeDimension(node, visitedMatrix);
    if(visitedMatrix(i,j) == 1)
        visited = 1;
    end
end

