function [distance] = getDistance(distanceMatrix, node)
%gives the current distance of the node from the startNode 
    [i,j] = getNodeDimension(node, distanceMatrix);
    distance = distanceMatrix(i,j);
end

