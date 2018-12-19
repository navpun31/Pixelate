function [parentMatrix] = setParent(parentMatrix, parentNode, childNode)
%sets the parent of the node
    [ic,jc] = getNodeDimension(childNode, parentMatrix);
    parentMatrix(ic,jc) = parentNode;
end

