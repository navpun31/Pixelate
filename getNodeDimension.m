function [row,col] = getNodeDimension(nodeNum, nodes)
%Gives the (i,j) dimension of the 'nodeNum' in the matrix 'nodes'
    [numRows,~] = size(nodes);
    row = mod(nodeNum,numRows);
    %For the last row mod(,) = 0
    if(row == 0)
        row = numRows;
    end
    col = ((nodeNum - row)/numRows) + 1;
end

