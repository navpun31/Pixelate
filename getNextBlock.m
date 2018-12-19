function [block] = getNextBlock(grid, chooseBlockFrom)
%Gives the next block to be moved based on various preferences
    [rows, cols] = size(grid);
    numNodes = rows*cols;
    
    adjacency = getAdjacency(grid);
    numAdjacent = sum(adjacency, 1);
    
    [~, numBlocks] = size(chooseBlockFrom);
    block = -1;
    if(numBlocks >= 1)
        block = chooseBlockFrom(1);
%         
%         for i = 1:numBlocks
%             if(numAdjacent(chooseBlockFrom(i)) < numAdjacent(block) && numAdjacent(chooseBlockFrom(i)) ~= 0)
%                 block = chooseBlockFrom(i);
%             end
%         end
        
        for i = 1:numBlocks
            if(isSiteNode(chooseBlockFrom(i)) && numAdjacent(chooseBlockFrom(i)) ~= 0)
                block = chooseBlockFrom(i);
            end
        end
    end
    
end

