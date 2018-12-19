function [adjMatrix] = updateAdjMatrix(adjMatrix, nodes)
%Column-wise checking for connected nodes
    [x,y] = size(nodes);
    for i = 1:x
        for j = 1:y
            %Row-wise checking for connected nodes
            if((j ~= 1) & (nodes(i,j) == 1) & (nodes(i,j-1) == 1))
                adjMatrix(getNodeNum(i,j,nodes), getNodeNum(i,j-1,nodes)) = 1;
                adjMatrix(getNodeNum(i,j-1,nodes), getNodeNum(i,j,nodes)) = 1;
            end
            %Column-wise checking for connected nodes
            if((i ~= 1) & (nodes(i,j) == 1) & (nodes(i-1,j) == 1))
                adjMatrix(getNodeNum(i,j,nodes), getNodeNum(i-1,j,nodes)) = 1;
                adjMatrix(getNodeNum(i-1,j,nodes), getNodeNum(i,j,nodes)) = 1;
            end
        end
    end
end

