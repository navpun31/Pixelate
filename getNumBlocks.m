function [nRed, nGreen] = getNumBlocks(blockMatrix)
%Gives the number of green and red blocks
    global GREEN
    global RED
    
    [rows, cols] = size(blockMatrix);
    
    nRed = 0;
    nGreen = 0;
    
    for i = 1:(rows*cols)
        if(blockMatrix(i) == RED)
            nRed = nRed + 1;
        elseif(blockMatrix(i) == GREEN)
            nGreen = nGreen + 1;
        end
    end
end

