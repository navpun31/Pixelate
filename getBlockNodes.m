function [redBlocks, greenBlocks] = getBlockNodes(blockMatrix)
%Gives the nodes that contain green blocks
    global RED
    global GREEN
    
    [rows, cols] = size(blockMatrix);
%     [nRed, nGreen] = getNumBlocks(blockMatrix);
    
    redBlocks = [];
    greenBlocks = [];
    
%     tempR = 1;
%     tempG = 1;
    for i = 1:(rows*cols)
        if(blockMatrix(i) == RED)
%             redBlocks(tempR) = i;
%             tempR = tempR + 1;
            redBlocks = cat(2, redBlocks, i);
        elseif(blockMatrix(i) == GREEN)
%             greenBlocks(tempG) = i;
%             tempG = tempG + 1;
            greenBlocks = cat(2, greenBlocks, i);
        end
    end
end

