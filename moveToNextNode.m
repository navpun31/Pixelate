function [] = moveToNextNode(numNodes, nextNode, com)
%Moves the bot from currNode to nextNode
    global vid
    global ARENABB
    
    arena = getSnap();
    [angle, distance] = getAngleDistance(arena, numNodes, nextNode);
    
%     while((abs(angle) > 5 && abs(angle) < 175) && distance > 5) 
%     This cannot be done because when bot is to the right of the nextNode
%     centroid then angle will be 90degrees and it will keep turning. May
%     result in continuous unrequired turning of the bot.

    angleFactor = 10;
    distFactor = 8;
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
        
        disp(nextNode);
        disp(angle);
        disp(distance);
        disp(movementChar);
        
        disp('----------MOVE TO NEXT NODE');
        %Updating the values
        arena = getSnap();
        [angle, distance] = getAngleDistance(arena, numNodes, nextNode);
    end
end

