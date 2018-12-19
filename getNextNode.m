function [node] = getNextNode(visitedMatrix,distanceMatrix, node)
%gives the next 'currNode' by searching the node having the next least
%distance from the starting point(i.e. from the unvisited nodes)
    [rows, cols] = size(visitedMatrix);
    totalNodes = rows*cols;
    minDist = inf;
    node = -1; %Returns -1 if there exists no next node i.e. the start node and end node are not connected
    
    for i = 1:totalNodes
        if(~isVisited(visitedMatrix,i) && getDistance(distanceMatrix,i) < minDist)
            minDist = getDistance(distanceMatrix,i);
            node = i;
        end
    end
end

