function [] = pixelateMain()
%THE MAIN FUNCTION TO RUN AT THE EVENT
    numNodes = 64;
    
    %GLOBAL VARIABLES FOR SETTING UP COM AND VIDEO DETECTION
    %SETTING SERIAL CONNECTION
    global com
    global vid
    communicate(com, 0, 0, 'u');
    
    global arena
    %Bounding Boxes
    global ARENABB
    global SITEBB
    global BLUEPRINTBB
    global INDICATORBB
    
    %SETTING SERIAL COMMUNICATION
%     defineCom();
    %VIDEO DETECTION
%     defineVid();

%     preview(vid);
%     [arena , ARENABB] = imcrop(getsnapshot(vid));
%     arena = imrotate(arena, 90);
%     [arena , ARENABB] = imcrop(arena);
    
    %GLOBAL VARIABLES FOR GAME PLAY
    %RGB values
    global REDVALUES
    global GREENVALUES
    global WHITEVALUES
    global BLACKVALUES
    global BLUEVALUES
    global YELLOWVALUES
%     REDVALUES = getMaxMinRGB(arena);
%     GREENVALUES = getMaxMinRGB(arena);
%     WHITEVALUES = getMaxMinRGB(arena);
%     BLACKVALUES = getMaxMinRGB(arena);
%     BLUEVALUES = getMaxMinRGB(arena);
%     YELLOWVALUES = getMaxMinRGB(arena);
%     
%     imtool(seperateColor(arena, REDVALUES));
%     imtool(seperateColor(arena, GREENVALUES));
%     imtool(seperateColor(arena, WHITEVALUES));
%     imtool(seperateColor(arena, BLACKVALUES));
%     imtool(seperateColor(arena, BLUEVALUES));
%     imtool(seperateColor(arena, YELLOWVALUES));
    
    %Colors
    global RED;
    global GREEN;
    global WHITE;
    global BLACK;
    global BLUE;
    global YELLOW;  
    RED = 'R';
    GREEN = 'G';
    WHITE = 'W';
    BLACK = 'B';
    BLUE = 'L';
    YELLOW = 'Y';
    
    %For site matrix
    global ALLOWED
    global BLOCKED
    global FILLED
    global FILLED_INCORRECTLY
    global FREE
    ALLOWED = 'A';
    BLOCKED = 'N';
    FILLED = 'C';
    FILLED_INCORRECTLY = 'V';
    FREE = 'F';
    
    %Temporary variable for generating grid matrix: denotes where blocks(red/green) are kept
    global BLOCK
    global SITE
    global INDICATOR
    global BOT
    global BLUEPRINT
    BLOCK = 'X';
    SITE = 'S';
    INDICATOR = 'I';
    BOT = 'T';
    BLUEPRINT = 'P';
    
    %Grabbed State
    global grabbed
    grabbed = 0;
    
    [SITEBB, BLUEPRINTBB, INDICATORBB] = getBoundingBoxes(arena);
    
    global ARENALAYOUT
    ARENALAYOUT = getArenaLayout(arena, numNodes);
    initialBlockMatrix = getBlockMatrix(arena, numNodes);
    
    global NUMRED
    global NUMGREEN
    [NUMRED, NUMGREEN] = getNumBlocks(initialBlockMatrix);
    
    global INDICATORNODE
    [~, INDICATORNODE] = getIndicator(arena, numNodes);
    
    global SITENODES
    [~,SITENODES] = getSite(arena, numNodes);
    
    global BPMATRIX
    BPMATRIX = getBlueprint(arena);
    
    %FOR PIXELATE(NOT FOR TECHQUILLA)
%     global SITEMATRIX
%     SITEMATRIX = initialBlockMatrix;
%     for i = 1:8
%         for j = 1:8
%             if(ARENALAYOUT(i,j) == SITE)
%                 SITEMATRIX(i,j) = BLOCKED;
%             end
%         end
%     end
%     
%     global SITEPROGRESS
%     SITEPROGRESS = [WHITE WHITE WHITE WHITE WHITE; WHITE WHITE WHITE WHITE WHITE; WHITE WHITE WHITE WHITE WHITE]; 


