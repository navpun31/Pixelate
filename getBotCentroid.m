function [centroid] = getBotCentroid(arena)
%Returns the centroid of the bot as (X,Y)
    global YELLOWVALUES
    global BLUEVALUES
    global TEMPVALUES
    
    %handleCentroid = getCentroid(seperateColor(arena, TEMPVALUES)); 
    frontCentroid = getCentroid(seperateColor(arena, YELLOWVALUES));
    backCentroid = getCentroid(seperateColor(arena, BLUEVALUES));
    
    %centroid = ((frontCentroid + backCentroid)/2 + (frontCentroid + handleCentroid)/2)/2;
    centroid = (frontCentroid + backCentroid)/2;
end

