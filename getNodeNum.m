function [num] = getNodeNum(i, j, nodes)
%Gives the Node Number(1,2,3,4,5....) of the node (i, j)
    [numRows, ~] = size(nodes);
    num = (j-1)*numRows + i;
end