%-----------------------------------------------------------
% 
% 
% 
% %   PIXELATE QUALIFYING ROUND
%     grid = getGridMatrix(arena, numNodes);
%     
% %     [indicatorColor,~] = getIndicator(arena, numNodes);
% %     blockMatrix = getBlockMatrix(arena, numNodes);
%     
%     %GLOW LED
%     if(indicatorColor == GREEN)
%         disp('GLOW GREEN');
%         communicate(com, 0, 0, 'x');
%     elseif(indicatorColor == RED)
%         disp('GLOW RED');
%         communicate(com, 0, 0, 'y');
%     end
%     
% %     for i = 1:numNodes
% %         if(blockMatrix(i) == GREEN)
% %             greenNode = i;
% %             disp(greenNode);
% % %             grid(greenNode) = 1;
% %         elseif(blockMatrix(i) == RED)
% %             redNode = i;
% %             disp(redNode);
% % %             grid(redNode) = 1;
% %         end
% %     end
%     
%     [redNodes, greenNodes] = getBlockNodes(initialBlockMatrix);
%     if(indicatorColor == GREEN)
%         blockNodes = greenNodes;
%     elseif(indicatorColor == RED) 
%         blockNodes = redNodes;
%     end
%     
%     path = [];
%     start = getCurrNode(arena, numNodes);
%     
%     i = 1;
%     [~, numBlockNodes] = size(blockNodes);
%     while(i <= numBlockNodes)
%         blockNode = blockNodes(i);
%         grid(blockNode) = 1;
%         path = dijkstra(grid, start, blockNode);
%         grid(blockNode) = 0;
%         
%         if(path ~= -1)
%             break;
%         end
%         
%         i = i+1;
%     end
%     
%     grid(blockNode) = 1;
%     path = dijkstra(grid, start, blockNode);
%     grid(blockNode) = 0;
%     
%     disp(grid);
%     disp(getCurrNode(arena, numNodes));
%     disp(indicatorColor);
%     disp(INDICATORNODE);
%     disp(SITENODES);
%     disp(initialBlockMatrix);
%     disp(redNodes);
%     disp(greenNodes);
% %     disp(BPMATRIX);
%     disp(path);
%     
%     i = 2;
%     [~, pathLength] = size(path);
%     while(i < pathLength)
%         disp(path(i));
%         moveToNextNode(numNodes, path(i), com);
%         i = i + 1;
%         pause(1);
%     end
%     
%     currNode = getCurrNode(arena, numNodes);
%     if(indicatorColor == GREEN)
%         disp('GRAB GREEN');
%         grabBlock(numNodes, currNode, path(i), com, GREENVALUES);
%     elseif(indicatorColor == RED)
%         disp('GRAB RED');
%         grabBlock(numNodes, currNode, path(i), com, REDVALUES);
%     end
%     
%     pause(60);
    
%----------------------------------------------------------------
    
    
    %CODE FOR PIXELATE ROUND 2
    redComplete = 0;
    greenComplete = 0;
    completed = 0;
    indicatorChange = 1;
    
    
    disp(INDICATORNODE);
    disp(SITENODES);
    disp(BPMATRIX);
    
    while(completed ~= 1)
        arena = getSnap();
        [indicatorColor,~] = getIndicator(arena, numNodes);
        currIndicatorColor = indicatorColor;
        start = getCurrNode(arena, numNodes);
        
        grid = getGridMatrix(arena, numNodes);
        blockMatrix = getBlockMatrix(arena, numNodes);
        
        disp(grid);
        disp(start);
        disp(indicatorColor);
        disp(blockMatrix);
        
        
        
        
        %NEXT PATH
        [redNodes, greenNodes] = getBlockNodes(blockMatrix);
        [redSites, greenSites] = getBlockSites();
        disp(redNodes);
        disp(greenNodes);
        disp(redSites);
        disp(greenSites);
        
        if(indicatorColor == GREEN)
            blockNodes = greenNodes;
            blockSites = greenSites;
        elseif(indicatorColor == RED) 
            blockNodes = redNodes;
            blockSites = redSites;
        end
    
        path = [];
        
        
        
        chooseBlockFrom = []; %Contains nodes that the next block is to be chosen from
        i = 1;
        [~, numBlockNodes] = size(blockNodes);
        while(i <= numBlockNodes)
            blockNode = blockNodes(i);
            
            if(isCorrectlyPlaced(blockNode, blockSites) == 0)
