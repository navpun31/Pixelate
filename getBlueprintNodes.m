function [bpImage, bpNodes] = getBlueprintNodes(arena)
%Gives the image of the blueprint and its nodes
    global BLUEPRINTBB
    
    bpImage = imcrop(arena, BLUEPRINTBB);
    
    location = zeros(1,2);
    location(1,1) = BLUEPRINTBB(1,1);
    location(1,2) = BLUEPRINTBB(1,2);
    
    node1 = getNodeFromLocation(location, arena, 64);
    bpNodes = [node1, node1 + 8];
end

