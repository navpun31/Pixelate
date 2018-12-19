function [gridMatrix] = getGridMatrix(arena, numNodes)
    [rows, cols, ~] = size(arena); 
    numRows = sqrt(numNodes);
    numCols = sqrt(numNodes);
    
    gridMatrix = zeros(numRows,numCols);
    
    i=1;
    for m=1:numRows
        for k=1:numCols
            im_element = imcrop(arena,[floor(cols/numRows*(m-1)) floor(rows/numCols*(k-1)) floor(cols/8) floor(rows/8)]) ;
%             imtool(im_element);
            if (Check_Black(im_element)>=0.8)
                gridMatrix(i)=1;
            end
            if (Check_White(im_element)>=0.8)
                gridMatrix(i)=1;  
            end
            i=i+1; 
        end
    end
        
    gridMatrix(getCurrNode(arena, numNodes)) = 1;
end

