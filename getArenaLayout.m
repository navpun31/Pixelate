function [arenaLayout] = getArenaLayout(arena, numNodes)
%Specifies the layout of the arena. Contains INDICATOR, BLACK, SITE, BLUEPRINT
    global INDICATOR
    global BLACK
    global SITE
    global BLUEPRINT
    
    rows = sqrt(numNodes);
    cols = sqrt(numNodes);
    
    for i = 1:rows
        for j = 1:cols
            arenaLayout(i,j) = BLACK;
        end
    end
    
    [~,indicatorNode] = getIndicator(arena, numNodes);
    arenaLayout(indicatorNode) = INDICATOR;
    
    [~,siteNodes] = getSite(arena, numNodes);
    [~,numSites] = size(siteNodes);
    for i = 1:numSites
        arenaLayout(siteNodes(i)) = SITE;
    end
    
    if(numNodes == 64)
        [~,bpNodes] = getBlueprintNodes(arena);
        [~,numBPNodes] = size(bpNodes);
        for i = 1:numBPNodes
            arenaLayout(bpNodes(i)) = BLUEPRINT;
        end
    end
end

