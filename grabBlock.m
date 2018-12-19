function [] = grabBlock(numNodes, currNode, nextNode, com, rgbValues)
%On the second last node aligns the bot to move to the last node(having the
%block) 
    global vid
    global ARENABB
    global BLUEVALUES
    global YELLOWVALUES
    global grabbed
    blockLength = 10;
    botLength = 12;
    
    alignAngle(nextNode,numNodes);
    
    arena = getSnap();
    %Vectors
    backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
    botToBlock = getVector(getBotCentroid(arena), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes)));
    %Angle to rotate the bot
    angle = getAngle(backToFront, botToBlock);
    %Distance to be moved
    distance = toCentimetres(arena, numNodes, getPointsDistance(getBotCentroid(arena), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes))));
    distance = distance - (blockLength + botLength)/2;
    
    angleFactor = 5;
    distFactor = 3 + (blockLength + botLength)/2;
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
        disp('--------------GRAB BLOCK');
        
        %UPDATING THE VALUES
        arena = getSnap();
        %Vectors
        backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
        botToBlock = getVector(getBotCentroid(arena), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes)));
        %Angle to rotate the bot
        angle = getAngle(backToFront, botToBlock);
        %Distance to be moved
        distance = toCentimetres(arena, numNodes, getPointsDistance(getBotCentroid(arena), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes))));
        distance = distance - (blockLength + botLength)/2;
    end
    
    angleFactor = 2.5;
    %Correcting the Angle
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
        disp('--------------GRAB BLOCK ALIGNING');
        
        %UPDATING THE VALUES
        arena = getSnap();
        %Vectors
        backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
        botToBlock = getVector(getBotCentroid(arena), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes)));
        %Angle to rotate the bot
        angle = getAngle(backToFront, botToBlock);
        %Distance to be moved
%         distance = toCentimetres(arena, numNodes, getPointsDistance(getBotCentroid(arena), getCentroid(seperateBlock(arena, [currNode, nextNode], rgbValues, numNodes))));
    end
     
    %To grab the block
    communicate(com, 0, 0, 'd');
    disp('GRABBED!!');
    grabbed = 1;
end


%TRIAL CODE FOR THE COVERED HANDLE

%     %Vectors
%     backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
%     botToBlock = getVector(getBotCentroid(arena), getCentroid(seperateBlock(arena, nextNode, rgbValues, numNodes)));
%     
%     %Angle to rotate the bot
%     angle = getAngle(backToFront, botToBlock);  
%     %Distance to be moved
%     distance = toCentimetres(arena, numNodes, getPointsDistance(getBotCentroid(arena), getCentroid(seperateBlock(arena, nextNode, rgbValues, numNodes))));
%     
%     angleFactor = 2.5;
%     %Correcting the Angle
%     while((abs(angle) > angleFactor && abs(angle) < 180 - angleFactor))
%         %If angle is incorrect
%         if(angle > 0)
%             movementChar = 'r';
%         elseif(angle < 0)
%             movementChar = 'l';
%         end
%         
%         %Moving the bot and communicating with arduino
%         communicate(com, abs(angle), distance, movementChar);
%         
%         %Updating the values
%         arena = imcrop(getsnapshot(vid), ARENABB);
%         
%     
%         backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
%         botToBlock = getVector(getBotCentroid(arena), getCentroid(seperateBlock(arena, nextNode, rgbValues, numNodes)));
%     
%         %Angle to rotate the bot
%         angle = getAngle(backToFront, botToBlock);  
%         %Distance to be moved
%         distance = toCentimetres(arena, numNodes, getPointsDistance(getBotCentroid(arena), getCentroid(seperateBlock(arena, nextNode, rgbValues, numNodes))));
%     end
%     
%     bwImage = seperateBlock(arena, nextNode, rgbValues, numNodes);
%     [label, n] = bwlabel(bwImage);
%     stats = regionprops(label, 'Area', 'Centroid', 'BoundingBox');
%     
%     while(n ~= 0 && stats(n).Area > 2) 
%         distance = 4;
%         %Moving the bot and communicating with arduino
%         communicate(com, 0, distance, 'f');
%         %Updating the values
%         arena = imcrop(getsnapshot(vid), ARENABB);
%         bwImage = seperateBlock(arena, nextNode, rgbValues, numNodes);
%         [label, n] = bwlabel(bwImage);
%         stats = regionprops(label, 'Area', 'Centroid', 'BoundingBox');
%         if n~= 0
%             disp(stats(n).Area);
%         end
%     end
%     disp(n);

