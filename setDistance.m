function [distanceMatrix] = setDistance(distanceMatrix, distance, node)
%sets the distance of the node from the start node
    [i,j] = getNodeDimension(node, distanceMatrix);
    distanceMatrix(i,j) = distance;
end

