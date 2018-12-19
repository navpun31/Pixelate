function [path] = dijkstraVia(grid, startNode, endNode, viaNode)
%Gives path from start to end node through "via" node
    grid(startNode) = 1;
    grid(endNode) = 1;
    grid(viaNode) = 1;

    path1 = dijkstra(grid, startNode, viaNode);
    path2 = dijkstra(grid, viaNode, endNode);
    
    [~,path2Length] = size(path2);
    path = cat(2, path1, path2(2:path2Length));%'2' is used to append horizontally
    
    if(path1(1) == -1 || path2(1) == -1)
        path = -1;
    end
end

