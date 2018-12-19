function [path] = dijkstra(allowedNodes, startNode, endNode)
%Uses the DIJKSTRA ALGORITHM to compute the shortest path from start to end
    [rows, cols] = size(allowedNodes);
    totalNodes = rows*cols;
    
    parent = zeros(rows,cols);%stores the parent of the respective allowedNodes(through which we get the minimum path)
    visited = zeros(rows,cols);%'0' for unvisited allowedNodes and '1' for visited allowedNodes
    distance = inf(rows,cols);
    adjacency = getAdjacency(allowedNodes);
    
    currNode = startNode;
    distance = setDistance(distance, 0, startNode);
    
    while(~isVisited(visited, endNode) && currNode ~= -1)
        for i = 1:totalNodes
            if(adjacency(currNode,i) == 1 && (getDistance(distance,i) > getDistance(distance,currNode)+1))
                parent = setParent(parent, currNode, i);%updates the parent of node i;
                distance = setDistance(distance, getDistance(distance,currNode)+1,i);%updates the distance from startNode of the node i
            end
        end
        visited = setVisited(visited,currNode);
        %Required as getNextNode will return -1 if the there is no next
        %node left to be checked after the endNode
        if(currNode ~= endNode || (getNextNode(visited, distance, currNode) ~= -1))
            currNode = getNextNode(visited, distance, currNode);
        end
    end
    
    if(currNode ~= -1)
        path = getPath(parent, startNode, endNode);
    else
        path = -1; %Means that the start node and end node are not connected
    end
end
