function [adjMatrix] = getAdjacency(nodes)
%Produces the 'adjacency' matrix for the given matrix of nodes
%For an mxn given matrix of nodes, an mn x mn matrix is returned with '0'
%representing 'Not Connected' and '1' representing 'Connected'
    [x,y] = size(nodes);
    adjMatrix = zeros(x*y, x*y);
    adjMatrix = updateAdjMatrix(adjMatrix, nodes); %Checking for connected nodes
end

