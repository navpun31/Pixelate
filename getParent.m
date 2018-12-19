function [parentNode] = getParent(parentMatrix, node)
%gives the current partent of the node. gives 0 if theres no parent 
    [i,j] = getNodeDimension(node, parentMatrix);
    parentNode = parentMatrix(i,j);
end