%                 grid(blockNode) = 1;
%                 path = dijkstra(grid, start, blockNode);
%                 grid(blockNode) = 0;
% 
%                 if(path ~= -1)
%                     break;
%                 end
                chooseBlockFrom = cat(2, chooseBlockFrom, blockNode);
            end
            
            i = i+1;
        end
        
        chooseSiteFrom = [];
        i = 1;
        [~, numBlockSites] = size(blockSites);
        while(i <= numBlockSites)
            blockSite = blockSites(i);
            
            if(blockMatrix(blockSite) == SITE)
                chooseSiteFrom = cat(2, chooseSiteFrom, blockSite);
            end
            
            i = i+1;
        end
        
        
        
        %Getting blockNode and siteNode
        blockNode = getNextBlock(grid, chooseBlockFrom);
        siteNode = getNextSite(grid, chooseSiteFrom);
        
        if(blockNode ~= -1 && siteNode ~= -1)
            path = dijkstraVia(grid, start, siteNode, blockNode);   
            blockColor = currIndicatorColor;
            
            
        elseif(blockNode == -1)
            if(indicatorColor ~= GREEN)
                blockNodes = greenNodes;
                blockSites = greenSites;
            elseif(indicatorColor ~= RED) 
                blockNodes = redNodes;
                blockSites = redSites;
            end

            path = [];

            chooseBlockFrom = []; %Contains nodes that the next block is to be chosen from
            i = 1;
            [~, numBlockNodes] = size(blockNodes);
            while(i <= numBlockNodes)
                blockNode = blockNodes(i);

                if(isCorrectlyPlaced(blockNode, blockSites) == 0)
    %                 grid(blockNode) = 1;
    %                 path = dijkstra(grid, start, blockNode);
    %                 grid(blockNode) = 0;
    % 
    %                 if(path ~= -1)
    %                     break;
    %                 end
                    chooseBlockFrom = cat(2, chooseBlockFrom, blockNode);
                end

                i = i+1;
            end

            chooseSiteFrom = [];
            i = 1;
            [~, numBlockSites] = size(blockSites);
            while(i <= numBlockSites)
                blockSite = blockSites(i);

                if(blockMatrix(blockSite) == SITE)
                    chooseSiteFrom = cat(2, chooseSiteFrom, blockSite);
                end

                i = i+1;
            end
            if(indicatorColor ~= GREEN)
                blockColor = RED;
            elseif(indicatorColor ~= RED) 
                blockColor = GREEN;
            end
        end
        disp(path);
        
        
        
        
        
        %GLOW LED
        if(indicatorChange == 1)
            if(currIndicatorColor == GREEN)
                disp('GLOW GREEN');
                communicate(com, 0, 0, 'x');
            elseif(currIndicatorColor == RED)
                disp('GLOW RED');
                communicate(com, 0, 0, 'y');
            end
            
            indicatorChange = 0;
        end
        disp(currIndicatorColor);
        
        
        
        
        
        %MOVING
        i = 2;
        [~, pathLength] = size(path);
        while(currIndicatorColor == indicatorColor && i <= pathLength)
            if(path(i) == blockNode)
                if(blockColor == GREEN)
                    grabBlock(numNodes, path(i-1), path(i), com, GREENVALUES);
                elseif(blockColor == RED)
                    grabBlock(numNodes, path(i-1), path(i), com, REDVALUES);
                end
            elseif(i == pathLength)
                if(blockColor == GREEN)
                    releaseBlock(numNodes, path(i-1), path(i), com, GREENVALUES);
                elseif(blockColor == RED)
                    releaseBlock(numNodes, path(i-1), path(i), com, REDVALUES);
                end
            else
                moveToNextNode(numNodes, path(i), com);
            end
            
            pause(1);
            
            i = i + 1;
            arena = getSnap();
            [indicatorColor,~] = getIndicator(arena, numNodes);
            if(i <= pathLength)
                alignAngle(path(i),numNodes);
            end
        end
        
        
        
        
        
        %CHECKING COMPLETION
        arena = getSnap();
        blockMatrix = getBlockMatrix(arena, numNodes);
        [redNodes, greenNodes] = getBlockNodes(blockMatrix);
        [redSites, greenSites] = getBlockSites();
        
        [~,nRedBlocks] = size(redNodes);
        [~,nGreenBlocks] = size(greenNodes);
        
        redNodes = sort(redNodes, 2);
        greenNodes = sort(greenNodes, 2);
        redSites = sort(redSites, 2);
        greenSites = sort(greenSites, 2);
        
