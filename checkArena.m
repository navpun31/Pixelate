function [validity] = checkArena(siteMatrix, nodes)
% Checks if arena is valid or not. Checking the arena if any unplaced block is blocked from the bot or not.
% Check if all the unplaced blocks are connected to each other or not through the Black region of arena and the 'B' or 'W' part of the construction site.
% Returns if the arena is "valid" or "invalid", i.e., is all the blocks are accessible or not.
    global BLACK
    global RED
    global GREEN
    global WHITE
    global ALLOWED
    global BLOCKED
    global FILLED
    global FILLED_INCORRECTLY
    global FREE
    global BOT
    
    validity = 1;
    
    [rows, cols] = size(siteMatrix);
    grid = zeros(rows, cols);
    
    for i = 1:rows
        for j = 1:cols
            if(siteMatrix(i,j) == BOT || siteMatrix(i,j) == BLOCKED || siteMatrix(i,j) == BLACK || siteMatrix(i,j) == RED || siteMatrix(i,j) == GREEN || siteMatrix(i,j) == WHITE || siteMatrix(i,j) == FILLED_INCORRECTLY)
                grid(i,j) = 1;
            end
        end
    end
    
    [~, checkNodes] = size(nodes);
    for i = 1:checkNodes
        for j = i:checkNodes
            path = dijkstra(grid, nodes(i), nodes(j));
            if(path(1) == -1)
                validity = 0;
                break;
            end
        end
    end
end

