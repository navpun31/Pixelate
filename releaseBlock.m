function [] = releaseBlock(numNodes, currNode, nextNode, com, rgbValues)
%Releases the block from the second last node
    global vid
    global ARENABB
    global BLUEVALUES
    global YELLOWVALUES
    global grabbed
    
    alignAngle(nextNode,numNodes);
    
    %Moveing Forward
    angleFactor = 5;
    distFactor = 7;
    
    arena = getSnap();
    %Vectors
    backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
    botToNode = getVector(getBotCentroid(arena), getNodeCentroid(arena,nextNode,numNodes));
    %Angle to rotate the bot
    angle = getAngle(backToFront, botToNode);
    %Distance to be moved
    distance = toCentimetres(arena, numNodes, getPointsDistance(getNodeCentroid(arena,nextNode, numNodes), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes))));
    
    while(distance > distFactor) 
        %If angle is incorrect
        if((abs(angle) > angleFactor) && angle > 0)
            movementChar = 'r';
        elseif((abs(angle) > angleFactor) && angle < 0)
            movementChar = 'l';
        %If the bot is a little forward or backward
        elseif(abs(angle) <= angleFactor)
            movementChar = 'f';
%         elseif(abs(angle) >= 180 - angleFactor)
%             movementChar = 'b';
        end
        
        %Moving the bot and communicating with arduino
        communicate(com, abs(angle), distance, movementChar);
        
        disp(movementChar);
        disp(angle);
        disp(distance);
        disp('--------------RELEASE BLOCK');
        
        %Updating the values
        arena = getSnap();
        %Vectors
        backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
        botToNode = getVector(getBotCentroid(arena), getNodeCentroid(arena,nextNode,numNodes));
    
        %Angle to rotate the bot
        angle = getAngle(backToFront, botToNode);
        %Distance to be moved
        distance = toCentimetres(arena, numNodes, getPointsDistance(getNodeCentroid(arena,nextNode, numNodes), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes))));
    end
    
    %To release the block
    communicate(com, 0, 0, 'u');
    grabbed = 0;
    disp('RELEASED!!');
    moveToNextNode(numNodes, currNode, com);
end

