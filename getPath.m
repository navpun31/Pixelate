function [path] = getPath(parentMatrix, startNode, endNode)
%give the path to be traversed by the bot
    path = [];
    
    currNode = endNode;
    while(currNode ~= 0)
        path = cat(2, path, currNode);%'2' is used to append horizontally
        currNode = getParent(parentMatrix,currNode);
    end

    path = fliplr(path);
end

