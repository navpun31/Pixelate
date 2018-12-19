function [] = alignAngle(nextNode,numNodes)
%Aligns according to the nextNode
    global vid
    global com
    global ARENABB
    global BLUEVALUES
    global YELLOWVALUES
    
    angleFactor = 10;
    
    arena = getSnap();
    %Vectors
    backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
    botToNode = getVector(getBotCentroid(arena), getNodeCentroid(arena,nextNode,numNodes));
    %Angle to rotate the bot
    angle = getAngle(backToFront, botToNode);
    %Distance to be moved
    %distance = toCentimetres(arena, numNodes, getNodeCentroid(arena,nextNode, numNodes), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes)));

    while(abs(angle) > angleFactor)
        %If angle is incorrect
        if(angle > 0)
            movementChar = 'r';
        elseif(angle < 0)
            movementChar = 'l';
        end
        
        %Moving the bot and communicating with arduino
        communicate(com, abs(angle), 0, movementChar);
        
        disp(movementChar);
        disp(angle);
        disp('------------ALIGN ANGLE');
        
        %UPDATING THE VALUES
        arena = getSnap();
        %Vectors
        backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
        botToNode = getVector(getBotCentroid(arena), getNodeCentroid(arena,nextNode,numNodes));
        %Angle to rotate the bot
        angle = getAngle(backToFront, botToNode);
        %Distance to be moved
        %distance = toCentimetres(arena, numNodes, getNodeCentroid(arena,nextNode, numNodes), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes)));
    end
end

