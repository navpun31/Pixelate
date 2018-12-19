function [angle, distance] = getAngleDistance(arena, numNodes, nextNode)
%Gives Angle to rotate the bot and Distance to be moved
    global BLUEVALUES
    global YELLOWVALUES

    %Vectors
    backToFront = getVector(getCentroid(seperateColor(arena, BLUEVALUES)), getCentroid(seperateColor(arena, YELLOWVALUES)) );
    botToNode = getVector(getBotCentroid(arena), getNodeCentroid(arena,nextNode,numNodes));
    
    %Angle to rotate the bot
    angle = getAngle(backToFront, botToNode);
    
    %Distance to be moved
    distance = toCentimetres(arena, numNodes, getPointsDistance(getBotCentroid(arena), getNodeCentroid(arena,nextNode,numNodes)));
end