%         redComplete = 1;
%         greenComplete = 1;
%         completed = 1;
%         for i = 1:nRedBlocks
%             if(redNodes(i) ~= redSites(i))
%                 redComplete = 0;
%                 completed = 0;
%             end
%         end
%         for i = 1:(nGreenBlocks-1)
%             if(greenNodes(i) ~= greenSites(i))
%                 greenComplete = 0;
%                 completed = 0;
%             end
%         end
        
        
        
        
        if(completed == 1)
            %GLOW BLUE LED
            disp('COMPLETED');
            disp('GLOW BLUE');
            communicate(com, 0, 0, 'z');
        elseif(redComplete == 1 || greenComplete == 1)
            %GLOW BLUE LED
            disp('COLOR COMPLETED');
            disp('GLOW BLUE');
            communicate(com, 0, 0, 'z');
            while(currIndicatorColor == indicatorColor)
                [indicatorColor,~] = getIndicator(arena, numNodes);
                pause(0.5);
            end
        elseif(currIndicatorColor ~= indicatorColor)
            indicatorChange = 1;
            
            if(grabbed == 1)
                releaseBot(numNodes, path(i-2), path(i-1), com);
            end
        end
    end
    
    
%----------------------------------------------------------------------
    
    
    %CLOSING THE COMMUNICATION PORT
    %fclose(com);
end
     
%     %CODE FOR TECHQUILLA
%     completed = 0;
%     while(~completed)
%         arena = getSnap();
%         [indicatorColor,~] = getIndicator(arena, numNodes);
%         currIndicatorColor = indicatorColor;
%         start = getCurrNode(arena, numNodes);
%         
%         grid = getGridMatrix(arena, numNodes);
%         disp(grid);
%         disp(getCurrNode(arena, numNodes));
%         
%         blockMatrix = getBlockMatrix(arena, numNodes);
%         
%         disp(indicatorColor);
%         disp(INDICATORNODE);
%         disp(SITENODES);
%         disp(blockMatrix);
%         
%         [redNodes, greenNodes] = getBlockNodes(blockMatrix);
%         disp(redNodes);
%         disp(greenNodes);
%         
%         %CHANGE
%         if(currIndicatorColor == GREEN)
%             greenNode = greenNodes(1);
%             path = dijkstraVia(grid, start, SITENODES(1), greenNode);
%         elseif(currIndicatorColor == RED)
%             redNode = redNodes(1);
%             path = dijkstraVia(grid, start, SITENODES(1), redNode);
%         end
%         %
%         disp(path);
%         %GLOW LED
%         disp('GLOW');
%         disp(currIndicatorColor);
%         i = 2;
%         [~, pathLength] = size(path);
%         while(currIndicatorColor == indicatorColor && i <= pathLength)
%             if(blockMatrix(path(i)) == indicatorColor)
%                 if(indicatorColor == GREEN)
%                     grabBlock(numNodes, path(i-1), path(i), com, GREENVALUES);
%                 elseif(indicatorColor == RED)
%                     grabBlock(numNodes, path(i-1), path(i), com, REDVALUES);
%                 end
%             elseif(blockMatrix(i) == SITE)
%                 releaseBot(numNodes, path(i-1), path(i), com);
%             else
%                 moveToNextNode(numNodes, path(i), com);
%             end
%             
%             i = i + 1;
%             arena = getSnap();
%             [indicatorColor,~] = getIndicator(arena, numNodes);
%             if(i <= pathLength)
%                 alignAngle(path(i),numNodes);
%             end
%         end
%         if(i == pathLength)
%             completed = 1;
%             %GLOW LED
%             disp('GLOW BLUE');
%         elseif(grabbed == 1)
%             releaseBot(numNodes, path(i-2), path(i-1), com);
%         end
%     end

